// add 4 input fields for events
$(document).ready(function(){
  var id = 1;
  $("#addNewChoice").click(function(e){
    e.preventDefault();
    var html_add_date = "<div class=\"choiceForm\"><label for=\"Choice\">Data "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><br><input type=\"text\" name=\"ecard[date_event][]\" id=\"choices_date"+id+"\"></div>";
    var html_add_community = "<div class=\"choiceForm\"><label for=\"Choice\">Community "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><input type=\"text\" name=\"ecard[community_event][]\" id=\"choices_community"+id+"\"></div>";
    var html_add_name_link = "<div class=\"choiceForm\"><label for=\"Choice\">Name_link "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><br><input type=\"text\" name=\"ecard[name_link_event][]\" id=\"choices_link"+id+"\"></div>";
    var html_add_link = "<div class=\"choiceForm\"><label for=\"Choice\">Link "+id+"</label><a href=\"#\" class=\"remove-choice\"> X </a><br><input type=\"text\" name=\"ecard[link_event][]\" id=\"choices_link"+id+"\"></div>";
    $("#add_event").append(html_add_date + html_add_community + html_add_name_link + html_add_link);
    id = id +1;
  });
  $("#add_event").on("click",".remove-choice",function(e){
    e.preventDefault();
    $(this).parent(".choiceForm").remove();
  });
});
