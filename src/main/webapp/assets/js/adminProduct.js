function updateMinRange(value) {
	document.getElementById("minRangeInput").value = value;
}
function updateMaxRange(value) {
	document.getElementById("maxRangeInput").value = value;
}

$(document).ready(function() {

	//페이징 이벤트처리 submit
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
		var pageNum = $(this).attr("href");
		$("#moveForm input[name='pageNum']").val(pageNum);
		$("#moveForm").submit();
	});

	//------------------------------------- 검색 제이쿼리 ----------------
	//옵션 변경시 검색어 비우기
	$(".form-select").on('click', function() {

		$("#searchKeyword").val("");
	});

	//금액별 상품 검색일때 옵션정리
	$("#searchPrice").on("click", function() {

		$(".form-select option").first().prop("selected", true);
		$("#searchKeyword").val("");

	});



	// 검색 옵션 미선택시
	$("#Search").on("click", function() {
		let none = $("#none");

		if (none.prop("selected")) {
			alert("검색 옵션을 선택해 주세요");
		}
	});

	//------------------------------------- 상품 등록 제이쿼리 ----------------

	//상품 등록창 열기
	$("#Insert").on("click", function() {

		$("#inquiry_popup2").show();

	});



	//상품 등록
	$("#insertProduct").on("click", function(event) {
		event.preventDefault();
		if ($("#productName2").val() != ""
			&& $("#productEa2").val() != ""
			&& $("#price2").val() != ""
			&& $("#productContent2").val() != ""
			&& $("#category2").val() != ""
			&& $("#subCategory2").val() != ""
			&& $("#file2").val() != "") {

			$("#insertProductForm").submit();
		} else {
			if ($("#file2").val() == "") {
				alert("파일을 등록해주세요.");
			} else {
				alert("내용을 입력해주세요.");
			}
		}

	});

	// 파일 미리보기 이벤트
	$("#file2").on("change", function(event) {
		console.log("파일 체인지");

		var file = event.target.files[0];

		// 확장자 확인
		if (!isImageFile(file)) {
			alert("사진 파일만 올려주세요");

			// 파일 사이즈 확인
			if (isOverSize(file)) {
				alert("파일 사이즈가 너무 큽니다.");

			}
		} else {
			var reader = new FileReader();

			reader.onload = function(e) {

				$("#preview2").attr("src", e.target.result);
			};
			reader.readAsDataURL(file);
		}
	});

	// 확장자가 이미지 파일인지 확인
	function isImageFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
		return ["jpg", "jpeg", "gif", "png"].includes(ext);
	}

	// 파일의 최대 사이즈 확인
	function isOverSize(file) {
		var maxSize = 3 * 1024 * 1024; // 3MB로 제한
		return file.size > maxSize;
	}

	//------------------------------------- 상품 수정 제이쿼리 ----------------

	//상품 삭제 
	$("#deleteProduct").on("click", function(event) {
		let result = confirm("정말 삭제 하시겠습니까?");

		if (!result) {
			event.preventDefault();
			$('#inquiry_popup').hide();
		}

	});

	//상품 수정 등록
	$("#modifyProduct").on("click", function(event) {
		event.preventDefault();
		if ($("#productName").val() != ""
			&& $("#productEa").val() != ""
			&& $("#price").val() != ""
			&& $("#productContent").val() != ""
			&& $("#category").val() != ""
			&& $("#subCategory").val() != "") {

			$("#modifyProductForm").submit();
		} else {
			alert("내용을 입력해주세요.");
		}

	});

	//상품 수정창 취소버튼
	$(".btn_wrap .shopping_btn").on("click", function() {
		$('#inquiry_popup').hide();
		$('body').removeClass('no-scroll');
		$("#file").val("");
	});

	// 파일 미리보기 이벤트
	$("#file").on("change", function(event) {
		console.log("파일 체인지");

		var file = event.target.files[0];

		// 확장자 확인
		if (!isImageFile(file)) {
			alert("사진 파일만 올려주세요");

			// 파일 사이즈 확인
			if (isOverSize(file)) {
				alert("파일 사이즈가 너무 큽니다.");

			}
		} else {
			var reader = new FileReader();

			reader.onload = function(e) {

				$("#preview").attr("src", e.target.result);
			};
			reader.readAsDataURL(file);
		}
	});

	// 확장자가 이미지 파일인지 확인
	function isImageFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
		return ["jpg", "jpeg", "gif", "png"].includes(ext);
	}

	// 파일의 최대 사이즈 확인
	function isOverSize(file) {
		var maxSize = 3 * 1024 * 1024; // 3MB로 제한
		return file.size > maxSize;
	}
});