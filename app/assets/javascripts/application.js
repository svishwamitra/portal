// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.tokeninput
//= require_tree .
$(function () {
   $('#account_contact_tokens').tokenInput('/company/accounts.json', {
    crossDomain: false});
});

$(function () {
   $('#contact_account_tokens').tokenInput('/crm/contacts.json', {
    crossDomain: false,
    tokenLimit: 1
   });
});

$(function(){
  $('#filters_link').click(function()
    {
      $('#filter_rows').css('display', 'block');
      $('#filters_row').fadeIn();
    });
});

$(function () {
   $('#matter_linked_contact_tokens').tokenInput('/matters/matters.json', {
    crossDomain: false,
    tokenLimit: 1
   });
});