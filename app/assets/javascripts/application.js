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
    var html_add_title = "<div class=\"choiceForm\"><label for=\"Choice\">title "+id+"</label><br><input type=\"text\" name=\"ecard[title_event][]\" id=\"choices_title"+id+"\"> <a href=\"#\" class=\"remove-choice\"> X </a><br></div>";
    var html_add_desc = "<div class=\"choiceForm\"><label for=\"Choice\">desc "+id+"</label><br><input type=\"text\" name=\"ecard[desc_event][]\" id=\"choices_desc"+id+"\"> <a href=\"#\" class=\"remove-choice\"> X </a><br></div>";
    var html_add_link = "<div class=\"choiceForm\"><label for=\"Choice\">link "+id+"</label><br><input type=\"text\" name=\"ecard[link_event][]\" id=\"choices_"+id+"\"> <a href=\"#\" class=\"remove-choice\"> X </a><br></div>";
    $("#choose_image").append(html_add_title + html_add_desc + html_add_link);
    id = id +1;
  });
  $("#choose_image").on("click",".remove-choice",function(e){
    e.preventDefault();
    $(this).parent(".choiceForm").remove();
  });
});
