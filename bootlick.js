// 基本参数配置
var Browser = function() {
    var browser = {
        opera: 0,
        ie: 0,
        chrome: 0,
        firefox: 0,
        safari: 0,
        konq: 0,
        name: 0,
        version: 0
    }
    var n = navigator.userAgent,
        b = browser;
    if (window.opera) {
        b.version = window.opera.version();
        b.opera = parseFloat(b.version);
        b.name = 'oprea';
    } else if (/AppleWebKit\/(\S+)/.test(n)) {
        if (/Chrome\/(\S+)/.test(n)) {
            b.version = RegExp["$1"];
            b.chrome = parseFloat(b.version);
            b.name = 'chrome';
        } else if (/Version\/(\S+)/.test(n)) {
            b.version = RegExp["$1"];
            b.safari = parseFloat(b.version);
            b.name = 'safari';
        }
    } else if (/KHTML\/(\S+)/.test(n) || /Konqueror\/([^;]+)/.test(n)) {
        b.version = RegExp["$1"];
        b.konq = parseFloat(b.version);
        b.name = 'konq';
    } else if (/Firefox\/(\S+)/.test(n)) {
        b.version = RegExp["$1"];
        b.firefox = parseFloat(b.version);
        b.name = 'firefox';
    } else if (/MSIE ([^;]+)/.test(n)) {
        b.version = RegExp["$1"];
        b.ie = parseFloat(b.version);
        b.name = 'ie';
    }
    return browser;
}();
var showBrowser = function() {
    var html = '<div class="browser">';
    html += '<div class="browserCover"></div>';
    html += '<div class="browserText">';
    html += '<span class="closeBrowser" onclick="$(this.parentNode.parentNode).remove();" title="关闭">&times;</span>';
    html += '<p>为了更好的体验微喵功能，建议您使用谷歌浏览器</p>';
    html += '<a href="http://dl-sh-ctc-2.pchome.net/31/dt/52.0.2743.82_chrome_installer.zip" target="_blank">下载谷歌浏览器</a>';
    html += '</div></div>';
    $(html).appendTo($('body'));
}
var useKeyBroad = function() {
    $(window).bind('keydown', function(ev) {
        switch (ev.keyCode) {
            case 97:
            case 49:
                window.location.href = $('.toBack').attr('href');
                break;
        }
    })
}


// dialog公共方法
var dialog = {
    show: function(dom) {
        dom.find('.weui-mask, .weui-dialog').fadeIn();
    },

    close: function(dom) {
        dom.find('.weui-mask, .weui-dialog').fadeOut();
    }
}

// ajax公共方法
var ajaxFun = function(url, data, fn, efn) {
    $.ajax({
        url: url,
        type: 'post',
        data: data,
        dataType: 'json',
        success: fn,
        error: efn
    })
}

// 未开始进入游戏
var step1 = {
    // 点击进入游戏触发事件
    gameInit: function() {
        let u = config.url + config.port2;
        ajaxFun(u + '/sendBootlickBetBegin', config.basicData, this.gameInitSuccess)
    },

    // 成功回调
    gameInitSuccess: function(data) {
        if (data.isResultTrue) {
            changeState(jumpEvt);
        }
    }
}

