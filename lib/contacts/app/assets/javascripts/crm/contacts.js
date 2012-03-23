// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

JQuery(function() {
JQuery('#contacts_filter').click( function() {
  alert("Hi There!");
 if (JQuery('#filters_row').is(':visible')) {
  JQuery('#filters_row').hide(); 
 } else {
  JQuery('#filters_row').show(); 
   }
  });
});
