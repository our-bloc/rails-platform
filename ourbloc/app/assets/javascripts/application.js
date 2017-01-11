// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs 
//= require app.js
//= require init.js
//= require materialize/extras/nouislider
//= require materialize-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(".progress").hide();
  $('ul.tabs').tabs('select_tab', 'tab_id');
  $('.scrollspy').scrollSpy();
  // $('.modal').modal();

  $(".section-tabs").on("click", function() {
  	var id = $(this).find("a").attr("href");
  	console.log(id);

  	//Step 2: Remove class of "active" from each of the ".section-tabs"
  	//Step 3: Add the class of "active" to "this"
  	//Step 4: Hide all content sections below
  	//Step 5: Show the appropriate content section based on its ID from above
  });
})