// 押注页面
var step2 = {
    url: '',
    total: 0, //本场押注总批数
    timer: null,
    userHoserData: [],
    pids: '',
    btnState: false,
    init: function() {
        this.loopBootlickUserBuy();
    },

    // 轮询获取马匹购买数量
    loopBootlickUserBuy: function() {
        let apiurl = this.url + '/loopBootlickUserBuy';
        ajaxFun(apiurl, config.basicData, this.loopBootSuccess, this.loopBootError)
    },

    // 轮询成功回调
    loopBootSuccess: function(data) {
        if (data.isResultTrue) {
            let info = JSON.parse(data.resultMsg);
            step2.pids = info.pids;
            step2.total = 0;
            $('#homeWrap .weui-grids .yz-num').each(function(i) {
                let n = info['horse' + (Number(i) + 1)];
                step2.total += Number(n);
                $(this).html(n);
            })
            $('#homeWrap .yz-total-num').html(step2.total);
            $('#homeWrap .yz-luck-num').html(info['lucky']);
            // $('.dialog-luck-num').val(info['lucky']);
        }
        step2.timer = setTimeout(res => {
            step2.loopBootlickUserBuy();
        }, 3000)
    },

    // 轮询失败回调
    loopBootErro: function(res) {
        step2.timer = setTimeout(res => {
            step2.loopBootlickUserBuy();
        }, 1000);
    },

    // 彩头设置
    setBootlickBarLucky: function() {
        let apiurl = this.url + '/setBootlickBarLucky',
            luckNum = $('.dialog-luck-num').val(),
            reg = /^[1-9]\d*$/;
        if (luckNum == '' || !luckNum || luckNum < 0 || !reg.test(luckNum)) {
            msg('请输入有效的正整数彩头数量');
            return;
        }
        let data = {
            barid: config.barid,
            infoid: config.infoid,
            lucky: luckNum
        }
        ajaxFun(apiurl, data, this.setLuckySuccess, this.setLuckyError)
    },

    // 彩头设置成功回调
    setLuckySuccess: function(res) {
        if (res.isResultTrue) {
            step2.loopBootlickUserBuy();
            step2.dialogHide()
        }
    },

    // 彩头设置失败回调
    setLuckyError: function(res) {
        console.log(res)
    },

    // 批量退款
    refundConfirm: function() {
        step2.dialogHide();
        $('.refund-dialog').show();
        let apiurl = this.url + '/bootlickRefundanimAll',
            data = {
                barid: config.barid,
                pids: this.pids
            }
        ajaxFun(apiurl, data, this.refundSuccess)
    },

    // 退款成功回调
    refundSuccess: function(res) {
        $('.refund-dialog').hide();
        if (res.isResultTrue) {
            window.location.reload();
        }
    },

    // 弹出层显示, type: 1、押注，2、规则
    dialogShow: function(type) {
        let dom;
        if (type == 1) {
            $('.dialog-luck-num').val('');
            dom = $('.dialog-yz')
        } else if (type == 2) {
            dom = $('.dialog-rule')
        } else {
            dom = $('.dialog-refund')
        }
        $('#homeWrap').addClass('filter');
        dialog.show(dom)
    },

    // 弹出层隐藏
    dialogHide: function() {
        let dom = $('.dialog-yz, .dialog-rule, .dialog-refund');
        $('#homeWrap').removeClass('filter');
        dialog.close(dom)
    },

    // 获取用户选马信息
    getUserHorseInfo: function() {
        if ($('#homeWrap .yz-total-num').text() == 0) {
            msg('当前未押注数量，暂不能开始游戏');
            return;
        }
        if (!this.btnState) {
            this.btnState = true;
            let u = '';
            ajaxFun(u + '/getBootlickUserHorse', config.basicData, this.userHorseSuccess)
        }
    },

    // 获取用户选马成功回调
    userHorseSuccess: function(res) {
        if (res.isResultTrue) {
            localStorage.setItem('userHoserData', res.resultMsg);
            step2.userHoserData = JSON.parse(res.resultMsg);
            step2.gameBegin(res.resultMsg);
        } else {
            step2.btnState = false;
        }
    },

    // 押注结束，游戏开始
    gameBegin: function(msg) {
        let u = config.url + config.port2,
            data = {
                infoid: config.infoid,
                barid: config.barid,
                message: msg
            }
        ajaxFun(u + '/sendBootlickGameBegin', data, this.gameBeginSuccess)
    },

    // 游戏开始回调
    gameBeginSuccess: function(data) {
        step2.btnState = false;
        if (data.isResultTrue) {
            changeState(jumpEvt);
        }
    }
}

