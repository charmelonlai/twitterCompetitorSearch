
$(document).on("click","#ajax-button",function() {
	var self = this;
    $.ajax({
        type: "GET",
        url: "/search",
        data: {query: $(self).closest('form').find('.query').val()},
        success: function (data) {
        	$('.result').empty(); 
         	$.each(data, function(index, element){
         		var $elem = $("<li>").addClass("user_li"+index).html("<img src ="+element.profile_image_url_https+">@"+element.screen_name + ": " + element.followers_count + " followers" );
         		$(self).closest('form').find('.result').append($elem);
					$elem.click(function(){
						$(self).closest('form').find(".competitor").val($(".competitor").val()+"@"+element.screen_name+ " " );
						$(self).closest('form').find('.result').find($elem).remove();
					});

					console.log(element.screen_name);
			});
      	}
    });
});




