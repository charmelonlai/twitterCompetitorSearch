
$(document).on("click","#search-button",function() {
    var array = [];
	var self = this;
    $.ajax({
        type: "GET",
        url: "/search",
        data: {query: $(self).closest('form').find('.query').val()},
        success: function (data) {
        	$('#result').empty(); 
         	$.each(data, function(index, element){
         		var $elem = $("<a>").attr("href","#").addClass("list-group-item").html("<img src ="+element.profile_image_url_https+">@"+element.screen_name + " <span class='label label-default'>"+element.followers_count+"</span>");
                array.push($elem);
         		$(self).closest('form').find('#result').append($elem);
					$elem.click(function(){
						$(self).closest('form').find(".competitor").val($(".competitor").val()+"@"+element.screen_name+ " " );
						$(self).closest('form').find('#result').find($elem).remove();
                        return false;
					});
					console.log(element.screen_name);
			});
      	}
    });
});

$(document).on("keypress","form", function (e) {
    if (e.keyCode == 13) {
        return false;
    }
});


$(document).on("click","#newbtn",function(){
    if ($("#newbtn").text() == "+") {
        $("#newbtn").text("-");
    }else if ($("#newbtn").text() == "-"){
        $("#newbtn").text("+");
        $('#user-form').slideUp(350);
    }
});

$(document).ready(function(){
    $("#users_search input").keyup(function() {
        $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
});