// 游戏开始页面
var step3 = {
    timer: null,
    trackTimer: null,
    running: false,
    times: 1.2,
    winner: '1',
    resArr: [],
    userHoserData: [],
    imgUrl: imgUrl,
    // 游戏倒计时
    beforeGame: function() {
        this.init();
        var dex = [];
        for (var i = 3; i >= 0; i--) {
            var img = '<img src="' + this.imgUrl + 'time_count_' + i + '.png" />';
            dex.push(img);
        }
        var x = 0;
        (function() {
            var arg = arguments.callee;
            var html = '<div id="beforeGame" class="start">';
            html += '<span class="tableSpan">';
            html += '<tt>' + dex[x] + '</tt>';
            html += '</span></div>';
            $(html).appendTo($('body'));

            setTimeout(function() {
                x++;
                if (x == 2) {
                    (function() {
                        var arg = arguments.callee;
                        step3.getBootlickUserInfo();
                    })();
                }
                if (x < dex.length) {
                    $('#beforeGame').remove();
                    arg();
                    if (x == dex.length - 1) {
                        step3.moveStart()
                        step3._start()
                    }
                } else {
                    $('#beforeGame').removeClass('start').addClass('end');
                    setTimeout(function() {
                        $('#beforeGame').remove();
                    }, 500)
                }
            }, 1000);
        })();
    },

    init: function() {
        if (localStorage.getItem('userHoserData') != undefined) {
            this.userHoserData = JSON.parse(localStorage.getItem('userHoserData'))
        } else {
            this.userHoserData = step2.userHoserData;
        }
    },

    // 组装马步数量
    mergeHorseStep: function(data) {
        let d1 = this.userHoserData,
            d2 = data,
            arr = [];
        for (var i in d1) {
            for (var j in d2) {
                if (d1[i].userid == d2[j].userid) {
                    let obj = {
                        horseNum: d1[i].horseNum,
                        userscore: d2[j].userscore
                    }
                    if (!arr.length) {
                        arr.push(obj)
                    } else {
                        let state = false;
                        for (var p in arr) {
                            if (arr[p].horseNum == d1[i].horseNum) {
                                state = true;
                                arr[p].userscore = (arr[p].userscore + d2[j].userscore) / 2
                            }
                        }
                        if (!state) {
                            arr.push(obj)
                        }
                    }
                }
            }
        }
        return arr;
    },

    // 获取胜利者
    getWinner: function() {
        let res = this.resArr;
        if (!res.length && res.length == 1) {
            this.winner = res[0].horseNum
        } else {
            var maxi = 0;
            for (var i = 0; i < res.length; i++) {
                if (res[maxi].userscore <= res[i].userscore) {
                    maxi = i;
                }
            }
            this.winner = res[maxi].horseNum;
        }
        this.victoryAction(this.winner);
        localStorage.setItem('winner', this.winner);
    },

    // 赛道上下动画后移效果
    trackBgMove() {
        let n = 1;
        step3.trackTimer = setInterval(res => {
            let w = Number($(window).width()),
                left = Math.ceil(Math.abs($('.track-top-inner').position().left));
            if (left % w == 0) {
                let copyTop = $('.track-top-inner > img').eq(0).clone(),
                    copyMiddle = $('.track-middle .track-middle-bg').eq(0).clone();
                copyBottom = $('.track-bottom-inner > img').eq(0).clone();
                copyTop.css('width', w);
                copyMiddle.css('width', w);
                copyBottom.css('width', w);
                num = $('.track-top-inner').length + 1;
                $('.track-top-inner').append(copyTop);
                $('.track-middle-inner').append(copyMiddle);
                $('.track-bottom-inner').append(copyBottom);
                $('.track-top-inner, .track-bottom-inner, .track-middle-inner').css('width', num * w);
            }
            $('.track-top-inner,.track-bottom-inner,.track-middle-inner').css({
                'left': -n + 'px'
            });
            n++
        }, 1)
    },

    // 动画效果开始
    moveStart() {
        this.trackBgMove();
        $('.track-mark').fadeOut();
    },

    // 轮询获取赛马信息
    getBootlickUserInfo: function() {
        let u = config.url + config.port2,
            data = {
                barid: config.barid
            };
        ajaxFun(u + '/getBootlickUserInfo', data, this.bootUserSuccess, this.bootUserError)
    },

    // 赛马信息成功回调
    bootUserSuccess: function(res) {
        if (res.isResultTrue) {
            var msg = JSON.parse(res.resultMsg),
                info = msg.data;
            step3.run(info);
        }
        step3.timer = setTimeout(res => {
            step3.getBootlickUserInfo();
        }, 2000);
    },

    // 赛马信息失败回调
    bootUserError: function() {
        timer = setTimeout(res => {
            step3.step3.getBootlickUserInfo();
        }, 1000);
    },

    run: function(data) {
        if (!this.running) return;
        this.resArr = this.mergeHorseStep(data);
        var d = this.mergeHorseStep(data);
        // var step = this.getStep(data);
        var list = $('.track-line .track-inner');
        for (var i = list.length; i > 0; i--) {
            var e = list[list.length - i];
            for (var j in d) {
                if (!e.horse.gameOver && i == d[j].horseNum) {
                    let speed = 1,
                        gameTime = config.gameTime;
                    if (gameTime >= 30 && gameTime < 50) {
                        speed = 1.5;
                    } else if (gameTime >= 50 && gameTime < 90) {
                        speed = 1.2;
                    }
                    e.horse.moveTo(speed * d[j].userscore);
                }
            }
        }
    },

    countTime: function() {
        $('#clock').addClass('animate');
        if (localStorage.getItem("gameTime") == undefined || localStorage.getItem("gameTime") == '') {
            var _time = config.gameTime;
        } else {
            var _time = localStorage.getItem("gameTime")
        }

        var interval = setInterval(function() {
            $('.hoseTime').html(_time + 's');
            localStorage.setItem("gameTime", _time)
            _time--;
            if (_time <= -1) {
                console.log(123)
                clearInterval(interval);
                step3.over();
                localStorage.removeItem("gameTime")
            }
        }, 1000);
    },

    _start: function() {
        this.running = true;
        var list = $('.track-line .track-inner');
        for (var i = list.length - 1; i >= 0; i--) {
            var e = list[i];
            e.horse.run();
        }
        this.countTime();
    },

    over: function() {
        this.running = false;
        var list = $('.track-line .track-inner');
        for (var i = list.length - 1; i >= 0; i--) {
            list[i].horse.stop();
        };
        this.getWinner();
        clearInterval(step3.trackTimer);
        clearTimeout(step3.timer);
        var reultArr = [];
        for (var i = 0; i < this.userHoserData.length; i++) {
            var item = this.userHoserData[i]
            var obj = {};
            if (item.horseNum == this.winner) {
                obj.userid = item.userid;
                obj.iswin = true;
            } else {
                obj.userid = item.userid;
                obj.iswin = false;
            }
            reultArr.push(obj)
        }
        var obj1 = {
            user: reultArr
        }
        let u = config.url + config.port2;
        ajaxFun(u + '/sendBootlickEnd', {
            barid: config.barid,
            infoid: config.infoid,
            message: JSON.stringify(obj1)
        }, this.overSuccess)
    },

    victoryAction: function(winner) {
        var str = '<img src="' + this.imgUrl + 'victory_action.webp" class="victoryAction"/>',
            list = $('.track-line .track-inner'),
            len = list.length;
        for (var i = len - 1; i >= 0; i--) {
            if (i == (len - winner)) {
                $(list[i]).children('div').append(str);
            }
        };
    },

    overSuccess: function(res) {
        if (res.isResultTrue) {
            setTimeout(function() {
                changeState(jumpEvt)
            }, 3000)
        }
    },

    initHorse: function() {
        var arr = $('.track-line .track-inner');
        var x = arr.length
        for (var i = arr.length - 1; i >= 0; i--) {
            var e = arr[i];
            e.horse = new horse(e);
            e.index = x - i;
            e.horse.delay = 300;
            (function(h) {
                h.start(0, function() {
                    h.stopRun();
                    h.next = 0;
                    h.delay = 180;
                });
            })(e.horse);
        }
    },
}

