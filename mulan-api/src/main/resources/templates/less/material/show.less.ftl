@theme-color-one: ${theme.themeColorOne}; //#857650;
@theme-color-two: ${theme.themeColorTwo}; //#b6ad96;
@theme-color-three: ${theme.themeColorThree}; //#e7e4dc;
@minor-color-one: ${theme.minorColorOne}; //#335378;
@minor-color-two: ${theme.minorColorTwo}; //#667e9a;
@minor-color-three: ${theme.minorColorThree}; //#1a2a3c;
@bg-color: ${theme.bgColor}; //#ffffff;
@btn-bg-color: ${theme.btnBgColor}; //#EEEEEE;
@text-color-one: ${theme.textColorOne}; //#4d4d4d;
@text-color-two: ${theme.textColorTwo}; //gray;
@warning-color: ${theme.warningColor}; //#de3226;

@theme-black: #000000;
@theme-white: #ffffff;

@title-size: ${theme.titleSize}; //1.3em;
@text-size: ${theme.textSize}; //1.1em;
@input-height: ${theme.inputHeight}; //2.1em;
@border-radius: ${theme.borderRadius}; //4px;


/* ========================================== */

body {
  background-color: @bg-color;
  font-family: Arial, sans-serif; }

.clear {
  clear: both; }

/*============ header ============*/
.header-container {
  width: 100%;
  height: 40px;
  background-color: @bg-color;
  margin-bottom: 10px;
  padding-top: 10px; }

.header-content {
  width: 80%;
  margin: 0 auto;
  color: #e6eaee; }
  .header-content .logo-container {
    float: left; }
  .header-content .lan-container {
    float: right; }
  .header-content a, .header-content span {
    font-size: 14px;
    text-decoration: none;
    color: @minor-color-two; }
    .header-content a:hover, .header-content span:hover {
      color: @minor-color-one; }

.ic_cn {
  display: inline-block;
  width: 16px;
  height: 11px;
  vertical-align: middle;
  overflow: hidden;
  background: url(./cn.png); }

/*============ show ============*/
.show-container {
  width: 100%;
  margin: 0 auto;
  margin-bottom: 50px !important;
  padding: 20px 30px; }

main {
  border-radius: 3px 3px 0 0;
  margin: 0 auto;
  max-width: 80%;
  display: block;
  position: relative;
  background: @bg-color;
  z-index: 3;
  box-sizing: content-box; }

main:after, main:before {
  content: "";
  position: absolute; }

main:before {
  border-radius: 3px 3px 0 0;
  z-index: -2;
  left: 0;
  right: 0;
  bottom: 40px;
  top: 0;
  box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.2); }

main:after {
  z-index: -1;
  bottom: 0;
  left: -5px;
  right: -5px;
  height: 95%;
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0, @bg-color 60%); }

.details-text {
  color: @text-color-two;
  font-size: 14px;
}
  .details-text label {
    color: @text-color-one;
    font-size: 14px;
  }

.title-container {
  margin-bottom: 30px; }

