// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
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
//= require_tree .

function myFunction() {
          document.getElementById("demo").innerHTML = "Hello World";
        }

function blocmetricsReport(name) {
  var eventName = { name: name };
  var request = new XMLHttpRequest();
  //request.open("POST", "http://localhost:3000/api/events", true);
  request.open("POST", "https://bgohman-blocmetrics.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.send(JSON.stringify(eventName));
};