var horse = function(e) {
    this.index = 1;
    this.obj = e;
    this.stepTime = 2000;
    this.delay = 180;
    this.gameOver = false;
    this.next = 0;
}

horse.prototype = {
    run: function() {
        this.stopRun();
        var t = this;
        $(t.obj).find('img.trackHorse').attr({
            src: step3.imgUrl + 'run/run-horse-' + (t.obj.index) + '.webp'
        })
        $(t.obj).find('span').css({
            'margin-right': '-.25rem',
            'top': '.05rem'
        })
    },
    stopRun: function() {
        var t = this;
        $(t.obj).find('img.trackHorse').attr({
            src: step3.imgUrl + 'wait/wait-horse-' + (t.obj.index) + '.webp'
        })
        $(t.obj).find('span').css({
            'margin-right': '-.08rem',
            'top': '.4rem'
        })
    },
    start: function(len, fn) {
        this.next = len;
        $(this.obj).animate({
            left: len
        }, 1500, function() {
            if (fn)
                fn();
        });
    },
    moveTo: function(len, fn) {
        if (this.next == len) return;
        var newLen = this.next - this.obj.offsetLeft;
        newLen = newLen < 0 ? 0 : newLen;
        newLen += len;
        var obj = this.obj;
        $(obj).stop();
        if (this.gameOver || !step3.running)
            return;
        var self = this;
        var start = this.obj.offsetLeft;
        var _len = newLen;
        this.next = _len;
        $(obj).animate({
            left: _len
        }, this.stepTime);
        // if(this.check(newLen)){
        //     this.gameOver = true;
        //     var end = $(this.obj.parentNode).width()- $(this.obj).width();
        //     var t = ((end-start)/newLen)*this.stepTime;
        //     $(obj).animate({
        //         left:end        
        //     },t,function(){
        //         self.stop();
        //         self.gameOver = true;
        //         step3.over();
        //     });
        // }else{
        //     var _len = newLen;
        //     this.next = _len;
        //     $(obj).animate({
        //         left:_len       
        //     },this.stepTime);           
        // }   
    },
    check: function(len) {
        var end = $(this.obj.parentNode).width() + $(this.obj).width();
        return len >= end;
    },
    stop: function() {
        this.gameOver = true;
        $(this.obj).stop();
        this.stopRun();
    }
}

