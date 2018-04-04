[#include "/payment/material/common.ftl"]
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment</title>

[@head]

    <link rel="stylesheet/less" type="text/css" href="/less/material/payment">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>

[/@head]
</head>
<body>
[#include "/payment/material/logo.ftl"]

<main>
    <div class="container form-container">
        <form id="submitForm" class="form_s gray" action="show" method="post">
            <div class="form-hidden">
                <input type="hidden" name="mid" value="${merchantGateway.code}">
                <input type="hidden" name="key" value="${merchantGateway.signKey}">
                <input id="url" type="hidden" name="url" value="${url}">
                <input id="backUrl" type="hidden" name="backUrl" value="${backUrl}">
                <input type="hidden" name="curr" value="${merchantGateway.apiCurrency}">
                <input type="hidden" name="oid" value="${orderNumber}">
                <input type="hidden" name="shipto" value="${merchantInfo.businessName}">
                <input type="hidden" id="cust" name="cust" value="">
                <input type="hidden" id="pageType" name="pageType" value="universal">
                <input type="hidden" id="token" name="token" value="${token}">
            </div>

            <div class="container-fluid step-container">
                <div class="row ">
                    <div class="col-md-4 col-sm-4 step-line">
                        <div class="active-line first-active-line"></div>
                        <div class="step-indicator__step">
                            <h4 class="step-indicator__title">step 1</h4>
                            <div class="circle circle-first">1</div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 step-line">
                        <div class="active-line first-active-line"></div>
                        <div class="is-active step-indicator__step">
                            <h4 class="is-active step-indicator__title">payment</h4>
                            <div class="circle circle-first">2</div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 step-line">
                        <div class="active-line second-active-line"></div>
                        <div class="step-indicator__step">
                            <h4 class="step-indicator__title">summary</h4>
                            <div class="circle circle-second">3</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid details-container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-container fields-container">
                        <div class="container-fluid merchant-container">
                            <div class="row">
                                <h4 class="details-title merchant-title">merchant</h4>
                                <div class="col-md-12 col-sm-12 col-container">
                                    <p class="details-text"><label>merchant</label>&nbsp;
                                    ${merchantInfo.businessName}
                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="container-fluid payer-container">
                            <div class="row">
                                <h4 class="details-title payer-title">payer</h4>
                                <div class="col-md-6 col-sm-6 col-container">
                                    <div class="form-group label-floating">
                                        <label for="idCardName"
                                               class="control-label"><span>* </span>idName
                                        </label>
                                        <input type="text" class="form-control" id="idCardName" name="idCardName"
                                               onkeyup="showMax(this,80)" maxlength="80"
                                               data-v="validate[required,custom[chinese],maxSize[80]]"/>

                                    </div>
                                    <div class="form-group label-floating">
                                        <label for="idCard"
                                               class="control-label"><span>* </span>idNumber
                                        </label>
                                        <input type="text" class="form-control" id="idCard" name="idCard"
                                               onkeyup="showMax(this,20)"
                                               maxlength="20" data-v="validate[required,chinaId,maxSize[20]]"/>

                                    </div>
                                    <div class="form-group label-floating">

                                        <select id="phone_c" class="form-control" name="telNo"
                                                style="float:left; width: 27%">

                                            <option value="+64">+64(NZ)</option>
                                            <option value="+86">+86(CN)</option>
                                            <option value="+61">+61(AU)</option>
                                        </select>
                                        <span class="country-code"></span>
                                        <label for="phone"
                                               class="control-label mobile-label"><span> </span>mobileTelephoneNumber
                                        </label>
                                        <input type="text" class="form-control" name="telNum" id="phone"
                                               onblur="this.value=this.value.replace(/^[0\s]*/,'')"
                                               onkeyup="showMax(this,20)"
                                               maxlength="20" data-v="validate[custom[phoneNZD]]"
                                               style="float:right; width: 72%"/>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="clear"></div>
                                    <div class="form-group label-floating">
                                        <label for="email"
                                               class="control-label"><span>* </span>emailAddress
                                        </label>
                                        <input type="email" class="form-control" id="email" name="email"
                                               data-v="validate[required,custom[email],maxSize[50]]" maxlength="50"
                                               onkeyup="showMax(this,50)"/>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-container">
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid payment-container">
                            <div class="row">
                                <h4 class="details-title payment-title">payment</h4>
                                <div class="col-md-6 col-sm-6 col-container">
                                    <div class="form-group label-floating">
                                        <label for="amount"
                                               class="control-label"><span>* </span>${merchantGateway.apiCurrency}
                                            amount
                                        </label>
                                        <input type="number" class="form-control" id="amount"
                                               pattern="^(\d*)(\.\d\d)?$" name="amount"
                                               onblur="blurToMoney(this)" value=""
                                               data-v="validate[required,min[1.00]]"
                                               data-errormessage-range-underflow="amtLimit 1.00"/>

                                    </div>
                                    <div class="form-group label-floating">
                                        <label for="buyer_registration_code" class="control-label"><span>* </span>
                                            buyer</label>
                                        <input type="text" class="form-control" id="buyer_registration_code"
                                               name="reference" onkeyup="showMax(this,50)"
                                               maxlength="50" data-v="validate[required,maxSize[50]]"/>

                                    </div>

                                    <div class="form-group label-floating">
                                        <label for="invoice" class="control-label">
                                            invoice</label>
                                        <input type="text" class="form-control" id="invoice"
                                               name="invoice"/>
                                    </div>

                                    <div class="form-group label-floating">
                                        <label for="lot_number" class="control-label">
                                            lot</label>

                                        <input type="text" class="form-control" id="lot_number" name="lot"
                                               t_value="" o_value=""
                                               onkeypress="if(!this.value.match(/^\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^\d*?$/))this.o_value=this.value"
                                               onkeyup="if(!this.value.match(/^\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^\d*?$/))this.o_value=this.value"
                                               onblur="if(!this.value.match(/^\d*?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}"/>
                                    </div>
                                    <input type="hidden" name="ymd" value="${ymd}">
                                    <input type="hidden" name="version" value="${version}">
                                    <input type="hidden" name="md5info" value="${md5info}">
                                </div>
                                <div class="col-md-6 col-sm-6 col-container">

                                </div>
                            </div>
                        </div>
                        <div class="container-fluid button-container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-container ">
                                    <div class="buttons">
                                        <a class="btn btn-raised btn-default cancel-button"
                                           href="http://nzb.co.nz/finance/payments.cfm">cancel</a>
                                        <a class="btn btn-raised btn-default pay-now-button" type="submit"
                                           onclick="submitForm()">Continue</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                [#--    <input id="id_1" type="hidden" value="[@spring.message "api.interface.signature.info"/]">
                    <input id="id_2" type="hidden" value="[@spring.message "api.interface.signature.result"/]">
                    <input id="id_3" type="hidden" value="[@spring.message "api.interface.url.notnull"/]">--]

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


<!-- Open source code -->
<script>
    window.page = window.location.hash || "#about";

    $(document).ready(function () {
        if (window.page != "#about") {
            $(".menu").find("li[data-target=" + window.page + "]").trigger("click");
        }
    });

    $(window).on("resize", function () {
        $("html, body").height($(window).height());
        $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
        $(".pages").height($(window).height());
    }).trigger("resize");

    $(".menu li").click(function () {
        // Menu
        if (!$(this).data("target")) return;
        if ($(this).is(".active")) return;
        $(".menu li").not($(this)).removeClass("active");
        $(".list").not(page).removeClass("active").hide();
        window.page = $(this).data("target");
        var page = $(window.page);
        window.location.hash = window.page;
        $(this).addClass("active");


        page.show();

        var totop = setInterval(function () {
            $(".pages").animate({scrollTop: 0}, 0);
        }, 1);

        setTimeout(function () {
            page.addClass("active");
            setTimeout(function () {
                clearInterval(totop);
            }, 1000);
        }, 100);
    });

    function cleanSource(html) {
        var lines = html.split(/\n/);

        lines.shift();
        lines.splice(-1, 1);

        var indentSize = lines[0].length - lines[0].trim().length,
                re = new RegExp(" {" + indentSize + "}");

        lines = lines.map(function (line) {
            if (line.match(re)) {
                line = line.substring(indentSize);
            }

            return line;
        });

        lines = lines.join("\n");

        return lines;
    }

    $("#opensource").click(function () {
        $.get(window.location.href, function (data) {
            var html = $(data).find(window.page).html();
            html = cleanSource(html);
            $("#source-modal pre").text(html);
            $("#source-modal").modal();
        });
    });
</script>
<script>
    $.material.init();
</script>
<script>
    seajs.use(["alert", "validation"], function (alertM) {
        $("#submitForm").validationEngine().on("submit", function () {
            $("#cust").val($("#idCardName").val());
            console.log($("#url").val());
            console.log($("#backUrl").val());
            if ($("#url").val().trim().length == 0 && $("#backUrl").val().trim().length == 0) {
                alertM("notnull", {cls: "error"});
                return false;
            }

        })
        $phone = $("#phone"),
                $phone_c = $("#phone_c").on("change", function () {
                    if (this.value == "+64") {
                        $phone.attr("data-v", "validate[custom[phoneNZD]]").validationEngine('validate')
                    } else if (this.value == "+86") {
                        $phone.attr("data-v", "validate[custom[phoneCNY]]").validationEngine('validate')
                    } else if (this.value == "+61") {
                        $phone.attr("data-v", "validate[custom[phoneAUD]]").validationEngine('validate')
                    } else {
                        $phone.attr("data-v", "validate[custom[number],maxSize[20]]").validationEngine('validate')
                    }
                });
        $phone_c.trigger("change");
        window.refresh = function (t) {
            if (t)
                window.location.reload()
            alertM.remove()
        }
    })

</script>
<script>
    function submitForm() {
        $("#cust").val($("#idCardName").val());

        $("#submitForm").submit();
    }

    $(window).load(function () {
        $('input').each(function () {
            var val = $(this).val();
            if (val != '') {
                $(this).parent().removeClass('is-empty')
            }
        })
    });
</script>
</body>
</html>