[class^="icon-"], [class*=" icon-"] {
  font-family: 'icomoon' !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  font-size: 1.6em;
  position: relative;
  top: .1em;
  vertical-align: text-bottom;
  color: inherit;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.icon-close:before {
  content: "\e5cd";
}
/*============ stepper ============*/
.step-container {
  margin-top: 44px;
  position: relative; }

.details-title {
  color: @minor-color-one;
  font-size: 26px;
  font-weight: 400;
  border-bottom: 1px solid @minor-color-one;
  padding-bottom: 10px;
  margin-top: 40px;
  font-family: Arial, sans-serif; }

.order-title {
  margin-top: 0; }

.circle {
  border-radius: 50%;
  display: inline-block;
  background-color: @theme-color-one;
  color: @bg-color;
  height: 20px;
  width: 20px;
  line-height: 20px;
  text-align: center;
  z-index: 10; }

.circle-first span {
  font-size: 11px;
  line-height: 18px;
  margin-left: -1px; }

.step-indicator {
  border-radius: 10px;
  margin: 25px 0;
  text-align: justify;
  width: 100%;
  padding: 0;
  background: @theme-color-three;
  height: 2px;
  position: relative;
  counter-reset: my-badass-counter; }

.is-active .step-indicator__title {
  color: @minor-color-one; }

.step-indicator__step {
  position: relative;
  text-align: center;
  top: -44px;
  font-size: 13px;
  min-width: 68px; }

.is-active .step-indicator__title {
  color: @minor-color-one; }

.step-indicator__title {
  color: @theme-color-two;
  font-size: 15px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: .09375em;
  line-height: 1;
  margin-bottom: 7px; }

.step-line {
  border-top: 2px solid @theme-color-three;
  padding: 0;
  margin: 0;
  height: 50px; }

.active-line {
  padding: 0;
  margin: 0;
  width: 50%;
  height: 2px;
  background: @theme-color-one;
  position: absolute;
  top: -2px; }

.first-active-line {
  width: 100%; }

.second-active-line {
  width: 100%; }

/*========  ============*/
.merchant {
  text-align: center;
  color: @minor-color-one;
  font-size: 28px;
  font-weight: 400; }

.col-container {
  padding: 0; }

.mobile-container {
  padding-left: 15px; }

.red {
  color: @warning-color; }

/*======== button ===========*/
.button-container {
  margin-top: 40px; }
  .button-container .buttons {
    text-align: right; }

.pay-now-button {
  color: @minor-color-one !important;
  border: 1px solid @minor-color-one;
  border-radius: 4px;
  box-shadow: 0 0 0 !important;
  margin-left: 50px; }

.cancel-button {
  color: @theme-color-one !important;
  border: 1px solid @theme-color-one;
  border-radius: 4px;
  box-shadow: 0 0 0 !important; }

/*======== footer ===========*/
.footer-container {
  width: 100%;
  height: 100px;
  padding-top: 20px;
  background-color: @minor-color-one; }

.footer-content {
  width: 80% !important;
  margin: 0 auto;
  color: #e6eaee; }
  .footer-content .col-container {
    text-align: center;
    font-weight: 400; }
    .footer-content .col-container img {
      margin-bottom: 5px; }
    .footer-content .col-container p {
      font-size: 13px;
      margin: 0;
      line-height: 21px; }
    .footer-content .col-container a, .footer-content .col-container span {
      font-size: 10px;
      line-height: 21px;
      text-decoration: none;
      color: #ccd4dd; }
      .footer-content .col-container a:hover, .footer-content .col-container span:hover {
        color: @bg-color; }

/*======== bank table===========*/
.tab-content {
  margin-top: 20px; }

.table {
  width: 100%;
  border: 1px solid @minor-color-one;
  display: table;
  border-collapse: collapse !important;
  overflow: auto;
  border-spacing: 0;
  margin: 9px 0;
  border-radius: 6px;
  empty-cells: show;
  color: @text-color-one; }
  .table tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit; }
  .table tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit; }
  .table th {
    padding: 4px 8px;
    background: @minor-color-one;
    color: @bg-color;
    word-break: break-all;
    text-align: left;
    display: table-cell;
    vertical-align: inherit; }
  .table td {
    border: 1px solid @minor-color-one !important;
    padding: 4px 8px;
    word-break: break-all;
    text-align: left;
    display: table-cell;
    vertical-align: inherit; }

.tab-content > .active {
  display: table; }

/*======== bank logo ===========*/
.bank_logo {
  display: inline-block !important;
  padding: 0 !important;
  position: relative;
  width: 124px;
  height: 35px;
  border: 1px #999 solid;
  background: @bg-color url(/images/common/bank/bank_logos.png) no-repeat;
  margin: 0;
  cursor: pointer;
  opacity: .5;
  filter: alpha(opacity=50);
  overflow: hidden; }

.bank_logo input {
  position: absolute;
  left: -99px; }

.bank-container a {
  padding-left: 0 !important; }
.bank-container a:hover {
  background-color: transparent !important; }
  .bank-container a:hover .bank_logo {
    box-shadow: 3px 3px 6px 2px rgba(0, 0, 0, 0.4);
    opacity: 1; }
.bank-container .nav-pills > li.active > a {
  background-color: transparent !important; }
  .bank-container .nav-pills > li.active > a .bank_logo {
    box-shadow: 3px 3px 6px 2px rgba(0, 0, 0, 0.4);
    opacity: 1; }

.bank01 {
  background-position: 50% -360px; }

.bank02 {
  background-position: 50% -132px; }

.bank03 {
  background-position: 50% -33px; }

.bank04 {
  background-position: 50% -460px; }

.bank05 {
  background-position: 50% -295px; }

.bank06 {
  background-position: 50% -393px; }

.bank07 {
  background-position: 50% -66px; }

.bank08 {
  background-position: 50% -328px; }

.bank09 {
  background-position: 50% -493px; }

.bank10 {
  background-position: 50% -198px; }

.bank11 {
  background-position: 50% -1040px; }

.bank12 {
  background-position: 50% -165px; }

.bank13 {
  background-position: 50% -425px; }

.bank14 {
  background-position: 50% -264px; }

.bank15{
  background-position: 50% -1178px;
}

.bank17 {
  background-position: 50% -231px; }

.bank18 {
  background-position: 50% -564px; }

.bank19 {
  background-position: 50% -525px; }


/*====== new banks =========*/

.bank20 {
  background-position: 50% -1288px;
}

.bank21 {
  background-position: 50% -1326px;
}

.bank22 {
  background-position: 50% -1359px;
}

.bank23 {
  background-position: 50% -1394px;
}

.bank24 {
  background-position: 50% -1430px;
}

.bank25 {
  background-position: 50% -1465px;
}

.bank26 {
  background-position: 50% -1496px;
}

.bank27 {
  background-position: 50% -1531px;
}

.bank28 {
  background-position: 50% -1564px;
}

.bank29 {
  background-position: 50%  -1598px;
}

.bank30 {
  background-position: 50% -1630px;
}

.bank31 {
  background-position: 50% -1663px;
}

.bank16 {
  background-position: 50% -1695px;
}


/*======== logo ===========*/
/*
@media screen and (max-width: 781px) {
   svg {
    width: 200px;
    height: 90px;
  }
}
*/
svg {
  width: 170px;
  height: 90px;
  max-width: 100%; }

/*======== help ===========*/
.help-info {
  width: 75%;
  float: right; }
  .help-info .help-title {
    padding: 0 0 7px;
    border-bottom: 1px solid @theme-color-three;
    font-weight: 400;
    font-family: Times New Roman, serif;
    color: @minor-color-three;
    font-size: 17px;
    line-height: 20px;
    text-transform: uppercase;
    letter-spacing: 1px; }
  .help-info .help-text {
    font-size: 14px;
    color: @text-color-one;
    font-family: Arial, sans-serif;
    margin-bottom: 25px; }
    .help-info .help-text a {
      color: @minor-color-one;
      outline: 0;
      transition: all .1s ease-in-out;
      text-decoration: underline; }
      .help-info .help-text a:hover {
        color: @theme-color-two; }

.rule-line {
  color: #f2f4f7;
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom-width: 1px;
  border-bottom-style: solid;
  margin-bottom: 25px; }

/*# sourceMappingURL=show.css.map */

/*=====  reasons list ======*/
.tip {
  position: relative;
  padding: 4px 32px 4px 9px;
  margin: 0 0 9px 0;
  background: #E9D8DA;
  border: 1px solid @warning-color;
  color: @warning-color;
  border-radius: 2px;
  line-height: 24px;
  min-height: 24px;
  -ms-box-sizing: border-box;
  box-sizing: border-box;
}

.tip .icon-close {
  position: absolute;
  right: 0;
  top: 0;
}
.red {
  color: @warning-color;
}
.icon-close:before {
  content: "\e5cd";
}

.tip a {
  text-decoration: none;
}

.tip a:hover {
  color: #f60;
}

/*=====  popup window ======*/
#alertM {
  line-height: 24px;
  display: block;
  position: absolute;
  margin: 0 0 99px 0;
  background: @bg-color;
  box-shadow: 0 9px 64px rgba(0,0,0,.4);
  border-radius: 2px;
  z-index: 889;
  transition: all .2s ease-out;
  will-change: left,top;
}

