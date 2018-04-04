<!-- Modal -->
<div class="modal fade" id="pendPayment" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <div class='text-center'>
          Your order No. is <span data-bind="text:internalOrderId"></span>
          <br>Please finish your payment.<br>
        </div>
        <div class="row text-center">
          <div class="col-md-12 text-center">
            <button type="button" data-bind="click:paymentFailure" class="btn btn-raised btn-default cancel-button"
                    data-dismiss="modal">Any Probems?
            </button>
            <button type="submit" data-bind="click:paymentSuccess" class="btn btn-raised btn-default pay-now-button"
                    data-dismiss="modal">Finished Payment
            </button>
          </div>
        </div>
        <div class="row" data-bind="visible: needCopyBtn">
          <div class="col-md-10 col-md-offset-1">
            <b class="text-warning">
              <br>
              Note: Your browser may not be able to open payment page correctly, click the button below to copy the URL
              and try it in another browser like Internet Explorer.
            </b>
            <div class="text-center">
              <button id="copyUrl"
                      type="button"
                      data-bind="click: onCopy"
                      data-clipboard-action="copy"
                      data-clipboard-text="${domain}/payment/step2?idToken=${idToken}&beneficiary.id=${transaction.beneficiary.id}&beneficiaryBankAccount.id=${transaction.beneficiaryBankAccount.id}&internalOrderId=${transaction.internalId}&receiveAmount=${transaction.receiveAmount}&reference=${transaction.reference}"
                      class="btn btn-default">
                Copy Url
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal End-->
<!--orderId must be an observable variable in the ViewModel-->
<!--You must implement paymentFailure and paymentSuccess in the ViewModel-->
<!--$("#pendPayment").modal();  to pop it up-->
