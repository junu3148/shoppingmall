	$(window).on("load", function(){
		
		var selectPage =  $('#select_Page').val();
		

		
		$('#P' + selectPage).css("color", "#4982cf");
		$('#P' + selectPage).css("font-weight", "bold");
		$('#P' + selectPage).css("font-size", "15px");
	
	$('.review_list').on("click", function(){
 
	var content	=	$(this).parent().find('.review_content');
	
	if(content.css('display')== "none"){
		content.css('display', 'block');

	}else{
		content.css('display', 'none');

	}
	}); //content 클래스 클릭 이벤트 발생

});