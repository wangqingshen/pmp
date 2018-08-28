<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--android宽度自适应1:1-->
<meta content="user-scalable=0,width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>拍马屁游戏_${barname}</title>
<link rel="stylesheet" type="text/css" href="${SysConf.STATIC_DOMAIN}/wemew/wechat/style/animate.min.css">
<script  type="text/javascript" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/style/wmPhone.css"></script>
<jsp:include page="../../basic/wechat_js_css.jsp" />
<script src="${SysConf.STATIC_DOMAIN}/wemew/wechat/js/Touch.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script  type="text/javascript" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/js/levelbasic.js"></script>
<script  type="text/javascript" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/js/wmPhone.js"></script>
<style>
	input::-webkit-input-placeholder{color:#cccccc;}
    input::-moz-placeholder{/* Mozilla Firefox 19+ */color:#cccccc;}
    input:-moz-placeholder{/* Mozilla Firefox 4 to 18 */color:#cccccc;}
    input:-ms-input-placeholder{ /* Internet Explorer 10-11 */ color:#cccccc;}
	*{margin:0;padding:0;}
    html,body, .app{
        width:100%;
        height:100%;
        background-color: #fff;
    }
    .step {
    	display: none;
    	height: 100%;
    	background-image: url("${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/BG.png");
	    background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center;
	    background-attachment: fixed;
    }
    #step1 {
    	background-image: url("${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/index_BG.png");
    }
    .record {
    	position: absolute;
	    top: 25px;
	    right: 15px;
	    width: 90px;
    }

    .record .recordInner {
    	position: relative;
    }
    .record .recordInner span {
    	position: absolute;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    top: 50%;
	    margin-top: -11px;
	    text-align: center;
	    font-size: 15px;
	    color: rgb(114,57,26);
	    font-weight: 600;
    }
    .record .recordInner .ic-record {
    	width: 100%;
    }
    .record .recordInner .ic-tip {
    	display: none;
    	position: absolute;
	    width: 12px;
	    top: -5px;
	    right: 0;
    }
    #step1 .logo {
    	display: block;
	    width: 80%;
	    max-width: 400px;
	    margin: auto;
	    padding-top: 100px;
    }
    #step1 .waitTip {
        color: rgb(69,116,131);
	    font-size: 20px;
	    font-weight: 600;
	    text-align: center;
	    margin-top: 25px;
    }
    #step1 .bwrap {
    	width: 100%;
    	margin-top: 30px;
    }
    #step1 .bwrap .binner{
     	position: relative;
	    width: 60%;
	    max-width: 300px;
	    margin: auto;
    }
    #step1 .bwrap .binner img{
		display: block;
		width: 100%;
    }
    #step1 .bwrap .binner span{
    	position: absolute;
	    top: 50%;
	    margin-top: -15px;
	    display: block;
	    width: 100%;
	    text-align: center;
	    color: rgb(47,71,21);
	    font-size: 20px;
	    font-weight: 600;
	    letter-spacing: 2px;
    }

    #step2 .record {
    	top: 15px;
    	z-index: 100;
    }

    #step2 .ruleWrap {
    	position: fixed;
	    top: 0;
	    right: 0;
	    z-index: 100;
    }
    #step2 .ruleWrap .ruleInner {
    	width: 35px;
    }
    #step2 .ruleWrap .ruleInner > img {
		width: 100%;
    }
    #step2 .grids {
    	position: relative;
    	overflow: hidden;
    	padding-top: 50px;
	    padding-left: 2%;
	    padding-right: 2%;	
    }
    #step2 .grids .grid {
    	position: relative;
	    float: left;
	    padding: 0;
    	margin-bottom: 0;
	    width: 50%;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    transition:all 1s;
		-moz-transition:all 1s; /* Firefox 4 */
		-webkit-transition:all 1s; /* Safari and Chrome */
		-o-transition:all 1s; /* Opera */
    }
    #step2 .grids .grid.selected {
    	transform: scale(0.9);
    	
    }
    #step2 .grids .grid .horseContainer {
	  	position: relative;
	  	width: 100%;
	  	max-width: 180px;
	  	margin: auto;
	  	text-align: center;
	}

	.horseBg {
  		display: block;
  		width: 100%;
	}
	.horsePic{
	  	width: 70%;
	    position: absolute;
	    bottom: 9%;
	    right: 11%;
	}
	#step2 .grids .grid:nth-child(4) .horsePic {
		right: 12%;
	}
	#step2 .grids .grid:nth-child(5) .horsePic {
		right: 13%;
	}
	#step2 .grids .grid:last-child .horsePic {
		right: 14%;
	    bottom: 10%;
	    margin-bottom: 1px;
	}
	.indexPic {
	  	position: absolute;
	    width: 6%;
	    top: 12%;
	    right: 12%;
	    margin-right: 2px;
	}
	#step2 .grids .grid:first-child .indexPic {
		width: 4%;
	    top: 12%;
	    right: 13%;
	    margin-right: 3px;
	}
	.selectTx1, .selectTx2, .selectP {
	  	position: absolute;
	  	display: block;
	  	z-index: 2;
	}

	.selectTx1 {
	  	width: 40%;
	  	top: 10%;
	  	left: 25%;
	  	margin-top: -5px;
	}

	.selectTx2 {
	  	width: 70%;
	  	top: -12%;
	  	left: 10%;
	}

	.selectP {
	  	width: 65%;
	  	top: 25%;
	  	left: 15%;
	 	margin-left: 5px;
	}
	#step2 .tip {
		position: fixed;
  		width: 100%;
  		bottom: 15px;
	}
	#step2 .tip span {
		display: block;
  		width: 100%;
  		text-align: center;
  		color: #f2f2f2;
  		font-size: 20px;
  		letter-spacing: 2px;
	}
	.x-dialog {
		display: none;
		width: 100%;
	    height: 100%;
	    position: fixed;
	    left: 0;
	    top: 0;
	    z-index: 999;
	}
	.mask {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0px;
	    top: 0px;
	    background: rgba(0, 0, 0, 0.1);
	}
	.filter {
		-webkit-filter: blur(2px);
    	filter: blur(2px);
	}
	.dialog {
		position: absolute;
	    display: table;
	    z-index: 5000;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    margin: auto;
	    background-color: transparent;
	    text-align: center;
	    border-radius: 3px;
	    overflow: hidden;
	    width: 90%;
	}
	.dialog-close {
		position: absolute;
	    right: -2px;
	    top: 0px;
	    z-index: 11;
	    width: 40px;
	}
	.dialog-close img {
		width: 100%;
	}
	.dialog-yz .dialog {
		height: 440px;
		/*height: 100%;*/
	    /*max-height: 500px;*/
	    max-width: 440px;
	}
	.dialog-rule .dialog {
		height: 440px;
	    /*max-height: 450px;*/
	    max-width: 440px;
	    overflow: auto;
	}
	.dialog-tip .dialog {
		height: 100%;
	    width: 80%;
	    max-height: 220px;
	    max-width: 440px;
	}
	.dialog-box {
		position: relative;
		height: 100%;
	}
	.dialog-inner {
		height: 100%;
	}
	.yzDialogBg {
		display: block;
	    width: 100%;
	    height: 82%;
	    position: absolute;
	}
	.ruleDialogBg, .tipDialogBg{
		display: block;
	    width: 100%;
	    height: 100%;
	    position: absolute;
	}
	.yz-content {
		width: 100%;
	    height: 82%;
	    position: absolute;
	    z-index: 10;
	}
	.yz-content>h1 {
	  	font-size: 16px;
	  	color: #6c4229;
	  	width: 50%;
	  	height: 35px;
	  	line-height: 43px;
	  	letter-spacing: 1px;
	  	margin-left: 27%;
	}
	.yz-content .horse-show {
	  	position: relative;
	  	width: 135px;
	  	height: 135px;
	 	margin: auto;
	 	margin-top: 10px;  
	}
	.yz-content .horse-show img {
		width: 100%;
  		position: absolute;
  		left: 0;
	}
	.yz-content .horse-show img:first-child {
		top: 0;
    	z-index: 3;	
	}
	.yz-content .horse-show img:last-child {
    	bottom: -2px;
  	}
  	.yz-content .form-box {
  		padding-top: 10px;
  	}
  	.yz-content .form-box .form-item {
  		clear: both;
	    overflow: hidden;
	    height: 35px;
	    line-height: 35px;
	    padding: 0 20px;
  	}
  	.yz-content .form-box .form-item:not(:first-child) {
  		margin-bottom: 10px;
  	}
  	.yz-content .form-box .form-item label {
  		display: block;
      	float: left;
      	font-size: 16px;
      	color: #6c4229;
      	width: 60px;
      	text-align: left; 
  	}
  	.yz-content .form-box .form-item .input-box {
  		position: relative;
  		height: 100%;
      	float: left;
  	}
  	.yz-content .form-box .form-item .inputBg {
  		position: absolute;
        width: 100%;
        height: 100%;
        z-index: -1;
  	}
  	.yz-content .form-box .form-item input {
  		width: 100%;
        height: 100%;
        background-color: transparent;
        text-align: center;
        color: #f2f2f2;
        font-size: 15px;
  	}
  	.yz-content .form-box .form-item .optBtn {
  		display: block;
        position: absolute;
        z-index: 10;
        top: 0;
        width: 35px;
        height: 35px;
        background-size: cover;
        background-repeat:no-repeat;
        background-position:center;
  	}
  	.yz-content .form-box .form-item .minusBtn {
		left: 0;
        background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_minus.png');
  	}
  	.yz-content .form-box .form-item .minusBtn:hover {
  		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_click_minus.png');
  	}
  	.yz-content .form-box .form-item .addBtn {
		right: 0;
        background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_add.png');
  	}
  	.yz-content .form-box .form-item .addBtn:hover {
  		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_click_add.png');
  	}
  	.yz-content .form-box>p, .yz-content span.notice {
  		display: inline-block;
	    font-size: 14px;
	    color: #6c4229;
	    text-align: left;
  	}
  	.yz-content .form-box>p {
  		padding: 0 20px;
    	/*margin-top: 10px;*/
  	}
  	.rule-content{
  		width: 100%;
	    height: 100%;
	    position: absolute;
	    z-index: 10;
  	}
 	.rule-content > h1 {
	  	font-size: 22px;
	  	color: #6c4229;
	  	height: 50px;
	  	line-height: 55px;
	  	letter-spacing: 2px;
	}
	.rule-content section {
	 	padding: 5px 10px 0;
	  	text-align: left;
	  	box-sizing: border-box;
	  	overflow: auto;
	 	margin-top: 10px;
	}

	.rule-content section::-webkit-scrollbar {
	  	display: none;
	}

	.rule-content section .item-box {
	  	margin-bottom: 15px;
	}

	.rule-content section .item-box>h1 {
	  	color: #6c4229;
	  	font-size: 17px;
	}

	.rule-content section .item-box>p {
	  	color: #6c4229;
	  	font-size: 15px;
	  	text-indent: 26px;
	}
	.dialog-inner .bwrap {
	  	position: absolute;
	  	width: 100%;
	  	bottom: 0;
	}
	.dialog-inner .bwrap .binner {
	  	position: relative;
	  	width: 60%;
	  	margin: auto;
	}
	.dialog-inner .bwrap .binner .btn {
	  	display: block;
	  	width: 100%;
	}
	.dialog-inner .bwrap .binner span {
	  	position: absolute;
	  	top: 50%;
	  	margin-top: -15px;
	  	display: block;
	  	width: 100%;
	  	text-align: center;
	  	color:rgb(47,71,21);
	  	font-size: 20px;
	  	font-weight: 600;
	  	letter-spacing: 2px;
	}
	.dialog-inner .bwrap .binner em {
		font-style: normal;
		color: rgb(47,71,21);
	  	font-size: 20px;
	  	font-weight: 600;
	  	letter-spacing: 2px;
	}

	.tip-content {
		width: 100%;
	    height: 100%;
	    position: absolute;
	}

	.tip-content>h1 {
	  	font-size: 25px;
	  	color: #6c4229;
	 	width: 100%;
	  	height: 60px;
	  	line-height: 60px;
	  	letter-spacing: 1px;
	}

	.tip-content .form-box .form-item{
    	clear: both;
	    overflow: hidden;
	    padding: 0 10px;
	   	color: #6c4229;
	   	font-size: 15px;
	   	text-align: left;
	}
	.dialog-tip .dialog-inner .bwrap {
	  position: absolute;
	  width: 100%;
	  bottom: 10px;
	}
	.dialog-tip .dialog-inner .bwrap .binner {
	  position: relative;
	  width: 100%;
	  margin: auto;
	}
	.dialog-tip .dialog-inner .bwrap .binner .btn {
	  display: block;
	  width: 100%;
	}
	.dialog-tip .dialog-inner .bwrap .binner span {
	  position: absolute;
	  top: 50%;
	  margin-top: -15px;
	  display: block;
	  width: 100%;
	  text-align: center;
	  color:#f2f2f2;
	  font-size: 18px;
	  letter-spacing: 2px;
	}

	.dialog-tip .grids{
		position: relative;
    	overflow: hidden;
	}

	.dialog-tip .grids .grid{
		position: relative;
	    float: left;
	    padding: 20px 10px;
	    width: 50%;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	}

	.tipContainer {
		position: relative;
	    width: 100%;
	    /* max-width: 210px; */
	    margin: auto;
	    text-align: center;
	}

	#step3 .playTitle{
		display: none;
		position: absolute;
	    width: 100%;
	    left: 0;
	    top: 0;
	    z-index: 100;
	    text-align: center;
	}
	#step3 .playTitle .timeCount {
		overflow: hidden;
		clear: both;
		padding: 10px 15px 15px;
	}
	#step3 .playTitle .timeCount>img {
		display: block;
	    float: left;
	    width: 30px;
	}
    .xui-wrapper {
    	float: left;
	    width: calc(100% - 45px);
	    height: 10px;
	    margin-left: 15px;
	    border-radius: 10px;
	    margin-top: 12px;
    }
    .xui-wrapper .xui-process {
        position: relative;
        display: inline-block;
        vertical-align: middle;
        width: 100%;
        height: 100%;
        border-radius: 10px;
        overflow: hidden;
    }

    .xui-wrapper .xui-process .xui-process-static {
        width: 100%;
        height: 100%;
        border-radius: 10px;
        background-color: rgba(255,255,255,.46);
    }
    .xui-wrapper .xui-process .xui-process-active {
        position: absolute;
        top: 0;
        left: 0;
        width: 0;
        height: 100%;
        border: 0;
        border-radius: 10px;
        background-image: linear-gradient(-60deg, transparent 0rem, transparent 0.8rem, rgba(255,255,255,.3) 0.8rem, rgba(255,255,255,.3) 1.6rem, transparent 1.6rem, transparent 2.4rem, rgba(255,255,255,.3) 2.4rem);
        background-color: rgb(248,83,83);
        background-size: 23px 38px;
        -webkit-animation: process 800ms infinite linear;
        animation: process 800ms infinite linear;
    }
 
    /* 动画 */
    @-webkit-keyframes process {
        0% { background-position: 0 0; }
        100% { background-position: 24px 0; }
    }
    @keyframes process {
        0% { background-position: 0 0; }
        100% { background-position: 24px 0; }
    }
	#step3 .playTitle p {
		width: 100%;
	}
	#step3 .playTitle p.titleTips {
		font-size: 22px;
    	color: #f6ff00;
	}
	#step3 .playTitle p.wait {
		color: #f2f2f2;
    	font-size: 30px;
	}
	#step3 .content {
		position: absolute;
		overflow: hidden;
	    width: 100%;
	    height: 100%;
	    top: 0;
	    left: 0;
	}
	#step3 .playTitle .horseInfo{
		position: relative;
	}
	#step3 .playTitle .horseInfo .tapHorseBg {
		width: 95%;
	}
	#step3 .playTitle .horseInfo .tapNumBg {
		position: absolute;
	    width: 10%;
	    left: 45%;
	    bottom: -4px;
	    z-index: 1;
	}
	#step3 .playTitle .horseInfo .tapNum {
		position: absolute;
	    width: 28%;
	    left: 36%;
	    top: -12px;
	}
	#step3 .playTitle .horseInfo .tapHorse {
		position: absolute;
		width: 28%;
	    left: 36%;
	    top: -16px;
	    margin-left: 1px;
	}
	#step3 .playTitle .horseInfo span{
		position: absolute;
	    width: 10%;
	    left: 45%;
	    bottom: 0;
	    z-index: 1;
	    font-size: 20px;
	    color: #6c4229;
	    font-weight: 600;

	}
	.horse-bg {
		position: relative;
	    height: 100%;
	    width: 100%;
	}
	.horse-bg>div {
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-repeat: no-repeat;
		background-size: contain;
	    background-position: center;    
	}
	.horse-bg .horse-wait {
		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_wait_new.png')
	}
	.horse-bg .horse-shake {
		display: none;
		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_shake_new.gif')
	}
	.horse-bg .horse-tail {
		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_tail.gif')
	}
	/*@-webkit-keyframes horseRun{
	  0%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_1.png')
	  }
	  20%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_2.png')
	  }
	  40%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_3.png')
	  }
	  60%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_4.png')
	  }
	  80%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_5.png')
	  }
	  100%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/horse/horse_5.png')
	  }
	}
*/
	.pdTips {
		display:none;
		position: absolute;
		z-index: 2;
		background-repeat: no-repeat;
		height: 100%;
		width: 100%;
		background-size: 90%;
		background-position: center;
		background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pd/pd_tip.gif')  
	}

	.bzActived {
	  display: none;
	  position: absolute;
	  z-index: 2;
	  background-repeat: no-repeat;
	  height: 100%;
	  width: 100%;
	  background-size: 100%;
	  background-position: center;
	  -webkit-animation: bzRun 1s steps(1,end) infinite;
	}
	@-webkit-keyframes bzRun{
	  0%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_1.png')
	  }
	  20%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_2.png')
	  }
	  40%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_3.png')
	  }
	  60%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_4.png')
	  }
	  80%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_5.png')
	  }
	  100%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/bz/bz_5.png')
	  }
	}

	.ylActived {
	  display: none;
	  position: absolute;
	  z-index: 2;
	  background-repeat: no-repeat;
	  height: 100%;
	  width: 100%;
	  background-size: 100%;
	  background-position: center;
	  -webkit-animation: ylRun 1s steps(1,end) infinite;
	}
	@-webkit-keyframes ylRun{
	  0%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_1.png')
	  }
	  20%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_2.png')
	  }
	  40%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_3.png')
	  }
	  60%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_4.png')
	  }
	  80%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_5.png')
	  }
	  100%{
	  	background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yl/yl_6.png')
	  }
	}

	.pdActived {
		display: none;
	  	position: absolute;
	    z-index: 10;
	    background-repeat: no-repeat;
	    height: 200px;
	    width: 200px;
	    background-size: cover;
	    background-position: center;
	    /*-webkit-animation: pdRun 0.3s steps(1,end) infinite;*/
	}

	@-webkit-keyframes pdRun{
	  0%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pd/pd_1.png')
	  }
	  50%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pd/pd_2.png')
	  }
	  100%{
	    background-image: url('${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pd/pd_2.png')
	  }
	}
	#step4 {
		padding-top: 20%;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	}
	#step4 .championTitle {
		position: relative;
	    z-index: 10;
	    width: 45%;
	    max-width: 300px;
	    margin: auto;
	    margin-bottom: 15px;
	}
	#step4 .championTitle .avator {
		width: 100%;
	}
	#step4 .championTitle .champion {
		display: none;
		position: absolute;
	    width: 160%;
	    left: -30%;
	    bottom: 0;
	    z-index: 1;
	}
	#step4 .championTitle .sunshine {
		display: none;
		position: absolute;
	    width: 180%;
	    left: -40%;
	    top: -40%;
	    z-index: -1;
	}
	#step4 .championTitle .horse{
		display: none;
		position: absolute;
	    width: 100%;
	    left: 0%;
	    bottom: 12px;
	}
	#step4 .content {
		width: 50%;
	    max-width: 300px;
	    margin: auto;
	    margin-top: 15%;
	}
	#step4 .content img {
		display: none;
		width: 100%;
	}

	#step5 {
		padding-top: 20px;
		box-sizing: border-box;
	}
	#step5 .championTitle {
		position: relative;
	    z-index: 10;
	    width: 35%;
	    max-width: 270px;
	    margin: auto;
	    margin-bottom: 15px;
	}
	#step5 .championTitle .avator {
		width: 100%;
	}
	#step5 .championTitle .champion {
		position: absolute;
	    width: 160%;
	    left: -30%;
	    bottom: 0;
	    z-index: 1;
	}
	#step5 .championTitle .sunshine {
		position: absolute;
	    width: 180%;
	    left: -40%;
	    top: -40%;
	    z-index: -1;
	}
	#step5 .championTitle .horse{
	    position: absolute;
	    width: 100%;
	    left: 0%;
	    bottom: 4px;
	}
	#step5 .bwrap {
	  position: fixed;
	  width: 100%;
	  bottom: 15px;
	}
	#step5 .bwrap .binner {
	  position: relative;
	  width: 60%;
	  max-width: 300px;
	  margin: auto;
	}
	#step5 .bwrap .binner .btn {
	  display: block;
	  width: 100%;
	}
	#step5 .bwrap .binner span {
	  position: absolute;
	  top: 50%;
	  margin-top: -15px;
	  display: block;
	  width: 100%;
	  text-align: center;
	  color: rgb(47,71,21);
	  font-size: 20px;
	  letter-spacing: 2px;
	  font-weight: 600;
	}

	#step5 .table-box {
	  position: relative;
	  width: 90%;
	  margin: auto;
	  max-width: 550px;
	  max-height: 450px;
	}

	#step5 .table-inner {
	  height: 100%;
	}

	#step5 .tableBg {
	  display: block;
	  width: 100%;
	  height: 100%;
	  position: absolute;
	}
	#step5 .table-content {
		width: 100%;
	  	height: 100%;
	  	position: absolute;
	  	z-index: 10;
	}
	#step5 .table-header {
		display: flex;
	    width: 100%;
	    list-style: none;
	    height: 11%;
	    -webkit-align-items: center;
	    align-items: center;
	    -webkit-justify-content: center;
	    justify-content: center;
	}

	#step5 .table-header li, #step5 .table-content section ul li{
		display: -webkit-box;
	    display: -webkit-flex;
	    display: flex;
	    -webkit-box-align: center;
	    -webkit-align-items: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    -webkit-justify-content: center;
	    justify-content: center;
		flex: 1;
      	color: #6c4229;
      	text-align: center;
      	overflow: hidden;
      	text-overflow: ellipsis;
	    white-space: nowrap;
	}
	#step5 .table-content section ul li:first-child {
		-webkit-justify-content: left;
	    justify-content: left;
	    text-align: left;
	}
	#step5 .table-content section {
		height: 85%;
	    box-sizing: border-box;
	    overflow: auto;
	}
	#step5 .table-content section::-webkit-scrollbar {
	    display: none;
	  
	}
	#step5 .table-content section ul {
		display: flex;
      	width: 100%;
      	list-style: none;
      	-webkit-align-items: center;
      	align-items: center;
      	-webkit-justify-content: center;
      	justify-content: center;
      	padding: 7px;
      	box-sizing: border-box;
	}
	#step5 .table-content section ul:nth-child(even) {
		background-color: rgb(195, 155, 128, 0.7);
	}
	#step5 .table-content section ul li img{
		width: 40px;
	    height: 40px;
	    border-radius: 50%;
	    padding: 0 5px;
	}
	#step5 .table-content section ul li span {
		color: #6c4229;
      	overflow: hidden;
		text-overflow: ellipsis;
	    white-space: nowrap;
	}
    #step6 {
		padding-top: 20px;
  		box-sizing: border-box;
    }
    #step6 .bwrap {
	  position: fixed;
	  width: 100%;
	  bottom: 20px;
	}
	#step6 .bwrap .binner {
	  position: relative;
	  width: 60%;
	  max-width: 300px;
	  margin: auto;
	}
	#step6 .bwrap .binner .btn {
	  display: block;
	  width: 100%;
	}
	#step6 .bwrap .binner span {
	  position: absolute;
	  top: 50%;
	  margin-top: -15px;
	  display: block;
	  width: 100%;
	  text-align: center;
	  color: rgb(47,71,21);
	  font-size: 20px;
	  font-weight: 600;
	  letter-spacing: 2px;
	}

	#step6 .table-box {
	  position: relative;
	  width: 90%;
	  height: 80%;
	  margin: auto;
	  max-width: 550px;
	  max-height: 580px;
	}

	#step6 .table-inner {
	  height: 100%;
	}

	#step6 .tableBg {
	  display: block;
	  width: 100%;
	  height: 100%;
	  position: absolute;
	}
	#step6 .table-content {
		width: 100%;
	  	height: 100%;
	  	position: absolute;
	  	z-index: 10;
	}
	#step6 .table-header {
		display: flex;
	    width: 100%;
	    list-style: none;
	    height: 11%;
	    -webkit-align-items: center;
	    align-items: center;
	    -webkit-justify-content: center;
	    justify-content: center;
	    padding: 0 5px;
    	box-sizing: border-box;
	}

	#step6 .table-header li, #step6 .table-content section ul li{
		flex: 1;
      	color: #6c4229;
      	text-align: center;
	}
	#step6 .table-header li {
		font-size: 17px;
	}
	#step6 .table-content section ul li {
		word-break: break-all;
		font-size: 15px;
	}
	#step6 .table-content section ul li:nth-child(3) {
		font-size: 12px;
	}
	#step6 .table-content section ul li img {
		width: 45px;
	}
	#step6 .table-content section {
		height: 85%;
	    box-sizing: border-box;
	    overflow: auto;
	}
	#step6 .table-content section::-webkit-scrollbar {
	    display: none;
	  
	}
	#step6 .table-content section ul {
		display: flex;
      	width: 100%;
      	list-style: none;
      	-webkit-align-items: center;
      	align-items: center;
      	-webkit-justify-content: center;
      	justify-content: center;
      	padding: 7px 5px;
      	box-sizing: border-box;
	}
	#step6 .table-content section ul:nth-child(even) {
		background-color: rgb(195, 155, 128, 0.7);
	}
	/*.dialog, .mask {display: none;}*/
	.dialog-tip .mask {background-color: rgba(0,0,0,0.6)}
	.payTip {
		position: fixed;
	    z-index: 1000;
	    top: 0;
	    right: 0;
	    left: 0;
	    bottom: 0;
	    background: rgba(0,0,0,0.85);
	}
	.payTip .content {
		position: relative;
		width: 90%;
		margin: auto;
		padding-top: 5%;
	}
	.payTip .content img {
		display:block;
		margin: auto;
	}
	.payTip .content>img {
		width: 70%;
	}

	.payTip .content .inner {
		margin: 25px 0;
	}

	.payTip .content .horseInfo{
		position: relative;
		z-index: 1;
	}

	.payTip .content .horseInfo .tapNumBg {
		position: absolute;
	    width: 14%;
	    left: 43%;
	    bottom: -12%;
	    z-index: 1;
	}
	.payTip .content .horseInfo .tapNum {
	    width: 35%;
	}
	.payTip .content .horseInfo .tapHorse {
		position: absolute;
	    width: 36%;
	    left: 32%;
	    bottom: 5px;
	}
	.payTip .content .horseInfo span{
		position: absolute;
	    width: 14%;
	    left: 43%;
	    bottom: -3%;
	    z-index: 1;
	    font-size: 25px;
	    color: #6c4229;
	    font-weight: 600;
	    text-align: center;
	    line-height: 25px;

	}

	.payTip .content .yzInfo  {
		position: relative;
		margin-top: -19%;
	}

	.payTip .content .yzInfo .pay-bg {
		width: 100%;
	}

	.payTip .content .yzInfo .form-box {
		position: absolute;
	    width: 50%;
	    top: 50%;
	    left: 25%;
	    margin-top: -10px;
	}

	.payTip .content .yzInfo .form-box .form-item {
		clear: both;
	    overflow: hidden;
	    height: 35px;
	    line-height: 30px;
	    margin-bottom: 15px;
	}

	.payTip .content .yzInfo .form-box .form-item label {
		display: block;
	    float: left;
	    font-size: 18px;
	    color: rgb(108,66,41);
	    width: 30%;
	    font-weight: 600;
	    text-align: center;
	}

	.payTip .content .yzInfo .form-box .form-item .input-box {
		float: left;
	    width: 60%;
	    background-color: rgba(156,80,60, 0.35);
	    border-radius: 5px;
	    text-align: center;
	    margin-left: 5px;
	}

	.payTip .content .yzInfo .form-box .form-item .input-box span {
		font-size: 25px;
		color: #fff;
	}

	.payTip .content .yzInfo .form-box .form-item .input-box span.no-table {
		font-size: 15px;
	}

	.payTip .content .yzInfo .form-box .form-item .input-box span.unit {
		font-size: 16px;
		margin-left: 5px;
	}

	.payTip .content p {
		width: 100%;
		font-size: 18px;
		color: #fff;
		text-align: center;
		margin-bottom: 5px;
	}

	.payTip .content p.payText {
		font-size: 22px;
		color: rgb(255,206,97);
		margin-top: 20px;
	}

	.payTip .content p span {
		color: rgb(253,106,11);
		font-size: 18px;
	}

	.stopTip .content {
		position: relative;
		width: 90%;
		margin: auto;
		padding-top: 100px;
	}
	.stopTip .content img {
		display:block;
		margin: auto;
	}
	.stopTip .content p {
		width: 100%;
		font-size: 18px;
		color: #fff;
		text-align: center;
		margin-top: 20px;
	}

	.stopTip .content .pay-fail {
		width: 55%;
	}

	.stopTip .content .yz-error {
		width: 70%;
		margin-top: 15px;
	}

	/*决赛倒数*/
        #beforeGame{text-align:center; display:table; z-index:19; position:fixed; left:0; top:0; width:100%; height:100%;}
        #beforeGame.start{animation:beforeGameAnimate 0.3s forwards; transform:scale(1.8); opacity:0;}
        #beforeGame *{font-size:40px; font-weight:bold; letter-spacing:4px; color:#fff;}
        #beforeGame tt{border-radius:50%; width:150px; height:150px; display:inline-block; line-height:150px; text-align:center; opacity:0.8; font-family:"Times New Roman", Times, serif; /*border:solid 2px #fff;*/}
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
</style>
</head>
<body>
<div class="app">
	<div id="step1" class="step">
		<a class="record" onclick="step1.recordEvt()">
	      	<div class="recordInner">
	         	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_records.png" class="ic-record"/>
	        	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_tip.png" class="ic-tip"/>
	        	<span>中奖纪录</span>
	      	</div>
	    </a>
		<img class="logo" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_logo.png" alt="疯狂拍马屁LOGO"/>
		<p class="waitTip">请等待游戏开始...</p>
		<!-- <div class="bwrap animated infinite fadeIn">
	      <div class="binner">
	        <img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_button.png"/>
	        <span>开始押注</span>
	      </div>
    	</div> -->
	</div>
	<div id="step2" class="step">
		<a class="record" onclick="step2.ruleDialogEvt()">
	      	<div class="recordInner">
	         	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_records.png" class="ic-record"/>
	        	<span>游戏规则</span>
	      	</div>
	    </a>
	    <div class="grids">
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/1.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_1.png" class="horsePic"> 
	    		</div>
	    	</a>
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/2.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_2.png" class="horsePic"> 
	    		</div>
	    	</a>
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/3.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_3.png" class="horsePic"> 
	    		</div>
	    	</a>
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/4.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_4.png" class="horsePic">
	    		</div>
	    	</a>
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/5.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_5.png" class="horsePic"> 
	    		</div>
	    	</a>
	    	<a href="javascript:void(0)" class="grid">
	    		<div class="horseContainer">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_select_horse.png" class="horseBg"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/6.png" class="indexPic"> 
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_6.png" class="horsePic"> 
	    		</div>
	    	</a>
	    </div>
	    <c:if test="${isPay}">
	    	<div class="payTip">
	    		<div class="content">
	    			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yz_success.png" />
	    			<div class="inner">
	    				<div class="horseInfo">
							<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/tap_num_bg.png" class="tapNumBg" />
							<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_avator.png" class="tapNum" />
							<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_success_1.png" class="tapHorse" />
							<span>1</span>
						</div>
						<div class="yzInfo">
							<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pay_bg.png" class="pay-bg" />
							<div class="form-box">
								<div class="form-item">
	                    			<label>押注</label>
	                    			<div class="input-box">
	            						<span class="yz-num"></span><span class="unit">瓶</span>		
	                   				</div>
	                  			</div>
	                  			<div class="form-item">
	                    			<label>桌号</label>
	                    			<div class="input-box">
	                      				<span class="yz-table"></span>
	                   				</div>
	                  			</div>
							</div>
							
						</div>
	    			</div>
	    			<p>游戏开始后<span>请用力拍打马屁股，</span></p>
	    			<p>拍打速度越快，获胜机率越高。</p>
	    			<p class="payText">游戏即将开始...</p>
	    		</div>	
	    	</div>
	    </c:if>
	    <div class="tip">
      		<span>请选马押注...</span>
    	</div>
	</div>
	<div id="step3" class="step">
		<div class="horse-bg">
			<div class="horse-wait"></div>
			<div class="horse-shake"></div>
			<div class="horse-tail"></div>
		</div>
		<div class="playTitle">
			<div class="timeCount">
				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_clock.png" class="animated infinite tada"/>
				<div class="xui-wrapper xui-myPromption-wrapper">
     				<div class="xui-process">
			            <div class="xui-process-static"></div>
			            <div id="process-bar" class="xui-process-active"></div>
			        </div>  
			  	</div>
			</div>
			<div class="horseInfo">
				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/tap_horse_bg.png" class="tapHorseBg" />
				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/tap_num_bg.png" class="tapNumBg" />
				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_avator.png" class="tapNum" />
				<img src="" class="tapHorse" />
				<span></span>
			</div>
	    </div>
	    <div id="tap" class="content">
			<div class="pdTips"></div>
			<div class="bzActived"></div>
	      	<div class="pdActived"></div>
	      	<div class="ylActived"></div>
	    </div>
	    <!--增加音频-->
		<audio style="display:none" id="audio" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/audio/track.mp3"></audio>
		<audio style="display:none" id="bzaudio" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/audio/baozou.mp3"></audio>
		<audio style="display:none" id="ylaudio" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/audio/yongli.mp3"></audio>
	</div>
	<div id="step4" class="step">
		<div class="championTitle">
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_avator.png" class="avator" />
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_champion.png" class="champion success"/>
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_loser.png" class="champion loser"/>
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/sunshine.png" class="sunshine success"/>
	      	<img src="" class="horse" />
	    </div>
	    <div class="content">
	      <img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/success.png" class="success"/>
	      <img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/error.png" class="loser"/>
	    </div>
	</div>
	<div id="step5" class="step">
		<div class="championTitle">
      		<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_avator.png" class="avator" />
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_champion.png" class="champion" />
	      	<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/sunshine.png" class="sunshine"/>
	      	<img src="" class="horse" />
    	</div>
    	<div class="table-box" style="height: calc(65% - 50px);">
      		<div class="table-inner">
        		<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_champion_bottom.png" class="tableBg"/>
        		<div class="table-content">
          			<ul class="table-header">
            			<li>用户</li>
			            <li>桌号</li>
			            <li>获胜酒数</li>
          			</ul>
          			<section>
          			</section>
        		</div>
      		</div>
    	</div>
    	<div class="bwrap">
      		<div class="binner">
		        <img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_button.png"/>
		        <span><a href="/cwechat/barenterinter?tcbid=${barid}" style="color: #fff;">返回微上墙</a></span>
		     </div>
    	</div>
	</div>
	<div id="step6" class="step">
		<div class="table-box">
	      	<div class="table-inner">
		        <img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/rule_BG.png" class="tableBg"/>
		        <div class="table-content">
		          	<ul class="table-header">
			            <li>酒吧名称</li>
			            <li>酒数</li>
			            <li>日期</li>
			            <li>兑奖</li>
		          	</ul>
		          	<section>
		          
		          	</section>
		        </div>
	      	</div>
	    </div>
	    <div class="bwrap">
	      	<div class="binner" onclick="step6.goBackGame()">
	        	<img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_button.png"/>
	        	<span>返回游戏</span>
	      	</div>
	    </div>
	</div>
	<div class="x-dialog dialog-yz">
		<div class="mask"></div>
		<div class="dialog">
			<a href="javascript:void(0)" class="dialog-close" onclick="dialog.close()">
				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/close.png" />
			</a>
			<div class="dialog-box">
				<div class="dialog-inner">
					<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_wine_bottom.png" class="yzDialogBg">
					<div class="yz-content">
                		<h1>请选择押酒数量</h1>
                		<div class="horse-show">
                  			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_show_horse_1.png" class="selectHorse"/>
                  			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_horse_bottom.png" />
                		</div>
                		<div class="form-box">
                  			<div class="form-item">
                    			<label>押酒数</label>
                    			<div class="input-box" style="width: calc(100% - 65px);">
                      				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_bottom_1.png" class="inputBg"/>
                      				<span class="minusBtn optBtn" onclick="step2.minus()"></span>
                      				<span class="addBtn optBtn" onclick="step2.add()"></span>
                      				<input type="text" class="yzn" placeholder="请输入押酒数量" onchange="step2.change(this)" maxlength="3" />
                   				</div>
                  			</div>
                  			<div class="form-item" style="height: 20px;line-height: 20px;">
                    			<label style="color:transparent;">说明：</label>
                    			<span class="notice" style="width: calc(100% - 65px);">注：1瓶酒=${price}元</span>
                  			</div>
                  			<div class="form-item">
                    			<label>桌&nbsp;&nbsp;&nbsp;号</label>
                    			<div class="input-box" style="width: calc(100% - 65px);">
                      				<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_bottom_1.png" class="inputBg"/>
                      				<input type="text" class="yzt" value="" placeholder="请输入桌号" maxlength="20" />
                    			</div>
                  			</div>
                  			<p>备注：所选马赢得冠军后，将按照你在冠军马的押酒比例分得全场押注酒瓶数。</p>
                		</div>
              		</div>
              		<div class="bwrap">
              			<div class="binner" onclick="step2.confirm()">
              				<img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/ic_button.png"/>
              				<span>支付￥<em class="totalMoney">0</em>元</span>
              			</div>
              		</div>
				</div>
			</div>
		</div>
	</div>
	<div class="x-dialog dialog-rule">
		<div class="mask"></div>
		<div class="dialog">
			<div class="dialog-box">
				<a href="javascript:void(0)" class="dialog-close" onclick="dialog.close()">
					<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/close.png" />
				</a>
				<div class="dialog-inner">
					<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/rule_BG.png" class="ruleDialogBg"/>
		            <div class="rule-content">
		              <h1>拍马屁游戏规则</h1>
		              <section style="height: calc(95% - 50px);">
		                <div class="item-box">
		                  <h1>1.押注流程</h1>
		                  <p>通过游戏界面选择你喜欢的马，购买啤酒进行押注，最少押注</p>
		                  <p style="color: rgb(237,77,77)">注意：你只能选择一匹马押酒，支付成功后不能重新选马押酒。</p>
		                </div>
		                <div class="item-box">
		                  <h1>2.怎么输赢</h1>
		                  <p>游戏开始后手机界面会出现一匹马的屁股，拍打马屁的次数越多，你押酒的马越有可能获得冠军，在规定时间内全场拍马屁人均次数最多的那匹马将获得冠军。</p>
		                </div> 
		                <div class="item-box">
		                  <h1>3.酒水怎么分</h1>
		                  <p>若你押的马获得冠军，按照你对冠军马押注比例来分得全场的押酒总数。</p>
		                </div> 
		               <!--  <div class="item-box">
		                  <p style="text-indent: 0;"><span style="font-size: 17px;color: #6c4229;font-weight: 600;">4.</span>微喵服务号会给冠军吗的押注用户发送领取酒水的消息凭证，凭服务号可向酒吧工作人员领取获胜的酒水，请及时关注“微喵”服务号。</p>
		                </div>  -->
		                <div class="item-box">
		                  <p style="text-indent: 0;"><span style="font-size: 17px;color: #6c4229;font-weight: 600;">4.</span>游戏过程中若出现异常情况导致电子屏幕关闭无法进行游戏，支付游戏费用将在6小时内退回原支付账户。</p>
		                </div> 
		                <!-- <div class="item-box">
		                  <p style="text-indent: 0;"><span style="font-size: 16px;color: #6c4229;font-weight: 600;">6.</span>下注6小时后酒吧未开始游戏，支付游戏费用将退回原支付账号。</p>
		                </div>  -->
		              </section>
		            </div>
				</div>
			</div>
		</div>
	</div>
	<div class="x-dialog dialog-tip">
		<div class="mask"></div>
		<div class="dialog">
			<div class="dialog-box">
				<div class="dialog-inner">
					<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/tip_BG.png" class="tipDialogBg"/>
	              	<div class="tip-content">
		                <h1>提示</h1>
		                <div class="form-box">
		                  	<div class="form-item">
		                    	请与酒吧工作人员联系并当面点击使用，点击'确认兑换'后奖券失效，不可再次兑换，请谨慎操作。
		                  	</div>
		                </div>
		             </div>
	              	<div class="bwrap">
	              		<div class="grids">
	              			<div class="grid">
	              				<div class="tipContainer">
	              					<div class="binner" onclick="dialog.close()">
	              						<img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/cancel.png"/>
	                        			<span>取消</span>
	              					</div>
	              				</div>
	              			</div>
	              			<div class="grid">
	              				<div class="tipContainer">
	              					<div class="binner" onclick="step6.bootlikRedeem()">
	              						<img class="btn" src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/confirm.png"/>
	                        			<span>确定</span>
	              					</div>
	              				</div>
	              			</div>
	              		</div>
	              	</div>
				</div>
			</div>
		</div>
	</div>
	<div class="stopTip step" style="display: none;">
		<div class="content">
			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/pay_fail.png" class="pay-fail" />
			<img src="${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/yz_error.png" class="yz-error" />
	   		<p>请等待下一轮游戏开始...</p>
		</div>	
	</div>
