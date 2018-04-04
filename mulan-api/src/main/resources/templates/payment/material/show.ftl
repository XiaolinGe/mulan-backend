[#include "/payment/material/common.ftl"]

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Show</title>
[@head]
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css"
          rel="stylesheet" type="text/css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>

    [#--<link href="/css/common/mrp_fonts/style.css" rel="stylesheet" type="text/css"/>--]

[#--TODO: convert to less then to ftl ? --]
    <link rel="stylesheet" href="/css/payment/bankingLimits.css">
    <link href="/css/payment/popupWindow.css" rel="stylesheet">

    <link rel="stylesheet/less" type="text/css" href="/less/material/show">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>

[/@head]
</head>
<body>
[#include "/payment/material/logo.ftl"]

<main>
    <div class="container show-container">
        <form id="form1" class="form_s gray" action="/trade/payProxy" method="post" target="_blank">
            <input type="hidden" name="target" value="_blank">
            <div class="tip" id="fail_tip" style="display: none">
                The payment has been processed unsuccessfully. The reasons might be as below:</br>(1) The payment amount
                exceeds your online banking transaction limit or account balance, please login to your online banking to
                ensure both your transaction limit and the balance is sufficient for the payment amount.</br>(2) Some
                bank systems have compatibility problems with your browser, please use IE browser to make the
                payment.</br>(3) In case “Webpage expired, overtime or error” is prompted at the online banking webpage,
                please restart your browser to make the payment again.<br/>
                <a href="javascript:" class='icon-close red'></a>
            </div>
            <div class="form-hidden">
                <input type="hidden" name="idCardName" value="${order.idCardName}">
                <input type="hidden" name="idCard" value="${order.idCard}">
                <input type="hidden" name="telNo" value="${telNo}">
                <input type="hidden" name="telNum" value="${telNum}">
                <input type="hidden" name="email" value="${receiveParam.email}">
                <input type="hidden" name="reference" value="${reference}">
                <input type="hidden" name="token" value="${token}">
                <input type="hidden" name="beneficiaryId" value="${beneficiaryId}">


            </div>
            <div class="container-fluid step-container">
                <div class="row ">
                    <div class="col-md-6 col-sm-6 step-line">
                        <div class="active-line first-active-line"></div>
                        <div class="is-complete step-indicator__step">
                            <h4 class="step-indicator__title">payment</h4>
                            <div class="circle circle-first">
                                <span class="fa fa-check"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 step-line">
                        <div class="active-line second-active-line"></div>
                        <div class="is-active step-indicator__step">
                            <h4 class="step-indicator__title">summary</h4>
                            <div class="circle circle-second">2</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid details-container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-container fields-container">
                        <div class="container-fluid order-container">
                            <div class="row">
                                <h4 class="details-title order-title">orderDetails</h4>
                                <div class="col-md-12 col-sm-12 col-container">
                                    <p class="details-text"><label>merchant</label>
                                        businessName </p>
                                    <p class="details-text"><label>OrderNumber</label>
                                        OD0000000132
                                    </p>
                                [#if merchantGateway.isCurrency==1]
                                    <p class="details-text"><label>rate</label> &nbsp; ${order.currencyReceive} 1000.00
                                        &asymp; ${order.currencyPay} <span id="payFee100">${payFee100}</span></p>
                                [/#if]
                                    <p class="details-text"><label>currency</label>&nbsp; NZD</p>
                                    <p class="details-text"><label>amount</label>&nbsp; <span class="dark"><b
                                            id="money">1200.00</b></span></p>
                                </div>

                            </div>
                        </div>
                        <div class="container-fluid your-container">
                            <div class="row">
                                <h4 class="details-title payment-title">yourDetails</h4>
                                <div class="col-md-12 col-sm-12 col-container">
                                    <p class="details-text">
                                        <label>nationalIDName</label>&nbsp; xxx
                                    </p>
                                    <p class="details-text">
                                        <label>nationalIDNumber</label>&nbsp; 4104021222333344455
                                    </p>

                                    <p class="details-text"><label>mobile</label>&nbsp;
                                        +64 0212222222
                                    </p>
                                    <p class="details-text"><label>emailAddress</label>&nbsp;info@gmail.com</p>
                                    <p class="details-text"><label>reference</label>&nbsp; this is xxx </p>


                                </div>

                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-container">
                                            <p class="red">
                                                *The information we collect is to verify your account and will not be
                                                used for marketing purposes.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid bank-container">
                            <div class="row">
                                <h4 class="details-title">selectYourBank</h4>
                                <p class="red">
                                    To ensure there are no issues with your payment, please enable the ability to
                                    perform online payments via your bank account and ensure your online payment limit
                                    is high enough to accommodate your payment.</p>
                                <div class="col-md-12 col-sm-12 col-container">

                                    <ul class="cf bank_list  nav nav-pills" id="bank_list">
                                    [#list bankList as bank]
                                        <li role="presentation">
                                            <a href="#table_${bank.forshort}" data-toggle="tab">
                                                <label for="${bank.forshort}" class="bank_logo ${bank.iconName}
[#if !bank.available]gray-out[/#if]" data-toggle="tooltip" data-placement="top" title="maxLimit ${bank.maxLimit}">
                                                    <input type="radio" name="bankCode" id="${bank.forshort}"
                                                           value="${bank.code}"><i></i>
                                                </label>
                                            </a>
                                        </li>
                                    [/#list]
                                    </ul>

                                </div>

                            </div>
                        </div>


                        <div class="container-fluid button-container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-container ">
                                    <div class="buttons">
                                        <a class="btn btn-raised btn-default cancel-button"
                                           href="javascript:history.go(-1)">cancel</a>
                                        <button class="btn btn-raised btn-default pay-now-button  pay_now_btn"
                                                type="submit" id="pay_now" data-toggle="modal" data-backdrop="static"
                                                data-keyboard="false">payNow
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                [#if currentLanguage == language_en.lang]
                    [#include "/payment/material/help_en.ftl"]
                [#else]
                    [#include "/payment/material/help_zh.ftl"]
                [/#if]
                </div>
            </div>
            <input id="mid" type="hidden" name="mid" value="${receiveParam.mid}">
            <input type="hidden" name="key" value="${receiveParam.key}">
            <input type="hidden" name="url" value="${receiveParam.url}">
            <input type="hidden" name="backUrl" value="${receiveParam.backUrl}">
            <input type="hidden" name="shipto" value="${receiveParam.shipto}">
            <input type="hidden" name="cust" value="${receiveParam.cust}">
            <input type="hidden" name="curr" value="${receiveParam.curr}">
            <input type="hidden" name="amount" value="${receiveParam.amount}">
            <input type="hidden" name="ymd" value="${receiveParam.ymd}">
            <input type="hidden" name="md5info" value="${receiveParam.md5info}">
            <input id="rateId" type="hidden" name="rate" value="${order.rate}">
            <input id="orderNo" type="hidden" name="oid" value="${receiveParam.oid}">
            <input type="hidden" name="version" value="${receiveParam.version}">
            <input id="tel" type="hidden" name="tel" value="${receiveParam.tel}">
        </form>
    </div>
</main>


[#include "/payment/material/transferJs.ftl"]
[#include "/payment/material/bankValidation.ftl"]
<script>
    $.material.init();
</script>
<script>
    seajs.use(["alert", "validation"], function (alertM) {
        var $f = $("#form1").validationEngine().on("submit", function () {
            if ($.trim($("#phone").val()) != "") {
                $("#tel").val($("#phone_c").val() + " " + $("#phone").val());
            } else {
                $("#tel").val("");
            }
            if (!$bl.find(".checked").length) {
                $bank_err.show();
                return false;
            } else {
                var select_bank_name = $bl.find(".checked").find("input").attr("id");

                var select_bank_data = bank_amount_list.filter(function (e) {
                    return e.bank === select_bank_name;
                });

                var select_bank_amount = select_bank_data[0].amount;

                var order_money = 0;
                if ($("#money").length) {
                    var string_order_money = $("#money").text();
                    order_money = parseFloat(string_order_money.replace(',', ''));
                }

                if (bankLimits(select_bank_amount, order_money)) {
                    var selectedAmount = convertToDecimal(select_bank_amount, 2);
                    bankLimitsDialog(selectedAmount);

                    return false;
                } else {
                    alertM("[@spring.message "trade.pay.tips.content"/]", {
                        title: "[@spring.message "trade.pay.tips.title"/]",
                        time: "y",
                        btns: [{
                            txt: "[@spring.message "trade.pay.tips.succ"/]",
                            func: function () {
                                payOk(0);
                                return false;
                            }
                        }, {
                            txt: "[@spring.message "trade.pay.tips.error"/]",
                            func: function () {
                                payOk(0);
                                return false;
                            }
                        }],
                        of: function () {
                            setInterval(function () {
                                payOk(1);
                            }, 60000);
                        },
                        cf: function () {
                            payOk(0);
                            return false;
                        }
                    });
                }
            }
        });
        $phone = $("#phone"),
                $phone_c = $("#phone_c").on("change", function () {
                    $phone.attr("data-v", "validate[custom[phone" + (this.value == "+64" ? "NZD" : "CNY") + "]]").validationEngine('validate')
                }),
                $phone_c.trigger("change");
        $table = $(".table"),
                $bank_err = $("#bank_err"),
                $bl = $("#bank_list").on("click", "label", function () {
                    $table.hide()
                    $bl.find(".checked").removeClass("checked");
                    $(this).addClass("checked");
                    $bank_err.hide()
                    $("#table_" + $(this).addClass("checked").attr("for")).show();
                }),
                payOk = function (isAuto) {
                    if (!isAuto) {
                        alertM("[@spring.message "trade.pay.tips.result"/]", {cls: "loading"})
                    }
                    $.ajax({
                        url: "checkorderstate",
                        type: "post",
                        dataType: 'json',
                        data: {
                            orderId: $("#orderNo").val(),
                            mid: $("#mid").val()
                        }
                    }).done(function (data) {
                        var orderNo = $("#orderNo").val();
                        if (data.status == "error") {
                            $("#fail_tip").show();
                            $('html,body').animate({
                                scrollTop: 0
                            })
                        } else {
                            if (data.payStatus == "101") {//交易成功
                                alertM(data.msg, {
                                    cls: data.status, rf: function () {
                                        setTimeout(function () {
                                            window.location.href = "/trade/paySuccess?oid=" + orderNo;//成功页面
                                        }, 9)
                                    }
                                })
                            }
                            if (!isAuto && data.payStatus != "101") {
                                $("#fail_tip").show();
                                $('html,body').animate({
                                    scrollTop: 0
                                })
                            }
                        }
                    }).fail(function () {
                        alertM("[@spring.message "trade.pay.tips.internetError"/]", {
                            cls: "error"
                        })
                    });
                    return false;
                }

        $(".icon-close").on("click", function () {
            $(this).parent().hide()
        })
        window.setInterval(function () {
            $.ajax({
                url: "refresh",
                dataType: "json",
                type: "post",
                data: $("#form1").serialize()
            }).done(function (data) {
                if (data.status == "succ") {
                    $("#money").html(data.wholeAmount);
                    $("#payFee100").html(data.payFee100);
                    $("#rateId").val(data.rate);
                } else {
                    alertM(data.msg, {cls: data.status, time: 1000});
                }
            });
        }, 300000);
    })
</script>

<script>
    $(document).ready(function () {
        $("#bank_list").on("click", "a", function () {
            $("#bank_list").find('input').prop('checked', false);
            $(this).find('input').prop('checked', true);
        });
        $('[rel=tooltip]').tooltip({container: 'body'});
        $('[data-toggle="tooltip"]').tooltip({
            trigger: 'hover'
        })
    });
</script>
</body>
</html>
