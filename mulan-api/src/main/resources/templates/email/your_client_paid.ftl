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
                                    Dear ${trx.agent.agentName},
                                </div>
                                <br/>
                                <div style="font-family: Arial, sans-serif; color:#2D3E51; font-size:12px; line-height:21px;">

                                    Your client ${trx.name}'s payment ${trx.orderId} has been created. <br/>

                                    The details of your client and the payment are listed below. <br/><br/>

                                    <table width="400" border="0" cellspacing="0"
                                           cellpadding="0"
                                           align="left">
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none; ">
                                                Client Name:
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-bottom: none;">
                                            ${trx.name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none;">
                                                Client Email:
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51;  border-bottom: none;">
                                            ${trx.email}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none; ">
                                                Payment Order Number:
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-bottom: none;">
                                            ${trx.orderId}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none;">
                                                Payment Amount:
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51;  border-bottom: none;">
                                            ${trx.receiveCurrency} ${trx.receiveAmount}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none; ">
                                                Payment Create At :
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-bottom: none;">
                                            ${trx.createAt}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; ">
                                                Payment Reference:
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51;  ">
                                            ${trx.reference}
                                            </td>
                                        </tr>

                                    </table>


                                    <div style="clear: both;"></div>


                                    <div style="font-family: Arial, sans-serif; color:#2D3E51;font-size:12px; line-height:21px; display: inline-block;">

                                        <br/>
                                        Regards <br/>

                                        Latipay
                                    </div>



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




