<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>疯狂拍马屁 </title>
    <jsp:include page="../../../basic/admin_js_css.jsp" />

    <%--<link rel="shortcut icon" type="image/x-icon" href="${SysConf.STATIC_DOMAIN}/wemew/images/favicon.ico" />--%>
    <%--<link rel="stylesheet" href="${SysConf.STATIC_DOMAIN}/wemew/admin/style/icon.css?a=111" />--%>
    <link rel="stylesheet" href="${SysConf.STATIC_DOMAIN}/wemew/admin/style/tools.css?r=2">
    <%--<link rel="stylesheet" href="${SysConf.STATIC_DOMAIN}/wemew/admin/wmJS/css/wm.css">--%>
    <script type="text/javascript" src="${SysConf.STATIC_DOMAIN}/wemew/js/jquery-1.7.1.min.js"></script>
    <script src="${SysConf.STATIC_DOMAIN}/wemew/admin/js/jquery.mousewheel.js"></script>
    <script src="${SysConf.STATIC_DOMAIN}/wemew/admin/js/tools.js?r=9"></script>   
    <script src="${SysConf.STATIC_DOMAIN}/wemew/admin/js/onWallVideo.js"></script>
    <jsp:include page="../../../basic/wemewGame_js_css.jsp" /> 
    <link rel="stylesheet" type="text/css" href="${SysConf.STATIC_DOMAIN}/wemew/admin/style/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${SysConf.STATIC_DOMAIN}/wemew/admin/style/trick.css">
    <style type="text/css" media="screen">
        * {margin:0;padding:0;border:0;-webkit-user-select:text; color:#000; font-family:'font'; outline:none; word-break:break-all; word-wrap:break-word; word-break:normal;}
        body, html, #app {background-color: #fff; height: 100%}
        input::-webkit-input-placeholder{color:#cccccc;}
        input::-moz-placeholder{/* Mozilla Firefox 19+ */color:#cccccc;}
        input:-moz-placeholder{/* Mozilla Firefox 4 to 18 */color:#cccccc;}
        input:-ms-input-placeholder{ /* Internet Explorer 10-11 */ color:#cccccc;}
        #app p {margin-bottom: 0;}
        #app a:hover {text-decoration: none;}
        .bg, .weui-mask, .weui-dialog{display: none;}

        /*决赛倒数*/
        #beforeGame{text-align:center; display:table; z-index:19; position:fixed; left:0; top:0; width:100%; height:100%;}
        #beforeGame.start{animation:beforeGameAnimate 0.3s forwards; transform:scale(1.8); opacity:0;}
        #beforeGame *{font-size:100px; font-weight:bold; letter-spacing:4px; color:#000;}
        #beforeGame tt{border-radius:50%; width:350px; height:350px; display:inline-block; line-height:350px; text-align:center; opacity:0.4; font-family:"Times New Roman", Times, serif;}
        #beforeGame tt img {width: 100%;}
        @keyframes beforeGameAnimate {
          100% {
            opacity: 1;
            transform:scale(1);
          }
        }
        #beforeGame.end{animation:endAnimate 0.3s forwards; transform:scale(1); opacity:1;}
        @keyframes endAnimate {
          100% {
            opacity: 0;
            transform:scale(3);
          }
        }
        #playWrap .track-middle .track-content .track-line {
            z-index: 10;
        }
        #playWrap .track-bottom {
            z-index: 10 !important;
        }
        body{overflow: hidden}
        .sideButton{
            bottom: 3%;
            /*right: -33px;*/
        }
        .sideSpan{padding: 0}
        .backOnWall{bottom: 14%}
        .hoseTime{position: absolute;right: 10px;top:10px;color: #fff;z-index: 11;border: 2px solid #fff;padding: 15px;border-radius: 50%;font-size: 26px;width: 60px;height: 60px;line-height: 60px;text-align: center;}
        #ResultWrap .btnWrap {
            width: 100%;
            height: 70px;
            position: fixed;
            bottom: 30px;
        }
        #ResultWrap .binner {
            cursor: pointer;
            position: relative;
            width: 250px;
            margin: auto;
            height: 100%;
        }
        #ResultWrap .binner img {
            position: absolute;
            width: 100%;
            z-index: -1;
        }
        #ResultWrap .binner span {
            width: 100%;
            display: block;
            text-align: center;
            line-height: 70px;
            font-size: 25px;
            font-weight: 600;
            color: #f1f1f1;
            cursor: pointer;
        }
        .dialog-refund .weui-dialog {
            height: 100%;
            max-height: 350px;
            max-width: 550px!important;
        }

        .dialog-refund .weui-dialog .refundDialogBg{
            display: block;
            width: 100%;
            height: 100%;
            position: absolute;
        }
        .refund-content {
            width: 100%;
            position: absolute;
            z-index: 10;
        }
        .refund-content h1 {
            font-size: 30px;
            color: #6c4229;
            width: 50%;
            height: 90px;
            line-height: 90px;
            letter-spacing: 1px;
            margin-left: 25%;
        }
        .refund-content p {
            padding: 30px 50px;
            font-size: 20px;
            color: #6c4229;
            text-align: left;
        }
        .refundWrap {
            position: fixed;
            right: 15px;
            top: 15px;
        }
        .refundWrap img {
            width: 120px;
            cursor: pointer;
        }
        .refund-dialog {
            display: none;
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            left: 0;
            top: 0;
            z-index: 10;
        }
        .refund-dialog p{
            font-size: 40px;
            color: #fff;
            text-align:center;
            margin-top: 20%;
        }
        .track-middle-inner {
            position: absolute;
            left: 0;
            height: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
        }
        #playWrap .track-middle .track-content {
            /*transform: rotate(6deg);
            -ms-transform: rotate(6deg);
            -moz-transform: rotate(6deg);
             -webkit-transform: rotate(6deg); 
            -o-transform: rotate(6deg);
            z-index: 10;*/
        }
        #playWrap .track-middle .track-content {
            /*top: 35px !important;*/
            left: .2rem !important;
        }


        #playWrap .track-middle .track-content .track-line .track-inner{
            position:absolute;
            left:0;
            top: -1.4rem;
            width:4rem;
        }

        #playWrap .track-middle .track-content .track-line .track-inner>div{
            position: relative;
            width: 100%;
            height: 100%;
        }
        #playWrap .track-middle .track-content .track-line .track-inner .trackHorse{
            width: 100%;
            /*transform: rotate(6deg);
            -ms-transform: rotate(6deg);
            -moz-transform: rotate(6deg);
             -webkit-transform: rotate(6deg); 
            -o-transform: rotate(6deg);
            z-index: 10;*/
        }
        #playWrap .track-middle .track-content .track-line .track-inner .victoryAction {
            position: absolute;
            width:300%;
            left: -90%;
            top: -20%;
        }
        #playWrap .track-middle .track-content .track-line .track-inner span {
            position: absolute;
            right: 50%;
            margin-right: -.08rem;
            top: .4rem;
            font-size: .3rem;
            border: 3px solid #ddd;
            border-radius: 50%;
            width: .5rem;
            height: .5rem;
            line-height: .5rem;
            text-align: center;
            font-weight: 600;
            color: #fff;
            background-color: rgba(163,163,163,0.5);
        }
    
        #playWrap .track-middle img.track-mark[data-v-289bccfd]{
            transform: rotate(-5deg);
            -ms-transform: rotate(-5deg);
            -moz-transform: rotate(-5deg);
             -webkit-transform: rotate(-5deg); 
            -o-transform: rotate(-5deg);
            left: 3.3rem;
        }
        /*大屏幕功能*/

        #horseGameVideoBox{position:absolute; left:0; top:0; width:100%; height:100%;overflow: hidden;}
        #horseGameVideoBox img{width:100%; height:100%;}
        #horseGameVideo{position:absolute;}

        .table-content section ul[data-v-15a5b41c] {
            box-sizing: border-box;
            padding: 0 10px;
        }
        .table-content section ul li {
            overflow: hidden;
            text-align: left !important;
            justify-content: start !important;
        }
        .table-content section ul li span:not(.ic-unit) {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .table-content section ul li span.table-num {
            color: #fff;
            font-size: 25px;
        }
        .msgTip {
            display: none;
            width: 20%;
            position: absolute;
            top: 20px;
            left: 40%;
            font-size: 16px;
            text-align: center;
            padding: 10px;
            background: rgba(0,0,0,0.8);
            color: #f1f1f1;
            z-index: 10000;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <!--loading-->
<script>
    // wemewLoading.create();
</script>
<!--入口-->
<c:if test="${type==0 }">
    <a class="backOnWall" href="/weionwallmsg?barid=${barbase.id }"><tt>微<br />上<br />墙<br /><i class="entryNum">1</i></tt></a>
</c:if>
<c:if test="${type==1 }">
    <a class="backOnWall" href="/c/weionwall?id=${id }&type=1"><tt>微<br />上<br />墙<br /><i class="entryNum">1</i></tt></a>
</c:if>
<div class="sideButton">
    <span class="sideSpan">
        <a class="sideSpanText">
            <tt>游<br />戏<br /><i class="entryNum">2</i></tt>
        </a>
        <div class="allActive"></div>
    </span>
</div>
    <div id="app">
        <!-- 第一步 -->
        <div data-v-82893a40="" id="indexWrap" class="bg">
            <div id="horseGameVideoBox"><video autoPlay id="horseGameVideo" loop></video></div>
            <!-- <video src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/index_BG.webm" autobuffer autoloop loop controls poster="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/index_BG.b3463be.png"></video> -->
            <header data-v-82893a40="" id="header" class="header">
                <div data-v-82893a40="" class="wemewLogo">
                    <img data-v-82893a40="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wemew_logo.png">
                </div> 
                <div data-v-82893a40="" class="title ">
                    <div data-v-82893a40="" class="titleInner">
                        <img data-v-82893a40="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/bar_title_bg.png"> 
                        <span data-v-82893a40="">欢迎光临${barname}</span>
                    </div>
                </div>
            </header> 
            <section data-v-82893a40="">
                <img data-v-82893a40="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/logo.png" alt="疯狂拍马屁LOGO" class="logo "> 
                <div data-v-82893a40="" class="binner" onclick="step1.gameInit()" id="gameJoin">
                    <img data-v-82893a40="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_button.png" class="btn">
                </div>
            </section>
        </div>

        <!-- 第二步 -->
        <div data-v-3e4db0b3="" id="homeWrap" class="bg">
            <div class="refundWrap">
                <div class="refundInner" onclick="step2.dialogShow(3)">
                    <img src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_refund_new.png"/>
                </div>
            </div>
            <header data-v-3e4db0b3="" id="header" class="header">
                <div data-v-3e4db0b3="" class="title">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/bar_title_bg.png">
                    <span data-v-3e4db0b3="">欢迎光临${barname}</span></div>
            </header>
            <div data-v-3e4db0b3="" class="yz-info-content">
                <div data-v-3e4db0b3="" class="yz-info-part">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/yz_info_bg.png" class="yz-info-bg">
                    <div data-v-3e4db0b3="" class="yz-info-part-content">
                        <h1 data-v-3e4db0b3="">本场押注</h1>
                        <p data-v-3e4db0b3="" style="margin-bottom:24px;">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png">
                            <span data-v-3e4db0b3="" class="yz-num yz-total-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></p>
                        <h1 data-v-3e4db0b3="">酒吧彩头</h1>
                        <p data-v-3e4db0b3="">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png">
                            <span data-v-3e4db0b3="" class="yz-num yz-luck-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></p>
                    </div>
                </div>
                <div data-v-3e4db0b3="" onclick="step2.dialogShow(1)" class="ct-part" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_set_bg.png" class="set-bg">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_ct.png" class="set-text"></div>
                <div data-v-3e4db0b3="" onclick="step2.dialogShow(2)" class="rule-part" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_set_bg.png" class="set-bg">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_rule.png" class="set-text"></div>
            </div>
            <div data-v-3e4db0b3="" class="weui-grids vux-grid-no-lr-borders">
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_1.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/1.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_2.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/2.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_3.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/3.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_4.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/4.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_5.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/5.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
                <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="cursor: default;">
                    <div data-v-3e4db0b3="" class="horseContainer">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_select_horse.png" class="horseBg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_6.png" class="horsePic">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/6.png" class="indexPic"></div>
                    <span data-v-3e4db0b3="" class="grid-center">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_horse_bg.png" class="ic-horse-bg">
                        <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine.png" class="ic-wine">
                        <div data-v-3e4db0b3="" class="yz-horse-info">
                            <span data-v-3e4db0b3="" class="yz-num">0</span>
                            <span data-v-3e4db0b3="" class="yz-unit">瓶</span></div>
                    </span>
                </a>
            </div>
            <div data-v-3e4db0b3="" class="tip">
                <div data-v-3e4db0b3="" class="binner">
                    <img id="gameBegin" data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_over_btn.png" class="btn" onclick="step2.getUserHorseInfo()"></div>
            </div>
            <div data-v-3e4db0b3="" class="weui-loading_toast vux-loading vux-loading-no-text" style="display: none;">
                <div class="weui-mask_transparent"></div>
                <div class="weui-toast">
                    <i class="weui-loading weui-icon_toast"></i>
                </div>
            </div>
        </div>

        <!-- 第三步 -->
        <div data-v-289bccfd="" id="playWrap" class="bg">
            <div data-v-289bccfd="" class="track-top">
                <div data-v-289bccfd="" class="track-top-inner">
                    <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/track_top.png">
                </div>
            </div>
            <div data-v-289bccfd="" class="track-middle" style="height: calc(100% - 1.45rem);">
                <div class="track-middle-inner">
                    <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/track_middle.png" class="track-middle-bg">
                </div>
                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/track_line.png" class="track-mark">
                <div data-v-289bccfd="" class="track-content">
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>6</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-6.webp" class="trackHorse">
                            </div>
                        </div>
                    </div>
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>5</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-5.webp" class="trackHorse">
                            </div>
                        </div>
                    </div>
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>4</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-4.webp" class="trackHorse">
                            </div>
                        </div>
                    </div>
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>3</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-3.webp" class="trackHorse">
                            </div>
                        </div>
                    </div>
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>2</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-2.webp" class="trackHorse">
                                
                            </div>
                        </div>
                    </div>
                    <div data-v-289bccfd="" class="track-line">
                        <div class="track-inner">
                            <div>
                                <span>1</span>
                                <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/wait/wait-horse-1.webp" class="trackHorse">
    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-v-289bccfd="" class="track-bottom">
                <div data-v-289bccfd="" class="track-bottom-inner">
                    <img data-v-289bccfd="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/track_bottom.png" >
                </div>
            </div>
            <div class="hoseTime">
                30s

            </div>
        </div>

        <!-- 第四步 -->
        <div data-v-20535f16="" id="successWrap" class="bg">
            <div data-v-20535f16="" class="championTitle ">
                <img data-v-20535f16="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_avator.png" class="avator">
                <img data-v-20535f16="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_champion.png" class="champion">
                <img data-v-20535f16="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/sunshine.webp" class="sunshine">
                <img data-v-20535f16="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/victory.png" class="victory">
                <img data-v-20535f16="" src="" class="horse">
                <span data-v-20535f16=""></span>
            </div>
        </div>

        <!-- 第五步 -->
        <div data-v-15a5b41c="" id="ResultWrap" class="bg">
            <div data-v-15a5b41c="" class="championTitle ">
                <img data-v-15a5b41c="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_avator.png" class="avator">
                <img data-v-15a5b41c="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/sunshine.png" class="sunshine">
                <img data-v-15a5b41c="" src="" class="horse"></div>
            <div data-v-15a5b41c="" class="table-box ">
                <div data-v-15a5b41c="" class="table-inner">
                    <img data-v-15a5b41c="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_champion_bottom.png" class="tableBg">
                    <div data-v-15a5b41c="" class="table-content">
                        <section data-v-15a5b41c="">
                            
                        </section>
                    </div>
                </div>
            </div>
            <div class="btnWrap">
                <div class="binner" id="cy_gameAgain" onclick="step5.gameAgain()">
                    <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_confirm.png" class="btn">
                    <span data-v-3e4db0b3="">再来一局</span></div>
            </div>
        </div>
        <div data-v-3e4db0b3="" class="v-transfer-dom">
            <div data-v-3e4db0b3="" class="vux-x-dialog dialog-rule">
                <div class="weui-mask"></div>
                <div class="weui-dialog">
                    <div data-v-3e4db0b3="" class="dialog-box">
                        <a data-v-3e4db0b3="" onclick="step2.dialogHide()" class="dialog-close" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/close.png">
                        </a>
                        <div data-v-3e4db0b3="" class="dialog-inner">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/rule_BG.png" class="ruleDialogBg">
                            <div data-v-3e4db0b3="" class="rule-content">
                                <h1 data-v-3e4db0b3="">拍马屁游戏规则</h1>
                                <section data-v-3e4db0b3="" style="height: calc(95% - 50px);">
                                    <div data-v-3e4db0b3="" class="item-box">
                                        <h1 data-v-3e4db0b3="">1.押注流程</h1>
                                        <p data-v-3e4db0b3="">通过游戏界面选择你喜欢的马，购买啤酒进行押注，最少押注</p>
                                        <p data-v-3e4db0b3="" style="color: rgb(237,77,77)">注意：你只能选择一匹马押酒，支付成功后不能重新选马押酒。</p></div>
                                    <div data-v-3e4db0b3="" class="item-box">
                                        <h1 data-v-3e4db0b3="">2.怎么输赢</h1>
                                        <p data-v-3e4db0b3="">游戏开始后手机界面会出现一匹马的屁股，拍打马屁的次数越多，你押酒的马越有可能获得冠军，在规定时间内全场拍马屁人均次数最多的那匹马将获得冠军。</p></div>
                                    <div data-v-3e4db0b3="" class="item-box">
                                        <h1 data-v-3e4db0b3="">3.酒水怎么分</h1>
                                        <p data-v-3e4db0b3="">若你押的马获得冠军，按照你对冠军马押注比例来分得全场的押酒总数。</p></div>
                                    <!-- <div data-v-3e4db0b3="" class="item-box">
                                        <p data-v-3e4db0b3="" style="text-indent: 0px;">
                                            <span data-v-3e4db0b3="" style="font-size: 0.2rem; color: rgb(108, 66, 41); font-weight: 600;">4.</span>微喵服务号会给冠军吗的押注用户发送领取酒水的消息凭证，凭服务号可向酒吧工作人员领取获胜的酒水，请及时关注“微喵”服务号。</p></div> -->
                                    <div data-v-3e4db0b3="" class="item-box">
                                        <p data-v-3e4db0b3="" style="text-indent: 0px;">
                                            <span data-v-3e4db0b3="" style="font-size: 0.2rem; color: rgb(108, 66, 41); font-weight: 600;">4.</span>游戏过程中若出现异常情况导致电子屏幕关闭无法进行游戏，支付游戏费用将在6小时内退回原支付账户。</p></div>
                                    <!-- <div data-v-3e4db0b3="" class="item-box">
                                        <p data-v-3e4db0b3="" style="text-indent: 0px;">
                                            <span data-v-3e4db0b3="" style="font-size: 0.2rem; color: rgb(108, 66, 41); font-weight: 600;">6.</span>下注6小时后酒吧未开始游戏，支付游戏费用将退回原支付账号。</p></div> -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-v-3e4db0b3="" class="v-transfer-dom">
            <div data-v-3e4db0b3="" class="vux-x-dialog dialog-yz">
                <div class="weui-mask"></div>
                <div class="weui-dialog">
                    <div data-v-3e4db0b3="" class="dialog-box">
                        <div data-v-3e4db0b3="" class="dialog-inner">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_wine_bottom.png" class="yzDialogBg">
                            <div data-v-3e4db0b3="" class="yz-content">
                                <h1 data-v-3e4db0b3="">彩头设置</h1>
                                <div data-v-3e4db0b3="" class="form-box">
                                    <div data-v-3e4db0b3="" class="form-item">
                                        <label data-v-3e4db0b3="">彩头加酒：</label>
                                        <div data-v-3e4db0b3="" class="input-box">
                                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_bottom_1.png" class="inputBg">
                                            <input data-v-3e4db0b3="" type="text" placeholder="请输入彩头数量" class="dialog-luck-num" maxlength="4">
                                            <span data-v-3e4db0b3="" class="dialog-unit">瓶</span></div>
                                    </div>
                                </div>
                            </div>
                            <div data-v-3e4db0b3="" class="bwrap">
                                <div data-v-3e4db0b3="" class="weui-grids vux-grid-no-lr-borders">
                                    <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="width: 50%;">
                                        <!---->
                                        <!---->
                                        <div data-v-3e4db0b3="" class="horseContainer">
                                            <div data-v-3e4db0b3="" onclick="step2.dialogHide()" class="binner" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                                <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_cancel.png" class="btn">
                                                <span data-v-3e4db0b3="">取消</span></div>
                                        </div>
                                    </a>
                                    <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="width: 50%;">
                                        <!---->
                                        <!---->
                                        <div data-v-3e4db0b3="" class="horseContainer">
                                            <div data-v-3e4db0b3="" class="binner" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" onclick="step2.setBootlickBarLucky()">
                                                <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_confirm.png" class="btn">
                                                <span data-v-3e4db0b3="">确定</span></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-v-3e4db0b3="" class="v-transfer-dom">
            <div data-v-3e4db0b3="" class="vux-x-dialog dialog-refund">
                <div class="weui-mask"></div>
                <div class="weui-dialog">
                    <div data-v-3e4db0b3="" class="dialog-box">
                        <div data-v-3e4db0b3="" class="dialog-inner">
                            <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/refund_BG.png" class="refundDialogBg">
                            <div data-v-3e4db0b3="" class="refund-content">
                                <h1 data-v-3e4db0b3="">提示</h1>
                                <p>点击"确认"后将自动结束本场游戏并退款, 请谨慎操作。</p>
                            </div>
                            <div data-v-3e4db0b3="" class="bwrap">
                                <div data-v-3e4db0b3="" class="weui-grids vux-grid-no-lr-borders">
                                    <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="width: 50%;">
                                        <!---->
                                        <!---->
                                        <div data-v-3e4db0b3="" class="horseContainer">
                                            <div data-v-3e4db0b3="" onclick="step2.dialogHide()" class="binner" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                                <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_cancel.png" class="btn">
                                                <span data-v-3e4db0b3="">取消</span></div>
                                        </div>
                                    </a>
                                    <a data-v-3e4db0b3="" href="javascript:;" class="weui-grid vux-grid-item-no-border" style="width: 50%;">
                                        <!---->
                                        <!---->
                                        <div data-v-3e4db0b3="" class="horseContainer">
                                            <div data-v-3e4db0b3="" class="binner" style="touch-action: manipulation; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" onclick="step2.refundConfirm()">
                                                <img data-v-3e4db0b3="" src="${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/ic_confirm.png" class="btn">
                                                <span data-v-3e4db0b3="">确定</span></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="refund-dialog">
            <p>
                正在退款中...
            </p>
        </div>
        <div class="msgTip">
        </div>
    </div>

<%--&lt;%&ndash;公共样式&ndash;%&gt;--%>
    <%--<a class="backOnWall" href="/weionwallmsg?barid=${barbase.id}"><tt>微<br />上<br />墙<br /><i class="entryNum">1</i></tt></a>--%>
    <%--<div class="sideButton">--%>
    <%--<span class="sideSpan">--%>
        <%--<a class="sideSpanText">--%>
            <%--<tt>游<br />戏<br /><i class="entryNum">2</i></tt>--%>
        <%--</a>--%>
        <%--<div class="allActive"></div>--%>
    <%--</span>--%>
    <%--</div>--%>
</body>
<script>
    var config = {
        url: 'http://game2.wemew.com:',
        // url: 'http://192.168.11.111:', 
        barid: '${barbase.id}',
        infoid: '${infoid}',
        // infoid: '1',
        //port1: '8082',
        port2: '8085',
        // port2: '8081', 
        state:  Number('${state}'),
        gameTime:'${gameTime}',
        basicData: {
            infoid: '${infoid}',
            // infoid: '1',
            barid: '${barbase.id}'
        }
    }
    var imgUrl = '${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/';
    var videoList = ['${SysConf.STATIC_DOMAIN}/wemew/admin/images/track/index_BG.webm'];
    var erImg = '${barbase.twodimension!=null?barbase.twodimension :wemeweEwm}';
</script>
<script src="${SysConf.STATIC_DOMAIN}/wemew/admin/js/track/bootlick_encrypt.js?r=<%=new Date().getTime() %>"></script>
</html>