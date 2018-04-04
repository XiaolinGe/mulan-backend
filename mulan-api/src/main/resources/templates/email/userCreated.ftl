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
                                <div style="color:#2D3E51; font-family: Arial, sans-serif; font-size:14px; font-weight: 600; line-height:21px;">
                                    Hi  ${user.agentName},
                                </div>
                                <br/>
                                <div style="font-family: Arial, sans-serif; color:#2D3E51;font-size:12px; line-height:21px;">

                                    Thank you for choosing Latipay, your account has been created. <br/>
                                    Your log in details is as follows,
                                    <br/><br/>

                                    <table width="400" border="0" cellspacing="0"
                                           cellpadding="0"
                                           align="left">
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none; border-bottom: none; ">
                                                Username
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-bottom: none; color: #2D3E51; text-decoration: none;">
                                            ${user.username}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51; border-right: none;">
                                                Temporary Password
                                            </td>
                                            <td style="padding: 2px 5px; border: 1px solid #2D3E51;">
                                            ${password}
                                            </td>
                                        </tr>
                                    </table>


                                    <div style="font-family: Arial, sans-serif; color:#2D3E51;font-size:12px; line-height:21px; display: inline-block;">
                                        <br/>
                                        Please click the link below to log in your account. <br>
                                        <a href="http://c2b-admin.latipay.net/#/auth/login"
                                           target="_blank" style="color:#2D3E51;"> Login</a>

                                        <br/><br/>


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




