// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require plugins/momentjs/moment.min.js
//= require plugins/momentjs/moment-timezone.js
//= require_tree .

(function() {
  'use strict';

  $(document).ready(function() {
    // alert("sdgsfd")
    var time_zone = moment.tz.guess();
    $('.timestring').each(function() {
      var parse_time = this.textContent.clone().tz(time_zone);
      alert(time_zone);
      this.textContent = parse_time.format('lll');
    });
  });
})();
