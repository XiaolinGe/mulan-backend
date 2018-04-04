[#include "/payment/material/common.ftl"]
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Successful</title>
[@head]


    <link rel="stylesheet/less" type="text/css" href="/less/material/payment-success">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>
[/@head]
</head>
<body>
[#include "/payment/material/logo.ftl"]

<main>
    <div class="container form-container">
        <form id="submitForm" class="form_s gray" action="show.action" method="post">
            <div class="form-hidden">
                <input type="hidden" name="mid" value="M00000012">
                <input type="hidden" name="key" value="1234567">
                <input type="hidden" name="url" value="https://merchant.myrapidpay.com/trade/success.action">
                <input type="hidden" name="backUrl" value="">
                <input type="hidden" name="curr" value="NZD">
                <input type="hidden" name="oid" value="build">
                <input type="hidden" name="shipto" value="New Zealand Bloodstock">
                <input type="hidden" id="cust" name="cust" value="">
                <input type="hidden" id="pageType" name="pageType" value="universal">

            </div>

            <div class="container-fluid details-container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-container fields-container">
                        <div class="container-fluid merchant-container">
                            <div class="row">
                                <h4 class="details-title merchant-title">Payment successful!</h4>
                                <div class="col-md-12 col-sm-12 col-container">

                                    <ul class="payment-success-info">
                                        <li><span>Thank you for your payment of {1} that was processed on <b>{2} NZT</b> .[orderAmount,cnyAmount,finishTime]</span></li>
                                        <li><span>The order number for this payment is {0}.[orderNumber]</span></li>
                                        <li><span>A copy of this receipt has been emailed to you for your records.</span></li>
                                        <li><span>You may now close this browser window or click the Finish below.</span></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="container-fluid button-container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-container ">
                                    <div class="buttons">
                                        <a class="btn btn-raised btn-default new-payment-button" href="http://nzb.co.nz" >FINISH</a>
                                        [#--<a class="btn btn-raised btn-default finish-button" href="payment.action?token=${token}">[@spring.message "trade.payment.succ.new"/]</a>--]
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



        </form>
    </div>
</main>
<script>
    $.material.init();
</script>
</body>
</html>
