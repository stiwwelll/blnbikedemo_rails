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
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require angular-resource

//= require_tree

$(window).load(function(){
  setTimeout(function(){ $('.alert').fadeOut() }, 1000);
});


var addComment = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  };

$(document).on('ready page:load', addComment);
$(document).bind("ajaxComplete", addComment);


$(document).on('ready page:load', function () {
  $('.img-zoom').elevateZoom();
  $('.img-zoom').elevateZoom({zoomWindowPosition: 1, zoomWindowOffetx: -1000});
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});