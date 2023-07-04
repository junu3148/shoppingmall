//페이징
$(document).ready(function() {

	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
		var pageNum = $(this).attr("href");
		$("#moveForm input[name='pageNum']").val(pageNum);
		$("#moveForm").submit();
	});


	//문의글 등록
	$("#submitqna").on("click", function(event) {

		event.preventDefault();
		if ($("#inquiry_tit").val() != "" && $("#inquiry_cont").val() != "") {
			$("#moveForm1").submit();
		} else {
			alert("내용을 입력해주세요.");
		}

	});

	//문의 답글 등록
	$("#submitqna2").on("click", function() {

		if ($("#inquiry_cont2").val() != "") {
			$("#moveForm2").submit();
		} else {
			alert("내용을 입력해주세요.");
		}
	});

	// 문의 답글창 띄우기
	$(".insertQnAAdmin").on("click", function() {
		let customerNo = $(this).data("no");
		$("#inquiry_popup2").show();
		$("#customerNo").val(customerNo);
	});

	//문의 답글창 취소버튼
	$("#inquiry_popup2 .btn_wrap .shopping_btn")
		.on(
			"click",
			function() {
				$('#inquiry_popup2').hide();
				$(
					'#inquiry_popup2 input[type="text"], #inquiry_popup2 textarea')
					.val(''); // Clear input fields
				$('body').removeClass('no-scroll');
			});
			
	

});