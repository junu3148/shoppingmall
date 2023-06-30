	$(document).ready(function() {
		//네비클릭스 포커스
		let CriteriaSubCategory = $("#CriteriaSubCategory").val() + '';

		if (CriteriaSubCategory == '') {
			$("#nav li").eq(0).addClass("on");
		} else {
			var subCategoryIndex = [ '간식', '배변용품', '미용', '장난감', '가구' ]
					.indexOf(CriteriaSubCategory);
			if (subCategoryIndex >= 0) {
				$("#nav li").eq(subCategoryIndex + 1).addClass("on");
			}
		}

		//카테고리 클릭시 포커스

		let category = $("#category").val();
		const categoryIndex = {
			'all' : 0,
			'강아지' : 1,
			'고양이' : 2
		};

		if (category in categoryIndex) {
			$(".category li").eq(categoryIndex[category])
					.addClass("on");
		}

		//페이징 처리
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var pageNum = $(this).attr("href");
			$("#moveForm input[name='pageNum']").val(pageNum);
			$("#moveForm").submit();
		});

	});