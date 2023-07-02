



/*============================================제품 디테일 페이지============================================*/

/*제품이 등록된 카테고리별 상단 바 디자인 요소 다르게 함*/
$(window).on("load", function(){
	
	var category  = $('#subCategory').val();
	
	if(category == "간식"){ $('.snack').css('color', '#4982cf');}
	if(category == "배변용품"){  $('.toilet').css('color', '#4982cf');  }
	if(category == "미용"){  $('.beauty').css('color', '#4982cf'); }
	if(category == "장난감"){  $('.toy').css('color', '#4982cf'); }
	if(category == "가구"){  $('.furniture').css('color', '#4982cf'); }
	

		
		var selectPage =  $('#select_Page').val();
		

		
		$('#P' + selectPage).css("color", "#4982cf");
		$('#P' + selectPage).css("font-weight", "bold");
		$('#P' + selectPage).css("font-size", "15px");

	
	
	
});




/*리뷰 삭제 모달 펼치는 기능*/
$('.delete_review_button').on("click", function(){
	
	var reviewNo = $(this).data('reviewno');
	var productNo = $(this).data('productno');
	console.log(reviewNo)
	
	$('#review_modal').modal('show');
	$('#delete_No').val(reviewNo);
	$('#product_No').val(productNo);
	
}); //리뷰 삭제 버튼 클릭 이벤트 end



	/*수량 증가 감소영역*/
	$(window).on("load", function() {

		updateTotalPrice();

		//플러스 버튼을 클릭했을 때 수량 증가
		$(".plus").on("click", function() {
			var EA = $(".inp");
			var EAval = Number(EA.val()); // EAval을 숫자로 변환
			var max = Number($(this).data('max'));
			
			if((EAval + 1 ) <= max ){
			EA.val(EAval + 1); // 증가된 값을 input 요소에 설정
			}
			updateTotalPrice();
		}); //plus btn event end

		// 마이너스 버튼을 클릭했을 때 수량 감소
		$(".minus").on("click", function() {
			var EA = $(".inp");
			var EAval = Number(EA.val()); // EAval을 숫자로 변환

			if (EAval > 1) {
				EA.val(EAval - 1); // 감소된 값을 input 요소에 설정
				updateTotalPrice();
			}
		}); //minus btn event end
	}); //window load event end
	


	//변동되는 숫자에 따라 금액을 조정하고, 조정된 금액에 ','와 '원'을 더해주는 function 
	function updateTotalPrice() {
		var EAval = Number($(".inp").val());
		var price = $("#price").val()

		var total_price = EAval * price;
		var set_price = total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+ '원';
		
		$('#total_price').val(total_price);
		$(".total_price").text(set_price);
		
	}
	
	
/*============================================//제품 디테일 페이지//============================================*/


/*==============================================오더 페이지================================================*/
	