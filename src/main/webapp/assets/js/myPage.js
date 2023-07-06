	$(window).on("load", function(){
		
		var selectPage =  $('#select_Page').val();
		

		
		$('#P' + selectPage).css("color", "#4982cf");
		$('#P' + selectPage).css("font-weight", "bold");
		$('#P' + selectPage).css("font-size", "15px");
	
	

	
$('#close_popup_btn').on("click", function(){
	$('#popup_layer').css("display", "none");
	$('#img').removeAttr("src");
});
$('#close_popup_btn').on('mouseenter', function() {
    $(this).css('cursor', 'pointer');
  });
$('.review_list').on('mouseenter', function() {
    $(this).css('cursor', 'pointer');
  });

});