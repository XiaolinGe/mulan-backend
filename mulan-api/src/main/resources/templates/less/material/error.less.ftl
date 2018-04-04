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

/*============ form ============*/
.form-container {
  width: 100%;
  margin: 0 auto;
  margin-bottom: 50px;
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

/*============ stepper ============*/
.details-container {
  margin-top: 20px;
  position: relative; }

.details-title {
  color: @minor-color-one;
  font-size: 26px;
  font-weight: 400;
  border-bottom: 1px solid @minor-color-one;
  padding-bottom: 10px;
  margin-top: 40px;
  font-family: Arial, sans-serif; }

.merchant-title {
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

.circle-second {
  background-color: @theme-color-three;
  color: @theme-color-one; }

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

.first-active-line {
  padding: 0;
  margin: 0;
  width: 50%;
  height: 2px;
  background: @theme-color-one;
  position: absolute;
  top: -2px; }

.merchant {
  text-align: center;
  color: @minor-color-one;
  font-size: 28px;
  font-weight: 400; }

.col-container {
  padding: 0; }

.mobile-container {
  padding-left: 15px; }

/*======== button ===========*/
.button-container {
  margin-top: 40px; }
  .button-container .buttons {
    text-align: right; }

.back-button {
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

.transfer-button {
  color: @theme-color-one !important;
  border: 1px solid @theme-color-one;
  border-radius: 4px;
  box-shadow: 0 0 0 !important;
  background-color: @btn-bg-color;
  margin-left: 50px;
}

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

/*======== label and input ===========*/
.form-group.is-focused .form-control .material-input:after {
  background-color: @minor-color-two; }

.form-group.is-focused label,
.form-group.is-focused label.control-label {
  color: @minor-color-two; }

.form-group.is-focused.label-placeholder label,
.form-group.is-focused.label-placeholder label.control-label {
  color: @minor-color-two; }

.form-group.is-focused .form-control {
  outline: none;
  background-image: -webkit-gradient(linear, left top, left bottom, from(@minor-color-two), to(@minor-color-two)), -webkit-gradient(linear, left top, left bottom, from(#D2D2D2), to(#D2D2D2));
  background-image: -webkit-linear-gradient(@minor-color-two, @minor-color-two), -webkit-linear-gradient(#D2D2D2, #D2D2D2);
  background-image: -o-linear-gradient(@minor-color-two, @minor-color-two), -o-linear-gradient(#D2D2D2, #D2D2D2);
  background-image: linear-gradient(@minor-color-two, @minor-color-two), linear-gradient(#D2D2D2, #D2D2D2);
  -webkit-background-size: 100% 2px, 100% 1px;
  background-size: 100% 2px, 100% 1px;
  -webkit-box-shadow: none;
  box-shadow: none;
  -webkit-transition-duration: 0.3s;
  -o-transition-duration: 0.3s;
  transition-duration: 0.3s; }

.control-label span {
  color: @warning-color;
  font-size: 12px; }

.help-block {
  color: @warning-color; }

/*======== mobile label ===========*/
.mobile-label {
  margin-left: 0 !important; }

.is-empty .mobile-label {
  margin-left: 3% !important; }

.is-focused .mobile-label {
  margin-left: 0 !important; }

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

.country-code {
  position: absolute;
  left: 24%;
  bottom: 49%;
  border: 5px solid red;
  height: 5px;
  width: 5px;
  border-color: @text-color-two transparent transparent !important;
  z-index: -10;
  cursor: pointer; }

/*# sourceMappingURL=error.css.map */