#alertT {
  display: block;
  position: relative;
  height: 54px;
  line-height: 54px;
  padding: 0 20px;
  margin: 0;
  font-size: 18px;
  overflow: hidden;
  text-transform: none;
  border-radius: 2px;
}

#alertR {
  display: block;
  position: absolute;
  top: 9px;
  right: 9px;
  width: 36px;
  height: 36px;
  line-height: 36px;
  font-size: 32px;
  text-align: center;
  color: #7f7f7f;
  overflow: hidden;
  transition: transform .2s ease-out;
}

div#alertP {
  padding: 0 20px 20px 20px;
}

#alertP {
  transition: all .2s ease-out;
  will-change: width,height;
}

#alertM #alertBtns {
  position: static;
}

#alertBtns {
  text-align: right;
  background: #f0f0f0;
  padding: 9px 0;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
}

#alertBtns .btn {
  margin: 0 20px 0 0;
}

.btn, .gray_btn  {
  display: inline-block;
  height: 40px;
  line-height: 40px;
  padding: 0 20px;
  border: 1px solid #90999c;
  background: @bg-color;
  color: #5c6466;
  cursor: pointer;
}

#alertR:hover {
  cursor: pointer;
  text-decoration: none;
  transform: rotate(360deg);
}

/*===== new popup =====*/
#hbg {
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background: #000;
  z-index: 888;
  opacity: 0;
  will-change: opacity;
}
#alertM {
  line-height: 24px;
  display: block;
  position: absolute;
  margin: 0 0 99px 0;
  background: @bg-color;
  box-shadow: 0 9px 64px rgba(0,0,0,.4);
  border-radius: 2px;
  z-index: 889;
  transition: all .2s ease-out;
  will-change: left,top;
}
#alertM iframe:last-child{
  border-radius: 2px;
}
#alertP{
  transition: all .2s ease-out;
  will-change: width,height;
}
div#alertP {
  padding:0 20px 20px 20px;
}
iframe#alertP{
  display: block;
  max-height: 800px;
  border:0;
}
#alertP .form{
  margin: 0;
}
#alertP .form_p{
  margin: 0 0 6px 160px;
}
#alertP .f_info{
  width: 140px;
  margin: 0 0 0 -160px;
}
#alertBtns {
  text-align: right;
  background: #f0f0f0;
  padding: 9px 0;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
}
#alertM #alertBtns {
  position: static;
}
#alertBtns .btn {
  margin:0 20px 0 0;
}
#alertT {
  display: block;
  position: relative;
  height: 54px;
  line-height: 54px;
  padding: 0 20px;
  margin: 0;
  font-size: 18px;
  overflow: hidden;
  text-transform: none;
  border-radius: 2px;
}
#alertR {
  display: block;
  position: absolute;
  top: 9px;
  right: 9px;
  width: 36px;
  height: 36px;
  line-height: 36px;
  font-size: 32px;
  text-align: center;
  color: #7f7f7f;
  overflow: hidden;
  transition: transform .2s ease-out;
}
#alertR:hover {
  cursor: pointer;
  text-decoration: none;
  transform: rotate(360deg);
}
#alertM.info{
  background: #000;
  background: rgba(0,0,0,.8);
}
.info #alertT,.info #alertBtns{
  display:none
}
.info #alertP {
  min-width: 160px;
  line-height: 24px;
  text-align: center;
  padding: 56px 20px 20px 20px;
  white-space: nowrap;
  color: @bg-color;
  font-size: 14px;
  background: url(/images/common/mod/loading.gif) no-repeat 50% 24px;
}
.succ #alertP {
  background-image: url(/images/common/mod/succ.png)
}
.alert #alertP {
  background-image: url(/images/common/mod/alert.png)
}
.error #alertP {
  background-image: url(/images/common/mod/error.png)
}

.alert_btn_0 {
  color: @theme-color-one !important;
  border: 1px solid @theme-color-one;
  border-radius: 4px;
  box-shadow: 0 0 0 !important;
}

.alert_btn_1 {
  color: @minor-color-one !important;
  border: 1px solid @minor-color-one;
  border-radius: 4px;
  box-shadow: 0 0 0 !important;
  margin-left: 50px;
}

.btn-margin {
  margin-top: 10px !important;
}

.gray-out {
  opacity: 0.2;
 <#-- filter: alpha(opacity = 20);-->
}