</div>
<script type="text/javascript">
	window.step = ${state};
	window.num = 0;
	window.checkNum = 0;
	var bzaudio = document.getElementById('bzaudio');
	var ylaudio = document.getElementById('ylaudio');
	var payState = '${isPay}';
	var config = {
		price: '${price}',
		// infoid: '1',
		infoid: '${infoid}',
		barid: '${barid}',
		gameTime: '${gameTime}',
		tapTime: 100,
		url: ''
	}
	// dialog公共方法
    var dialog = {
        show: function(dom) {
            dom.fadeIn();
        },

        close: function() {
        	$('#step2 .grid').removeClass('selected');
        	$('#step2 .grid .horseBg').attr('src', step2.imgUrl+'ic_select_horse.png');
        	$('#step2').removeClass('filter');
            $('.x-dialog').fadeOut();
        }
    }

    // ajax公共方法
    var ajaxFun = function(url,data,fn,efn) {
        $.ajax({
            url: url,
            type: 'post',
            data: data,
            dataType: 'json',
            success: fn,
            error: efn
        })
    }

	var step1 = {
		tipStatus: false,
		recordEvt: function() {
			let state = 5;
			setSteps(state);
		},

		init: function() {
			this.getRecordList()
		},

		getRecordList() {
			let api = config.url + '/cwechat/getMyBootlikWinList',
				data = {
					barid: config.barid
				}
			ajaxFun(api, data, this.recordSucces);
		},

		recordSucces(res) {
			if(res.isResultTrue) {
				let info = res.resultMsg,
					str = '';
				step1.tipStatus = false;
				if(info == 'null') {
					str = '<p style="text-align:center;line-height:70px;color:#6c4229;font-size:16px;">暂无获奖列表信息</p>';
				}else{
					let data = JSON.parse(info);
		            for(var i in data) {
		                str += '<ul class="item-box"><li>'+data[i].barname+'</li><li>'+data[i].winNum+'瓶</li><li>'+data[i].gametime+'</li>';
		                if(data[i].state == 0) {
		                	step1.tipStatus = true;
		                	str += '<li><a href="javascript:void(0)" onclick="step6.dialogTipShow(\''+data[i].id+'\')"><img src="'+step2.imgUrl+'ic_exchange.png" /></a></li>';
		                }else if(data[i].state == 1) {
		                	str += '<li><img src="'+step2.imgUrl+'ic_exchanged.png" /></li>';
		                }
		                str += '</ul>';
		            }
				}
				step1.tipStatus ? $('.record .recordInner .ic-tip').show() : $('.record .recordInner .ic-tip').hide();
				$('#step6 .table-content section').html(str);
			}
		},
	}

	var step2 = {
		imgUrl:'${SysConf.STATIC_DOMAIN}/wemew/wechat/images/track/',
		horseNum: '',
		init: function() {
			this.yzDialogEvt()
			if(payState == 'true') {
				getInfo()
			}
		},

		setInfo: function(data) {
			let horseNum = data.horsenum,
				yzn = data.buynum,
				tableNum = data.tablenum;
			if(tableNum === '') {
				tableNum = '未输桌号';
				$('.payTip .yz-table').addClass('no-table')
			}
			$('.payTip .horseInfo .tapHorse').attr('src', this.imgUrl+'ic_horse_success_'+horseNum+'.png');
        	$('.payTip .horseInfo span').text(horseNum);
        	$('.payTip .yz-num').text(yzn);
        	$('.payTip .yz-table').text(tableNum);
		},

		yzDialogEvt: function() {
			$('#step2 .grid').click(function(){
				$('#step2').addClass('filter');
				let index = $(this).index() + 1;
				$('.dialog-yz .selectHorse').attr({src:step2.imgUrl+'ic_show_horse_'+index+'.png'})
				$('.dialog-yz .yzn').val('');
				$('.dialog-yz .yzt').val('');
				$('.dialog-yz .totalMoney').text('0');
				$(this).find('.horseBg').attr('src', step2.imgUrl+'ic_select_horse_click.png');
				$(this).addClass('selected');
				step2.selectHorseEvt(index);
				step2.horseNum = index;
			})
		},

		ruleDialogEvt: function() {
			$('#step2').addClass('filter');
			dialog.show($('.dialog-rule'));
		},

		confirm: function() {
			let account = $('.totalMoney').text(),
				yzn = $('.yzn').val(),
				yzt = $('.yzt').val(),
				reg = /^[1-9]\d*$/;
			if(yzn == '' || !yzn || yzn <= 0 || !reg.test(yzn)) {
				showInfo('请输入有效的正整数押注数量', false, {top: '40%', 'z-index': '10000'});
				return;
			}
			let u = config.url + '/cwechat/payForBootlick?barid='+config.barid+'&infoid='+config.infoid+'&num='+yzn+'&tableNum='+yzt;
			window.location.href = u;
		},

		selectHorseEvt: function(horseNum) {
			let api = config.url + '/cwechat/setHorseNum',
				data = {
					tcbid: config.barid,
					infoid: config.infoid,
					horseNum: horseNum
				}
			ajaxFun(api, data, this.selectHorseSuccess);
		},

		selectHorseSuccess: function(res) {
			if(res.isResultTrue) {
				dialog.show($('.dialog-yz'));
			}
		},

		change: function(e) {
			let num = $(e).val(),
				reg = /^[1-9]\d*$/;
			if(num == '' || !num || num <= 0 || !reg.test(num)) num = '';
			$(e).val(num);
			this.getTotal(num);
		},

		minus: function() {
			let num = Number($('.yzn').val());
			num--;
			if(num <= 0) num = '';
		    $('.yzn').val(num);
		    this.getTotal(num);
		},

		add: function() {
			let num = Number($('.yzn').val());
			num++;
			if(num >= 1000) {
				num = 999;
			}
			$('.yzn').val(num);
			this.getTotal(num);
		},

		getTotal: function(num) {
			let total = Number(num)*Number(config.price);
			$('.totalMoney').text(total);
		}
	}

	// 拍打马屁操作
	var Tap = function(){
		var audio = document.getElementById('audio');
		Touch.call(this,{obj:$('#tap')[0]});
		// 手指按下时
		this.onStart = function(e){
			if(!step3.status) {
				audio.play();
			}
			window.num++;
        	window.checkNum++;
			$('.pdActived').css({
				left: step3.pointerXY(e).l,
				top: step3.pointerXY(e).t,
				'background-image': "url('"+step2.imgUrl+"pd/paima-01.png')"
			}).show();
			$('#step3 .horse-bg .horse-wait').hide();
			$('#step3 .horse-bg .horse-shake').show();
		}
		// 滑动中
		this.onMove = function(e){
			$('.pdActived').css({
				left: step3.pointerXY(e).l,
				top: step3.pointerXY(e).t
			})	
		}
		// 滑动结束 手指抬起时
        this.onEnd = function(e){
        	$('.pdActived').css('background-image', "url('"+step2.imgUrl+"pd/paima-02.png')");
        	setTimeout(res=>{      
        		$('#step3 .horse-bg .horse-shake').hide()
        		$('#step3 .horse-bg .horse-wait').show()	
	        	$('.pdActived').hide()
	      	},100)
        }
        this.init();
	}

	var step3 = {
		status: false,
		beforeGame: function() {
			var dex = [];
			for(var i=3; i>=0; i--) {
				var img = '<img src="'+step2.imgUrl+'time_count_'+i+'.png" />';
				dex.push(img);
			}
            var x = 0;
            (function(){
                var arg = arguments.callee;
                var html = '<div id="beforeGame" class="start">';
                html += '<span class="tableSpan">'; 
                html += '<tt>'+dex[x]+'</tt>';
                html += '</span></div>';
                $(html).appendTo($('body'));        
                setTimeout(function(){
                    x++;
                    if(x<dex.length){
                        $('#beforeGame').remove();
                        arg();
                        if(x==dex.length-1) {
                        	step3.init();
                           	send.getDate();
                        }
                    }else{
                        $('#beforeGame').removeClass('start').addClass('end');
                        setTimeout(function(){
                            $('#beforeGame').remove();
                        },500)
                    }
                },1000);        
            })();
        },

        // 检测拍打数量
        checkPdNum: function() {
        	var checkTimer = setInterval(function(){
        		if(window.checkNum == 0) {
        			step3.pdTipShow()
        		}else if(window.checkNum < 6) {
        			step3.ylShow()
        		}else if(window.checkNum >= 15){
        			step3.bzShow()
        		}
        		window.checkNum = 0;
        		if(!send.isGame) {
        			clearInterval(checkTimer);
        		}
            },6000)
        },

        // 进度条
        countTime:function(){
            if(localStorage.getItem("gameTime")==undefined||localStorage.getItem("gameTime")==''){
                var _time = 1;
            }else{
                var _time = localStorage.getItem("gameTime")
            }
            var interval = setInterval(function(){
            	var widthPercentage = Math.round(_time/config.gameTime*100);
            	if(widthPercentage >= 100) {
            		widthPercentage = 100;
            	}
            	$('.xui-wrapper .xui-process .xui-process-active').animate({
	                width:widthPercentage+'%'        
	            },1000);
                localStorage.setItem("gameTime",_time)
                _time++;
                if(_time>config.gameTime || !send.isGame){
                    clearInterval(interval);
                    localStorage.removeItem("gameTime")
                }
            },1000);
        },

        setHeight: function() {
        	var h1 = $('#step3 .playTitle').height(),
        		h = $(window).height();
        	$('#step3 .content').css({
        		height: h - h1,
        		top: h1
        	})
        },

        setInfo: function(data) {
        	let horseNum = data.horsenum;
        	$('#step3 .playTitle .tapHorse').attr('src', step2.imgUrl+'ic_horse_success_'+horseNum+'.png');
        	$('#step3 .playTitle span').text(horseNum);
        },

        init: function() {
        	getInfo();
        	$('#step3 .playTitle').fadeIn(function(){
        		step3.countTime();
        		step3.checkPdNum();
        		step3.setHeight();
        	});
        	playByWX();
        },

		pointerXY: function(e) {
			e = e || window.event;
			let h = $('#step3 .playTitle').height();
	      	let l = e.clientX - 105 + 'px',
	        	t = e.clientY - 85 - h + 'px';
	        return {l: l,t: t}
		},

		pdTipShow: function() {
			$('.pdTips').fadeIn(function(){
				setTimeout(res=>{
					$(this).fadeOut();
				}, 1500)
			})
		},

		bzShow: function() {
			this.status = true;
			$('.bzActived').fadeIn(function(){
				if(send.isGame) {
					bzaudio.play();
				}
				setTimeout(res=>{
					$('.bzActived').fadeOut(function(){
						step3.status = false
					});
				}, 1000)	
			})
		},

		ylShow: function() {
			this.status = true;
			$('.ylActived').fadeIn(function(){
				if(send.isGame) {
					ylaudio.play();
				}
				setTimeout(res=>{
					$(this).fadeOut(function(){
						step3.status = false
					});
				}, 1000)
			})
		}

	}

	var step4 = {
		init: function(data) {
			let horseNum = data.horsenum;
			$('#step4 .horse').attr('src', step2.imgUrl+'ic_horse_success_'+horseNum+'.png').show();
		},

		setInfo: function(iswin) {
			getInfo();
			$('#step4 .content img').hide();
			if(iswin) {
				$('#step4').find('.success').show();
			}else{
				$('#step4').find('.loser').show();
			}
		}
	}

	var step5 = {
		init: function() {
			this.getWinnerList()
		},

		getWinnerList: function(){
			let api = config.url + '/cwechat/getBootlikWinList',
				data = {
					barid: config.barid,
					infoid: config.infoid
				}
			ajaxFun(api, data, this.winnerSuccess);
			
		},

		winnerSuccess: function(res) {
			if(res.isResultTrue) {
				let info = res.resultMsg,
					str = '';

				if(info == 'null') {
					str = '<p style="text-align:center;line-height:70px;color:#6c4229;font-size:16px;">暂无获奖信息</p>';
				}else{
					let data = JSON.parse(info);
					let horseNum = data[0]['horseNum'];
					$('#step5 .horse').attr('src', step2.imgUrl+'ic_horse_success_'+horseNum+'.png').show();
		            for(var i in data) {
		            	let tableNum = '';
		                if(data[i].tableNum == undefined || data[i].tableNum === '') {
		                	tableNum = '未输桌号';
		                }else {
		                	tableNum = data[i].tableNum;
		                }
		                str += '<ul class="item-box"><li><img src="'+data[i].userhead+'" /><span>'+data[i].username+'</span></li><li>'+tableNum+'</li><li>'+data[i].winNum+'</li></ul>';
		            }
				}
				$('#step5 .table-content section').html(str);
			}
		}

	}

	var step6 = {
		id: '',
		goBackGame: function() {
			setSteps(0);
		},

		dialogTipShow(id) {
			this.id = id;
			dialog.show($('.dialog-tip'));
		},

		bootlikRedeem() {
			let api = config.url + '/cwechat/bootlikRedeem',
				data = {
					barid: config.barid,
					uid: this.id
				}
			ajaxFun(api, data, this.bootlikRedeemSuccess);
		},

		bootlikRedeemSuccess(res) {
			if(res.isResultTrue) {
				step1.getRecordList();
				dialog.close();

			}
		}
	}

	var getInfo = function() {
		let api = config.url + '/cwechat/userBuyInfo',
			data = {
				barid: config.barid,
				infoid: config.infoid
			}
		ajaxFun(api, data, getInfoSuccess);
	}

	var getInfoSuccess = function(res) {
		if(res.isResultTrue) {
			let msg = JSON.parse(res.resultMsg);
			step = Number(step);
			step2.setInfo(msg);
			step3.setInfo(msg);
			step4.init(msg);
		}
	}

	var setSteps = function(step){
		dialog.close();
    	step = Number(step);
        $('.step, .stopTip').hide();
        switch(step){
            case 0:
            	localStorage.removeItem('iswin');
            	step1.init();
            	$('#step1').css('display', 'block');
	            $('#step1 .logo').addClass('animated infinite fadeInDown');
	            $('#step1 .record').addClass('animated infinite bounceInRight');
	            $('#step1 .waitTip').addClass('animated infinite fadeIn')
	            setTimeout(function(){
	                $('#step1 .record, #step1 .logo, #step1 .waitTip').removeClass('animated infinite bounceInRight fadeInDown fadeIn')
	            },1000)
                break;
            case 1:
                $('#step2').css('display', 'block');
                step2.init();
                // control.countTime();
                break;
            case 2:
            	// send.getDate();
                $('#step3').css('display', 'block');
                step3.beforeGame();
                break;
            case 3:
            	send.stopSend();
             	$('#step4').css('display', 'block');
             	$('#step4 .championTitle, #step4 .content').addClass('animated infinite zoomIn');
	            setTimeout(function(){
	                $('#step4 .championTitle, #step4 .content').removeClass('animated infinite zoomIn')
	            },1000)
	            if(localStorage.getItem('iswin') != undefined) {
	            	let iswin = localStorage.getItem('iswin');
	            	step4.setInfo(iswin);
	            }
	            
            	break;
            case 4:
           	 	$('#step5').css('display', 'block');
             	$('#step5 .championTitle').addClass('animated infinite zoomIn');
             	$('#step5 .table-box, #step5 .bwrap').addClass('animated infinite fadeIn');
	            setTimeout(function(){
	                $('#step5 .championTitle, #step5 .table-box, #step5 .bwrap').removeClass('animated infinite zoomIn fadeIn')
	            },1000)
	            step5.init();
            	break;
            case 5:
            	$('#step6').css('display', 'block');
            	$('#step6 .table-box, #step6 .bwrap').addClass('animated infinite fadeIn');
	            setTimeout(function(){
	                $('#step6 .table-box, #step6 .bwrap').removeClass('animated infinite fadeIn')
	            },1000)
            	break;
            case 6:
            	$('.stopTip').show();
            	break;
            default:
                break;
        }
    }

     // 微信js播放音频
    var playByWX = function() {
      	try{
	        wx.config({ // 配置信息, 即使不正确也能使用 wx.ready
	          	debug: false,
	          	appId: '',
	          	timestamp: 1,
	          	nonceStr: '',
	          	signature: '',
	          	jsApiList: []
	        });
	        wx.ready(function() {
	          	bzaudio.play()
	          	ylaudio.play()
	          	bzaudio.pause()
	          	ylaudio.pause()
	        });
      	}catch(e){}
    }

	//socket
    var initSocket = function(url,fn){
        var time = null;
        window.socket = new WebSocket(url);
        socket.onopen = function(){
        	socket.send("info<>${barid}<>${userid}");
            fn&&fn();
        };
        socket.onmessage = function(t){
        	var t = JSON.parse(t.data);
        	config.infoid = t.infoid;
        	if(t.state == 0) {
        		window.location.reload();
        	}else {
        		setSteps(t.state);
        		if(t.state == 3){
        			localStorage.setItem('iswin', t.iswin);
        			step4.setInfo(t.iswin);
        		}	
        	}
        };
        socket.onerror = function(e){
        	console.log(e)
        };
        socket.onclose = function(){
            try{clearTimeout(timeout);}catch(ex){}
            timeout = setTimeout(function(){
                initSocket(url,fn);
            },1000);
        }
    }

    var send = {
        isGame:true,
        isSend:null,
		getDate: function() {
			send.isSend = setTimeout(function() {
				send.sendAjax(window.num);
				if (send.isGame)
					send.isSend = setTimeout(arguments.callee, 2000);
			}, 2000);
		},
        stopSend:function(){
            send.isGame = false;
            clearTimeout(send.isSend);
        },

        sendAjax:function(x){
            window.num=0;
            socket.send("integral<>${barid}<>${userid}<>"+x)
        }
    }

    $(function(){
		setSteps(step);
		initSocket("ws://game2.wemew.com:8085/websocket/bootlick/${barid}/${userid}");
		// initSocket("ws://192.168.11.111:8081/websocket/bootlick/${barid}/${userid}"); 
		window.onunload = function(){
	        socket.close();
	    }
	    var tap = new Tap();
	})

	window.onresize = function() {
		step3.setHeight();
	}

</script>
</body>
</html>