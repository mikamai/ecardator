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
//= require_tree .

$(document).ready(function(){
  var id = 1;
  $("#addNewChoice").click(function(e){
    e.preventDefault();
    var html_add_date = "<div class=\"choiceForm\"><label for=\"Choice\">Data "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><br></div><input type=\"text\" name=\"ecard[date_event][]\" id=\"choices_date"+id+"\">";
    var html_add_community = "<div class=\"choiceForm\"><label for=\"Choice\">Community "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a></div><input type=\"text\" name=\"ecard[community_event][]\" id=\"choices_community"+id+"\">";
    var html_add_link = "<div class=\"choiceForm\"><label for=\"Choice\">Link "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><br></div><input type=\"text\" name=\"ecard[link_event][]\" id=\"choices_link"+id+"\">";
    $("#choose_image").append(html_add_date + html_add_community + html_add_link);
    id = id +1;
  });
  $("#choose_image").on("click",".remove-choice",function(e){
    e.preventDefault();
    $(this).parent(".choiceForm").remove();
  });
});
