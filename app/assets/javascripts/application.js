// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.knob
//= require d3.v3.min
// require jquery.sparkline.min
//= require toastr
//= require jquery.tablesorter.min
//= require jquery.peity.min
//= require fullcalendar.min
//= require gcal
//= require setup

//= require d3-setup
// require jquery.flot
// require flot-chart-setup
// require d3barchart
//= require_self


protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://'; address = protocol + window.location.host + window.location.pathname + '/ws'; socket = new WebSocket(address);
socket.onmessage = function(msg) { msg.data == 'reload' && window.location.reload() }

toastr.options = {
  positionClass: 'toast-bottom-left'
};

$('.alert-system').each(function() {
  var type = this.dataset.type;
  var html = this.innerHTML;
  switch(type) {
    case 'error': toastr.error(html); break;
    case 'warning': toastr.warning(html); break;
    case 'success': toastr.success(html); break;
    default: toastr.info(html); break;
  }
});