// 第一名展示
var step4 = {
    winner: '', //默认展示1号马
    init: function() {
        this.setWinnerInfo();
    },

    // 设置第一名展示信息
    setWinnerInfo() {
        let dom = $('#successWrap .championTitle');
        if (localStorage.getItem('winner') != undefined && localStorage.getItem('winner') != null && localStorage.getItem('winner') != 'undefined') {
            this.winner = localStorage.getItem('winner')
        } else {
            this.winner = step3.winner;
        }
        dom.children('.horse').attr('src', step3.imgUrl + 'ic_horse_success_' + this.winner + '.png');
        dom.children('span').text(this.winner);
        this.saveWinner();
    },

    // 存储第一名数据到数据库
    saveWinner() {
        let u = '',
            data = {
                barid: config.barid,
                infoid: config.infoid,
                horseNum: this.winner
            };
        ajaxFun(u + '/setBootlickWinUser', data, this.saveSuccess)
    },

    // 存储成功回调
    saveSuccess: function(res) {
        if (res.isResultTrue) {
            step5.recordInfo = JSON.parse(res.resultMsg);
            localStorage.setItem('recordInfo', res.resultMsg);
            setTimeout(r => {
                changeState(jumpEvt)
            }, 4000)
        }
    }
}

// 中奖纪录展示
var step5 = {
    recordInfo: [],
    winner: '',
    init: function() {
        this.sendBootlickList();
        this.getRecordInfo();
    },
    sendBootlickList: function() {
        let u = config.url + config.port2;
        ajaxFun(u + '/sendBootlickList', config.basicData)
    },

    // 获取中奖纪录
    getRecordInfo: function() {
        let dom = $('#ResultWrap .championTitle');
        if (localStorage.getItem('winner') != undefined && localStorage.getItem('winner') != null && localStorage.getItem('winner') != 'undefined') {
            this.winner = localStorage.getItem('winner')
        } else {
            this.winner = step3.winner;
        }
        dom.children('.horse').attr('src', step3.imgUrl + 'ic_horse_success_' + this.winner + '.png');
        if (localStorage.getItem('recordInfo') != undefined && localStorage.getItem('recordInfo') != null) {
            this.recordInfo = JSON.parse(localStorage.getItem('recordInfo'));
        }
        let info = this.recordInfo,
            str = '';
        for (var i = 0; i < info.length; i++) {
            str += '<ul data-v-15a5b41c="" index="0" class="item-box"><li data-v-15a5b41c=""><img src="' + info[i].userhead + '" style="width: 60px;height: 60px;border-radius:50%;"/><span data-v-15a5b41c="">' + info[i].username + '</span></li><li data-v-15a5b41c=""><img data-v-15a5b41c="" src="' + step3.imgUrl + 'ic_wine.png" class="ic-wine">' + info[i].winnum + '<span data-v-15a5b41c="" class="ic-unit">瓶</span></li>';
            if (info[i].tablenum == undefined || info[i].tablenum === '') {
                str += '<li data-v-15a5b41c=""><span data-v-15a5b41c="" class="ic-unit">未输桌号</span></li></ul>';
            } else {
                str += '<li data-v-15a5b41c=""><span class="table-num">' + info[i].tablenum + '</span><span data-v-15a5b41c="" class="ic-unit">桌</span></li></ul>';
            }

        }
        $('#ResultWrap section').html(str);
    },

    // 再来一局
    gameAgain: function() {
        window.location.reload();
        // let u = config.url + config.port1;
        // ajaxFun(u+'/sendBootlickAgain', config.basicData, this.againSuccess)
    },

    // 再来一次成功回调
    // againSuccess: function(res) {
    //     if(res.isResultTrue) {
    //         window.reload();
    //     }
    // }
}

