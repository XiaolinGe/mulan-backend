[#include "/payment/material/common.ftl"]
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
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
    <form id="submitForm" class="form_s gray" data-bind="submit: onSubmit">
      <div class="container-fluid step-container">
        <div class="row ">
          <div class="col-md-6 col-sm-6 step-line">
            <div class="active-line first-active-line"></div>
            <div class="is-active step-indicator__step">
              <h4 class="step-indicator__title">payment</h4>
              <div class="circle circle-first">1</div>
            </div>
          </div>
          <div class="col-md-6 col-sm-6 step-line">
            <div class="active-line second-active-line"></div>
            <div class="step-indicator__step">
              <h4 class="step-indicator__title">summary</h4>
              <div class="circle circle-second">2</div>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid details-container">
        <div class="row">
          <div class="col-md-8 col-sm-8 col-container fields-container">
            <div class="container-fluid merchant-container">
              <div class="row">
                <h4 class="details-title merchant-title">Beneficiary</h4>
                <div class="col-md-6 col-sm-6 col-container">
                  <div class="form-group label-floating">
                    <label for="beneficiary.id"
                           class="control-label"><span>* </span>University
                    </label>
                    <select data-bind="value:beneficiaryId,
                                                    event:{change: onChangeBeneficiary}"
                            name="beneficiary.id" id="beneficiary"
                            class="form-control">
                      <option value="" selected="selected"></option>
                    [#list beneficiaryList as item]
                      <option value="${item.id}">${item.name}(${item.nameCn})</option>
                    [/#list]
                    </select>
                    <p class="text-warning" data-bind="validationMessage: beneficiaryId"></p>
                  </div>

                  <div class="form-group label-floating">
                    <label for="beneficiaryBankAccount.id"
                           class="control-label"><span>* </span>Account
                    </label>
                    <select name="beneficiaryBankAccount.id" id="beneficiaryBankAccount"
                            data-bind="value:beneficiaryBankAccountId, enable:beneficiaryId()"
                            class="form-control" list="beneficiaryBankAccountList">
                      <option value="" selected="selected"></option>
                    </select>
                    <p class="text-warning" data-bind="validationMessage: beneficiaryBankAccountId"></p>
                  </div>

                  <div data-bind="with: newBeneficiaryBankAccount,
                                  visible: showNewAccountForm" id="newBankAccountModal">
                    <div class="form-group label-floating">
                      <label for="bankName"
                             class="control-label"><span>* </span>New Bank Name
                      </label>
                      <input data-bind="value:bankName" type="text" class="form-control" id="bankName"
                             name="bankName"/>
                      <p class="text-warning" data-bind="validationMessage: bankName"></p>
                    </div>
                    <div class="form-group label-floating">
                      <label for="bankAccountName"
                             class="control-label"><span>* </span>New Account Name
                      </label>
                      <input data-bind="value:accountName" type="text" class="form-control" id="bankAccountName"
                             name="bankAccountName"/>
                      <p class="text-warning" data-bind="validationMessage: accountName"></p>
                    </div>
                    <div class="form-group label-floating">
                      <label for="bankAccountNumber"
                             class="control-label"><span>* </span>New Account Number
                      </label>
                      <input data-bind="value:accountNumber" type="text" class="form-control" id="bankAccountNumber"
                             name="bankAccountNumber"/>
                      <p class="text-warning" data-bind="validationMessage: accountNumber"></p>
                    </div>
                  </div>

                </div>
                <div class="col-md-6 col-sm-6 col-container">
                </div>
              </div>
            </div>

            <div class="container-fluid payer-container">
              <div class="row">
                <h4 class="details-title payer-title">Payer</h4>
                <div class="col-md-6 col-sm-6 col-container">
                [#--<div class="form-group label-floating">--]
                [#--<label for="idName"--]
                [#--class="control-label"><span>* </span>id name--]
                [#--</label>--]
                [#--<input type="text" class="form-control" id="idName" name="idName"/>--]

                [#--</div>--]
                [#--<div class="form-group label-floating">--]
                [#--<label for="idNumber"--]
                [#--class="control-label"><span>* </span>id number--]
                [#--</label>--]
                [#--<input type="text" class="form-control" id="idNumber" name="idNumber"/>--]

                [#--</div>--]
                    <div class="form-group label-floating">
                        <label for="name" class="control-label"><span>* </span>Name</label>
                        <input data-bind="value:name" type="text" class="form-control" id="name" name="name"/>
                        <p class="text-warning" data-bind="validationMessage: name"></p>
                    </div>
                    <div class="form-group label-floating">
                        <label for="email" class="control-label"><span>* </span>Email</label>
                        <input data-bind="value:email" type="text" class="form-control" id="email" name="email"/>
                        <p class="text-warning" data-bind="validationMessage: email"></p>
                    </div>
                  <div class="form-group label-floating">
                    <label for="amount" class="control-label"><span>* </span>Amount</label>
                    <input data-bind="value:payAmount" type="text" class="form-control" id="amount" name="receiveAmount"/>
                    <p class="text-warning" data-bind="validationMessage: payAmount"></p>
                  </div>
                  <div class="form-group label-floating">
                    <label for="reference" class="control-label"><span>* </span>Reference</label>
                    <input data-bind="value:payReference" type="text" class="form-control" id="reference" name="reference"/>
                    <p class="text-warning" data-bind="validationMessage: payReference"></p>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-container">
                </div>
              </div>
            </div>


            <div class="container-fluid button-container">
              <div class="row">
                <div class="col-md-8 col-sm-8 col-container ">
                  <div class="buttons">
                  [#--<a class="btn btn-raised btn-default cancel-button"--]
                  [#--href="http://nzb.co.nz/finance/payments.cfm">cancel</a>--]
                    <button data-bind="click: onCancel" class="btn btn-raised btn-default cancel-button">
                      Cancel
                    </button>
                    <button class="btn btn-raised btn-default pay-now-button" type="submit"
                    >Continue
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        [#--    <input id="id_1" type="hidden" value="[@spring.message "api.interface.signature.info"/]">
            <input id="id_2" type="hidden" value="[@spring.message "api.interface.signature.result"/]">
            <input id="id_3" type="hidden" value="[@spring.message "api.interface.url.notnull"/]">--]

          [#include "/payment/material/help_en.ftl"]
        </div>
      </div>
    </form>
  </div>
</main>

<!-- Modal -->
[#--<div class="modal fade" id="newBankAccountModal" role="dialog">--]
  [#--<div class="modal-dialog">--]

    [#--<!-- Modal content-->--]
    [#--<div data-bind="with:newBeneficiaryBankAccount" class="modal-content">--]
      [#--<div class="modal-header">--]
        [#--<button type="button" class="close" data-dismiss="modal">&times;</button>--]
        [#--<h4 class="modal-title">Create A New Bank Account</h4>--]
      [#--</div>--]
      [#--<form data-bind="submit: $parent.onCreateBankAccount">--]
        [#--<div class="modal-body">--]
          [#--<div class="form-group label-floating">--]
            [#--<label for="bankAccountName"--]
                   [#--class="control-label"><span>* </span>Account Name--]
            [#--</label>--]
            [#--<input data-bind="value:accountName" type="text" class="form-control" id="bankAccountName"--]
                   [#--name="bankAccountName"/>--]
[#--<p class="text-warning" data-bind="validationMessage: accountName"></p>--]
          [#--</div>--]
          [#--<div class="form-group label-floating">--]
            [#--<label for="bankAccountNumber"--]
                   [#--class="control-label"><span>* </span>Account Number--]
            [#--</label>--]
            [#--<input data-bind="value:accountNumber" type="text" class="form-control" id="bankAccountNumber"--]
                   [#--name="bankAccountNumber"/>--]
[#--<p class="text-warning" data-bind="validationMessage: accountNumber"></p>--]
          [#--</div>--]
        [#--</div>--]
        [#--<div class="modal-footer">--]
        [#--<button type="button" class="btn btn-raised btn-default cancel-button" data-dismiss="modal">Cancel</button>--]
        [#--<button type="submit" class="btn btn-raised btn-default pay-now-button">Create</button>--]
      [#--</div>--]
      [#--</form>--]
    [#--</div>--]

  [#--</div>--]
[#--</div>--]

<script>
  $.material.init();
  ko.validation.init({insertMessages: false});

  function NewBeneficiaryBankAccount(){
    var self = this;
    self.errors = ko.validation.group(self, {deep: true, observable: false});
    self.validationSwitch = ko.observable(false);
    self.accountName = ko.observable('').extend({
      required: {
        param: self.validationSwitch,
        message: 'Please input account name.'
      }
    });
    self.accountNumber = ko.observable('').extend({
      required: {
        param: self.validationSwitch,
        message: 'Please input account number.'
      }
    });

    self.bankName = ko.observable('').extend({
      required: {
        param: self.validationSwitch,
        message: 'Please input bank name.'
      }
    });

  }

  function step1ViewModel() {
    var self = this;

    self.beneficiaryId = ko.observable("").extend({
      required: {
        param: true,
        message: 'Please select your university.'
      }
    });
    self.beneficiaryBankAccountId = ko.observable("").extend({
      required: {
        param: true,
        message: 'Please select the account.'
      }
    });
    self.payAmount = ko.observable("").extend({
      required: {
        param: true,
        message: 'Please input the amount.'
      },
//      pattern:{
//        param: "^[0-9]{1,3}(?:,?[0-9]{3})*\\.[0-9]{2}$",
//        message: 'Please input one cent at least.'
//      }
      number:{
        param: true,
        message: 'Please input a number.'
      }
    });

    self.payReference = ko.observable("").extend({
      required: {
        param: true,
        message: 'Please input the reference.'
      }
    });

      self.name = ko.observable("").extend({
          required: {
              param: true,
              message: 'Please input the name.'
          }
      });

      self.email = ko.observable("").extend({
          required: {
              param: true,
              message: 'Please input the email.'
          }
      });

    self.showNewAccountForm = ko.observable(false);

    self.newBeneficiaryBankAccount = ko.observable(new NewBeneficiaryBankAccount());

    self.errors = ko.validation.group({
      beneficiaryId: self.beneficiaryId,
      beneficiaryBankAccountId: self.beneficiaryBankAccountId,
        name: self.name,
        email: self.email,
      payAmount: self.payAmount,
      payReference: self. payReference
    }, { deep: true, observable: false });

    self.beneficiarySelect = $('#beneficiary').selectize({});

    self.popupSelectBeneficiary = function () {
      bootbox.hideAll();
      bootbox.alert({
        message: 'You are supposed to select the university firstly.',
        buttons: {
          ok: {
            label: "OK",
            className: "tn btn-raised btn-default pay-now-button  pay_now_btn"
          }
        }
      });
    };

    self.beneficiaryBankAccountSelect =$('#beneficiaryBankAccount').selectize({
      create: true,
      onItemAdd: function (item) {
        console.log(item);
        self.showNewAccountForm(item == 0);
      },
      onType: function () {
        if(!self.beneficiaryId()){
          self.popupSelectBeneficiary();
          //self.showNewAccountForm(false);
          return;
        }
      },
      onOptionAdd: function (value, data) {
        if (data.value == data.text) {
          self.beneficiaryBankAccountSelect.removeOption(data.value);//删除刚试图添加的选项
//          self.beneficiaryBankAccountSelect.removeOption(0);//删除上一次的New B A标记
          if (!self.beneficiaryId()) {
            self.popupSelectBeneficiary();
            return;
          }
          self.newBeneficiaryBankAccount().accountName(data.text);
          self.newBeneficiaryBankAccount().accountNumber(data.text);
          self.newBeneficiaryBankAccount().bankName(data.text);
          self.newBeneficiaryBankAccount().validationSwitch(false);
          $("#newBankAccountModal").find('.label-floating').removeClass('is-empty');
          self.showNewAccountForm(true);
//          self.beneficiaryBankAccountSelect.addOption({
//            value: 0,
//            text: 'Add New Bank Account'
//          });
          self.beneficiaryBankAccountSelect.blur();
          self.beneficiaryBankAccountSelect.setValue(0, false);
        }
      }
    })[0].selectize;

    self.onChangeBeneficiary = function () {
      if (self.beneficiaryId() != undefined) {
        self.beneficiaryBankAccountId('');
        self.beneficiaryBankAccountSelect.clearOptions();
        if (self.beneficiaryId()) {
          axios.get('/v1/beneficiary-bank-account?f_verified=true&f_verified_op==&f_beneficiary.id_op==&f_beneficiary.id=' + self.beneficiaryId())
            .then(function (response) {
            var bankAccounts = response.data.content;
            if (bankAccounts)
              bankAccounts.forEach(function (t) {
                self.beneficiaryBankAccountSelect.addOption({value: t.id, text: t.bankName + '-' + t.accountName + '-' + t.accountNumber});
                console.log(t);
              });

              self.beneficiaryBankAccountSelect.addOption({
                value: 0,
                text: 'Add New Bank Account'
              });

            }).catch(function (err) {
            console.log(err);
          });
        }
      }
    };

    self.onSubmit = function () {
      if (self.errors().length > 0) {
        self.errors.showAllMessages();
        return;
      }
      if( self.showNewAccountForm() &&
          self.newBeneficiaryBankAccount().errors().length > 0){
        self.newBeneficiaryBankAccount().errors.showAllMessages();
        return;
      }
      axios.get('/payment/createInternalOrderId?idToken=${idToken}').then(function (response) {
        var internalId = response.data;
        window.location.href = '/payment/step2?idToken=${idToken}&beneficiary.id=' + self.beneficiaryId() +
          '&beneficiaryBankAccount.id=' + self.beneficiaryBankAccountId() +//保留，若0为新建
          '&beneficiaryBankAccount.accountName=' + self.newBeneficiaryBankAccount().accountName() +
          '&beneficiaryBankAccount.accountNumber=' + self.newBeneficiaryBankAccount().accountNumber() +
          '&beneficiaryBankAccount.bankName=' + self.newBeneficiaryBankAccount().bankName() +
          '&internalOrderId=' + internalId +
                '&name=' + self.name() +
                '&email=' + self.email() +
          //'&idName=&idNumber=' +
          '&receiveAmount=' + self.payAmount() +
          '&reference=' + self.payReference();
      }).catch(function (err) {
        console.log(err);
      });
    };

    self.onCancel = function () {
      //self.newBeneficiaryBankAccount().validationSwitch(false);
    };

    [#--self.onCreateBankAccount = function () { --]
      [#--if(self.newBeneficiaryBankAccount().errors().length > 0){--]
        [#--self.newBeneficiaryBankAccount().errors.showAllMessages();--]
        [#--console.log(self.newBeneficiaryBankAccount().errors());--]
        [#--return;--]
      [#--}--]
      [#--if (self.beneficiaryId) {--]
        [#--axios.post('/v1/beneficiary-bank-account?idToken=${idToken}&beneficiary.id=' + self.beneficiaryId(), {--]
          [#--accountName: self.newBeneficiaryBankAccount().accountName(),--]
          [#--accountNumber: self.newBeneficiaryBankAccount().accountNumber()--]
        [#--}).then(function (response) {--]
          [#--var newOption = response.data;--]
          [#--console.log(newOption);--]
          [#--self.beneficiaryBankAccountSelect.addOption({value:newOption.id, text:newOption.accountName +'-'+ newOption.accountNumber});--]
          [#--self.beneficiaryBankAccountSelect.addItem(newOption.id, false);--]
          [#--$("#newBankAccountModal").modal('hide');--]
          [#--self.newBeneficiaryBankAccount().validationSwitch(false);--]
        [#--}).catch(function (err) {--]
          [#--console.log(err);--]
          [#--$("#newBankAccountModal").modal('hide');--]
          [#--self.newBeneficiaryBankAccount().validationSwitch(false);--]
        [#--});--]
      [#--}--]
    [#--};--]
  }

  $(function () {
    ko.applyBindings(new step1ViewModel());
  });
</script>

</body>
</html>
