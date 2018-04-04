[#include "/payment/material/common.ftl"]<!DOCTYPE html>
<html lang="en">
<head>
    <title>Error</title>
[@head]

    <link rel="stylesheet/less" type="text/css" href="/less/material/error">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>
[/@head]
</head>
<body>

[#include "/payment/material/transferJs.ftl"]

[#include "/payment/material/logo.ftl"]

<main>
    <div class="container form-container">
        <form id="submitForm" class="form_s gray" action="show.action" method="post">
            <div class="container-fluid details-container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-container fields-container">
                        <div class="container-fluid merchant-container">
                            <div class="row">
                                <h4 class="details-title merchant-title">Error info</h4>
                                <div class="col-md-12 col-sm-12 col-container">

                                    <p class="details-text"><label>Error code</label>&nbsp;
                                      ${errorEnum.code}
                                    </p>
                                    <p class="details-text"><label>Error message</label>&nbsp;
                                      ${errorEnum.msg}
                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="container-fluid button-container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-container ">
                                    <div class="buttons">
                                        <a class="btn btn-raised btn-default back-button" href="javascript:history.go(-1)" type="submit">
                                            BACK </a>
                                     [#if MERCHANT_FEATURE_MANUAL_TRANSFER && errorEnum.code == "014"]
                                        <a id="manualTransferButton" class="btn btn-default transfer-button" target="_blank">MANUAL TRANSFER</a>
                                     [/#if]
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