// 进入比赛页面
var jumpEvt = function(data) {
    if (data.isResultTrue) {
        statusFn()
    }
}

// 初始状态推数据
var initFun = function() {
    localStorage.removeItem('userHoserData');
    localStorage.removeItem('winner');
    localStorage.removeItem('recordInfo');
    let u = config.url + config.port2;
    ajaxFun(u + '/sendBootlickOpen', config.basicData)
}

// 提示弹出层
var msg = function(msg) {
    $('.msgTip').text(msg).show();
    setTimeout(function() {
        $('.msgTip').hide();
    }, 2000)
}

var setZoom = function(obj) {
    var fn = function() {
        obj = obj || $('#app');
        var w = $(window).width();
        var h = $(window).height();
        var maxWidth = 1200;
        var maxHeight = 653;
        window.zoom = 1;
        if (w >= h + 300) {
            zoom = h / maxHeight;
            if (w / h > 3 && w / maxWidth > 2) {
                zoom += 0.1;
            }
            obj.css({
                zoom: zoom
            });
        } else {
            zoom = w / maxWidth;
            obj.css({
                zoom: zoom
            });
        }
    }
    $(window).bind('resize', function() {
        fn();
    });
    fn();
}

// 状态修改
var statusFn = function() {
    let status = config.state;
    $('.bg').hide();
    switch (status) {
        case 0:
            initFun()
            $('#indexWrap').css('display', 'block');
            $('.logo').addClass('animated infinite flipInX');
            $('#indexWrap .binner').addClass('animated infinite fadeInLeft');
            setTimeout(function() {
                $('.logo, #indexWrap .binner').removeClass('animated infinite fadeInLeft flipInX')
            }, 1000)
            break;
        case 1:
            step2.init();
            $('#homeWrap').css('display', 'block');
            ewm.hide();
            break;
        case 2:
            clearTimeout(step2.timer);
            $('#playWrap').css('display', 'block');
            step3.initHorse();
            step3.beforeGame();
            ewm.hide();
            break;
        case 3:
            step4.init();
            $('#successWrap').css('display', 'block');
            $('#successWrap .championTitle').addClass('animated infinite zoomIn');
            setTimeout(function() {
                $('#successWrap .championTitle').removeClass('animated infinite zoomIn')
            }, 1000)
            ewm.hide();
            break;
        case 4:
            step5.init();
            $('#ResultWrap').css('display', 'block');
            $('#ResultWrap .championTitle').addClass('animated infinite zoomIn');
            setTimeout(function() {
                $('#ResultWrap .championTitle').removeClass('animated infinite zoomIn')
            }, 1000)
            ewm.hide();
            break;
    }
}

