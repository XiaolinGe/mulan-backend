[#include "/payment/material/common.ftl"]
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order processed</title>
[@head]

    <link rel="stylesheet/less" type="text/css" href="/less/material/pay-success">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>
[/@head]
</head>
<body>
[#include "/payment/material/logo.ftl"]

<main>
    <div class="container form-container">
        <form id="submitForm" class="form_s gray" action="show.action" method="post">

            <div class="container-fluid details-container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-container fields-container">
                        <div class="container-fluid merchant-container">
                            <div class="row">
                                <h4 class="details-title merchant-title">Your order has been processed</h4>
                                <div class="col-md-12 col-sm-12 col-container">

                                    <p class="details-text">
                                    [#if oidError?exists]
                                    ${oidError}
                                    [#else]
                                        <label>Correctly processed
                                        </label>
                                        [#if currentLanguage=="zh"]
                                            &nbsp;${chtime}
                                        [#else ]
                                            &nbsp;${time}
                                        [/#if]
                                    [/#if]
                                    </p>

                                    <p class="details-text"><label>order number</label>&nbsp; ${laipayPaymentCallBack.merchant_reference}</p>
                                    <p class="details-text"><label>payment method</label>&nbsp; ${laipayPaymentCallBack.payment_method} </p>
                                    <p class="details-text"><label>currency</label>&nbsp; ${laipayPaymentCallBack.currency}</p>
                                    <p class="details-text"><label>status</label>&nbsp; ${laipayPaymentCallBack.status}</p>


                                </div>

                            </div>
                        </div>
                    </div>
                [#if currentLanguage == language_en.lang]
                    [#include "/payment/material/help_en.ftl"]
                [#else]
                    [#include "/payment/amterial/help_zh.ftl"]
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
