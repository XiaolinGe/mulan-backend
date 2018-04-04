
<script>
    function bankLimitsDialog(amount)  {
           var dialog = new BootstrapDialog({
            title: '[@spring.message "trade.show.notificationTitle"/]',
            message: "[@spring.message 'trade.show.notification1'/]"+ amount +'<br/><br/>'
            +"[@spring.message 'trade.show.notification2'/]"+' <br/><br/>'
             [#if  MERCHANT_FEATURE_MANUAL_TRANSFER]
             +"[@spring.message 'trade.show.notification3'/]"+'<br/> <br/>'
             +"[@spring.message 'trade.show.notification4'/]"
             [/#if]
           ,
            cssClass:'amount-limit-notification',
            buttons: [{
                cssClass:'btn btn-default btn-margin popup-window-button',
                label: '[@spring.message "trade.show.notificationClose"/]',
                action: function(dialogRef) {
                    dialogRef.close();
                }
            }, {
                label: '[@spring.message "trade.show.notificationPaymentPage"/]',
                cssClass: 'btn btn-default  btn-margin popup-window-button',
                action: function(){
                    window.location.href = "javascript:history.go(-1)";
                }
            }
            [#if MERCHANT_FEATURE_MANUAL_TRANSFER]
                ,{
                label: '[@spring.message "trade.show.notificationManualTransfer"/]',
                //id:'manualTransferButton',
                cssClass: 'btn btn-default  btn-margin popup-window-button',
                action: openTransferPage
            }
            [/#if]
            ]

        });
        dialog.open();

    }
    function convertToDecimal(value, precision) {
        var precision = precision || 0,
                power = Math.pow(10, precision),
                absValue = Math.abs(Math.round(value * power)),
                result = (value < 0 ? '-' : '') + String(Math.floor(absValue / power));

        if (precision > 0) {
            var fraction = String(absValue % power),
                    padding = new Array(Math.max(precision - fraction.length, 0) + 1).join('0');
            result += '.' + padding + fraction;
        }
        return result;
    }

    var bank_amount_list = [[#list jsList as item]{
                [#list item.entrySet() as entry]
                ${entry.key} :'${entry.value}',
                [/#list]},
              [/#list]]

    function bankLimits(select_bank_amount,order_money) {
        return select_bank_amount !== "unlimited" && order_money > select_bank_amount
    }

</script>











