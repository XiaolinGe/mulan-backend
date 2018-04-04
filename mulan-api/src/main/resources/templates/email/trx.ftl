[#include "/email/emailLayout.ftl"]

[@emailLayout]

<!-- this is content start -->
<tr>
    <td align="left" valign="top" bgcolor="#FFFFFF" style="background-color:#FFFFFF;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <br/>
            <br/>
            <tr>

                <td align="left" valign="top">
                    <table width="480" border="0" cellspacing="0" cellpadding="0"
                           align="center">
                        <tr>
                            <td align="left" valign="top">
                                <div style="color:#2D3E51;  font-family: Arial, sans-serif; font-size:14px; font-weight: 600; line-height:21px;">
                                    Dear ${trx.name},
                                </div>
                                <br/>
                                <div style="font-family: Arial, sans-serif; color:#2D3E51; font-size:12px; line-height:21px;">

                                    Thank you for your payment of ${trx.receiveCurrency} ${trx.receiveAmount} that was processed on ${trx.createAt}.
                                    <br><br>

                                    The order number for this payment is ${trx.orderId}.

                                    <br/>
                                    <br/>

                                    Regards <br/>

                                    Latipay


                                </div>
                                <br/>
                            </td>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>
        <br/>

    </td>
</tr>
<!-- this is content end -->

[/@emailLayout]




