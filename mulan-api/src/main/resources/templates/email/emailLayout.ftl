[#macro emailLayout]
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LatiPay Email</title>
</head>
<body style="background-color:#E6E6E6; margin: 0; padding: 0;">

<table style="width:100%;" align="center" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center" valign="top" style="background-color:#E6E6E6;" bgcolor="#E6E6E6;">

                        <table width="600" border="0" align="center" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="left" valign="top" bgcolor="#FFFFFF"
                                    style="background-color:#FFFFFF; position: relative">
                                    <a href="https://merchant.latipay.co.nz/login/login.action" target="_blank">
                                        <img src="${domain}/images/mail/latipay_email_header.png" alt="Latipay"
                                             width="600" height="467" style="width:600px; height: 467px;">
                                    </a>
                                </td>
                            </tr>


                            <!-- this is content start -->

                            [#nested]

                            <!-- this is content end -->

                            <tr>
                                <td align="left" valign="top" height="200" bgcolor="#2D3E51"
                                    style="background-color:#e1fae8;">
                                    <table width="480" border="0" cellspacing="0" cellpadding="0" align="center"
                                           style="margin-top: 33px">
                                        <tr>
                                            <td align="left" valign="top"
                                                style="width: 277px; color:#2d3e51; font-family:Arial, Helvetica, sans-serif; font-size:16px; font-weight: 600;">
                                                ABOUT US<br/>
                                                <table style="width: 219px; margin-top: 8px; font-family: Arial, sans-serif; font-size:10px; line-height:18px; text-align: justify; font-weight: 400;">
                                                    <tr>
                                                        <td style="color: #2d3e51;">LatiPay is a first to market, fully
                                                            compliant financial
                                                            technology New Zealand business.
                                                            The LatiPay platform allows for Chinese payer to pay for
                                                            goods and services with CNY whilst
                                                            our New Zealand merchant receives full payment in NZD, at no
                                                            cost to the merchant.
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>

                                            <td align="left" valign="top"
                                                style="color:#2d3e51; font-family:Arial, Helvetica, sans-serif; font-size:16px; font-weight: 600;">
                                                CONTACT US<br/>
                                                <table style=" margin-top: 8px; font-family: Arial, sans-serif; font-size:10px; line-height:18px; font-weight: 400;">
                                                    <tr>
                                                        <td width="55px" align="left" valign="top"
                                                            style="color: #2d3e51;">Address :
                                                        </td>
                                                        <td align="left" valign="top"
                                                            style="width: 156px; color: #2d3e51;"> Level 2, 205
                                                            Darby Street, <br/>
                                                            Auckland CBD <br/>
                                                            New Zealand 1010
                                                        </td>
                                                    </tr>
                                                    <tr style="line-height: 10px">
                                                        <td width="55px" align="left" valign="top"
                                                            style="letter-spacing: 1px; color: #2d3e51">E-mail :
                                                        </td>
                                                        <td align="left" valign="top"
                                                            style="width: 156px; color: #2d3e51;"><a
                                                                href="mailto:customerservice@latipay.co.nz"
                                                                style="color:#2d3e51; text-decoration:none;">
                                                            customerservice@latipay.co.nz
                                                        </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="55px" align="left" valign="top"
                                                            style="letter-spacing: 1px; color: #2d3e51;">Phone :
                                                        </td>
                                                        <td align="left" valign="top"
                                                            style="width: 156px; color: #2d3e51"> 0064 9
                                                            9300600
                                                            <br/>or 400 66602333
                                                        </td>
                                                    </tr>
                                                </table>

                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>

                            <tr>
                                <td align="left" valign="top" bgcolor="#2D3E51" style="background-color:#e1fae8;">
                                    <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
                                        <tr>
                                            <td colspan="2" align="center"
                                                style="background-color: #27af60; color: #fff;font-family: Arial, sans-serif; font-size:13px; line-height:33px;">
                                                All Content 2017 Latitude Technologies Limited All Rights Reserved.
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</table>
</body>
</html>

[/#macro]