// 更改pc端游戏状态
function changeState(fn) {
    config.state = config.state + 1;
    var url = '/setBootlickState',
        d = {
            barid: config.barid,
            state: config.state
        };
    ajaxFun(url, d, fn)

}
//要使用的图片
var imageList = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    'index_BG.b3463be.png',
    'index_BG.png',
    'result_bg.b47a202.png',
    'result_bg.png',
    'rule_BG.png',
    'track_middle.png', 'yz_bg.png', 'yz_info_bg.png', 'logo.png', 'ic_show_horse_6.png', 'ic_show_horse_1.png',
    'ic_show_horse_2.png', 'ic_show_horse_3.png', 'ic_show_horse_4.png', 'ic_show_horse_5.png',
    'run/run-horse-1.webp', 'run/run-horse-2.webp', 'run/run-horse-3.webp', 'run/run-horse-4.webp', 'run/run-horse-5.webp', 'run/run-horse-6.webp'
];
// imageList = imageList.concat(noVideoImage);

//图片预加载
var preloadImage = function(data) {
    data.onComplete = data.onComplete || function() {}
    if (!data.src || data.src.length == 0)
        return data.onComplete();
    var src = data.src;
    var len = src.length;
    var index = 0;
    for (var x = 0; x < len; x++) {
        var img = new Image();
        img.onload = img.onerror = function() {
            index++;
            if (index == len)
                data.onComplete();
        }
        img.src = step3.imgUrl + src[x];
    }
}
var isFail = false;
var setVideo = function() {
    if (isFail) {
        return $('#horseGameVideoBox img').attr({
            src: step3.imgUrl + 'index_BG.png'
        });
    }
    $('#horseGameVideo').attr({
        src: videoList[0]
    });
    Video.fullScreen($('#horseGameVideo')[0], result[0], $('#horseGameVideoBox')[0]);
    $(window).unbind('resize.videoResize').bind('resize.videoResize', function() {
        Video.fullScreen($('#horseGameVideo')[0], result[0], $('#horseGameVideoBox')[0]);
    });

}
var ewm = null;
$(function() {
    setZoom($('#app'));
    //二维码
    // erImg='${SysConf.STATIC_DOMAIN}/wemew/admin/images/noEwmWall.gif';
    var _data = {
        src: erImg,
        text: "扫二维码参赛",
        position: {
            left: '76%',
            top: '15%'
        },
        style: {
            'z-index': 11
        }
    }
    ewm = new tools.QR(_data);
    wemewLoading.create();
    //预加载
    preloadImage({
        src: imageList,
        onComplete: function() {
            wemewLoading.add(100);
            if (config.state != 0) {
                ewm.hide();
            }

        }
    });
    window.result = [];
    Video.preload({
        src: videoList,
        onError: function() {
            isFail = true;
            wemewLoading.add(60);
        },
        onFail: function() {
            isFail = true;
            wemewLoading.add(30);
        },
        onLoad: function() {
            wemewLoading.add(30);
        },
        onComplete: function(_result, canplayList) {
            result = _result;
        }
    })
    wemewLoading.complete = function() {
        if (isFail) $('#horseGameVideoBox').html('<img />')
        setVideo()
    }
    allGameType.barId = config.barid;
    allGameType.gameName = '疯狂拍马屁';
    allGameType.open();
    gameEntry.init({
        start: 3,
        barId: config.barid
    });
    gameEntry.setAble(false);
    $(window).bind('keydown', function(ev) {
        var code = ev.keyCode;
        if (code == 13) {
            switch (config.state) {
                case 0:
                    $('#gameJoin').trigger('click');
                    break;
                case 1:
                    $('#gameBegin').trigger('click');
                    break;
                case 5:
                    $('#cy_gameAgain').trigger('click');
                    break;
            }
        }
    });
    //检测浏览器
    if (Browser.chrome == 0) {
        showBrowser();
        $(window).bind('keydown.browser', function(ev) {
            var code = ev.keyCode;
            if (ev.keyCode == 27) {
                $('.browser').remove();
                $(window).unbind('keydown.browser');
            }
        });
    }
    statusFn();
})

// 设置1rem=100px
fnResize()
window.onresize = function() {
    fnResize()
}

function fnResize() {
    var deviceWidth = document.documentElement.clientWidth || window.innerWidth
    if (deviceWidth >= 750) {
        deviceWidth = 750
    }
    if (deviceWidth <= 320) {
        deviceWidth = 320
    }
    document.documentElement.style.fontSize = (deviceWidth / 7.5) + 'px'
}