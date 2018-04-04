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

    <link href="/css/common/mrp_fonts/style.css" rel="stylesheet" type="text/css"/>

[#--TODO: convert to less then to ftl ? --]
    <link rel="stylesheet" href="/css/payment/bankingLimits.css">
    <link href="/css/payment/popupWindow.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/image-picker/0.3.0/image-picker.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/image-picker/0.3.0/image-picker.min.js" type="text/javascript"></script>

    <link rel="stylesheet/less" type="text/css" href="/less/material/show">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.3/less.min.js" type="text/javascript"></script>

[/@head]
</head>
<body>
[#include "/payment/material/logo.ftl"]

<main>
    <div class="container show-container">
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
              <div class="circle circle-second">
                <span data-bind="css:summaryIcon"></span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid details-container">
        <div class="row">
          <div class="col-md-8 col-sm-8 col-container fields-container">

            <div class="container-fluid order-container">
              <div data-bind="visible: orderStatus() != 'PAID' " class="row">
                <h5 class="details-title order-title">Order is still Pending</h5>
                <div class="col-md-12 col-sm-12 col-container">
                 <p>
                   We have not verified your payment yet.
                 </p>
                  <p>
                    You can continue the payment or contact us.
                  </p>
                  <p>
                    <button class="btn btn-raised btn-default pay-now-button  pay_now_btn"
                            type="submit" id="pay_now" data-bind="click:onPay" data-backdrop="static"
                            data-keyboard="false">Continue to Pay
                    </button>
                  </p>
                  <br>
                  <br>
                </div>
              </div>

              <div data-bind="visible:orderStatus() == 'PAID'" class="row">
                <h5 class="details-title order-title">Order is Successfully paid!</h5>
                <div class="col-md-12 col-sm-12 col-container">
                  <p>
                    Thank you for using our service!
                  </p>
                  <br>
                  <br>
                </div>
              </div>
            </div>

            <div class="container-fluid your-container">
              <div class="row">
                <h6 class="details-title order-title">Order Details</h6>
                <div class="col-md-12 col-sm-12 col-container">
                [#--<p class="details-text"><label>nationalIDName</label>&nbsp; ${transaction.idName}</p>--]
                [#--<p class="details-text"><label>nationalIDNumber</label>&nbsp; ${transaction.idNumber}</p>--]
                  <p class="details-text"><label>Order Number</label>&nbsp; ${transaction.orderId}</p>
                  <p class="details-text"><label>Amount</label>&nbsp; ${transaction.receiveAmount}</p>
                  <p class="details-text"><label>Reference</label>&nbsp; ${transaction.reference} </p>
                  <p class="details-text"><label>Beneficiary</label> ${transaction.beneficiary.name} </p>
                  <p class="details-text"><label>Beneficiary Bank Account</label> ${transaction.beneficiaryBankAccount.accountName} - ${transaction.beneficiaryBankAccount.accountNumber} </p>
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
    </div>
</main>

[#include "/payment/dialog/pendingPayment.ftl"]
[#--[#include "/payment/material/bankValidation.ftl"]--]
[#include "/payment/material/transferJs.ftl"]

<script>
  $.material.init();
  ko.validation.init({insertMessages: false});

  function step3ViewModel(orderId, orderStatus) {
    var self = this;
    self.orderId = ko.observable(orderId);
    self.internalOrderId = ko.observable('${transaction.internalOrderId}');
    self.orderStatus = ko.observable(orderStatus);
    self.timer = '';

    self.needCopyBtn = ko.observable(false);//占位用
    self.onCopy = function(){};//占位用

    self.checkStatus = function () {
      axios.get('/payment/transactionStatus?idToken=${idToken}&orderId=' + self.orderId().toString())
        .then(function (response) {
          self.orderStatus(response.data);
          if (self.orderStatus() == 'PAID') {
            $("#pendPayment").modal('hide');
            clearInterval(self.timer);
          } else if (self.orderStatus() != 'PENDING') {
            self.paymentFailure();
          }
        }).catch(function (err) {
        console.log(err);
        self.paymentFailure();
      });
    };

    self.summaryIcon = ko.computed(function () {
      if (self.orderStatus() == 'PAID')
        return 'fa fa-check';
      else
        return 'fa fa-question';
    });

    self.onPay = function(){
      $("#pendPayment").modal();
      var redirectUrl = "/payment/orderRedirect?idToken=${idToken}&orderId=" + self.orderId();
      console.log(redirectUrl);
      var win = window.open(redirectUrl, '_blank');
      win.focus();
    };

    self.paymentSuccess = function(){
      clearInterval(self.timer);
      location.reload(true);
    };

    self.paymentFailure = function(){
      clearInterval(self.timer);
      console.log('jump to error page !');
      window.location.href = 'error';
    };

    (function() {
      self.timer = setInterval(self.checkStatus, 3000);
      axios.get('/payment/transactionPaid?idToken=${idToken}&internalOrderId=${transaction.internalOrderId}')
        .then(function (response) {
          var paid = response.data;
          if(paid) {
            console.log(response);
            clearInterval(self.timer);
            self.orderStatus('PAID');
          }
        }).catch(function (err) {
        console.log(err);
      });
    })();//check internal order list firstly, then check the specific order that has not finished
  }

  $(function () {
    ko.applyBindings(new step3ViewModel('${transaction.orderId}','${trasaction.orderStatus}'));
  });
</script>
</body>
</html>

