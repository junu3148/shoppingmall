


	window.onload = function() {

		console.log('onload 이벤트 발생 체크')
		
		
		
		/*------------------------------------아이디 유효성 검사-------------------------------------*/
		
		$('#inputId').on("keyup", function(){
			
			var inputId = $(this).val();
			
		var CustomerVO = {
				customerId  : inputId
		} 
			
		  $.ajax({
	            
	            //요청 세팅
	            url : "${pageContext.request.contextPath}/customer/checkId",      
	            type : "post", //어차피 내부 요청이라 주소창에 안 나온다.
	            data : CustomerVO,
	            
	            //응답 관련 세팅
	            dataType : "json",
	            success : function(jsonResult){
	            
	            	var data = jsonResult.data;
	            	console.log(data); //가입 불가면 false, 가입 가능하면 true가 옴
	          
					if(data == false){   	/* 가입 불가 상태*/
	            		$('#checkId').html('이미 존재하는 아이디입니다.');
	            }else{   	/* 가입 가능 상태*/
	            		$('#checkId').html('가입 가능한 아이디입니다.');
	            }
	            	
	            	
	            },
	            error : function(XHR, status, error) {
	            console.error(status + " : " + error);
	            }
					            
	         });//ajax end
		});//keyup event end 아이디 유효성 검사 AJAX end
		
		/*------------------------------------//아이디 유효성 검사//-------------------------------------*/
		
		/*----------------------------------제출 전 가입 폼 입력 확인---------------------------------*/
		
		$('#joinForm').on("submit", function(){
			

			
			var idCheck = $('#checkId').text()//유효성 체크 메세지 확인
			var inputId = $('#inputId').val() //입력된 아이디 체크
			var inputPassword = $('#inputPassword').val() //입력된 비밀번호 체크
			
			if(idCheck == '이미 존재하는 아이디입니다.'){showModal('다른 아이디로 가입해주세요.'); return false;}
			else if(inputPassword.length < 3){ showModal('비밀번호는 3자리 이상부터 가능합니다.'); return false;}
			else if(inputId.length < 3){ showModal('아이디는 3자리 이상부터 가능합니다.'); return false;}
			
			
			return true;
		})
		
		/*----------------------------------//제출 전 가입 폼 입력 확인//---------------------------------*/
		
		
		/*----------모달창 닫는 function-----------*/
		
		$('.modalCheckBtn').on("click", function(){
			
			$('#joinModal').modal('hide');
			$("#text-warning").text("");
		})
		
		/*----------//모달창 닫는 function//-----------*/
		
		
		
	}; //window event end


	
	/*--------------------------------------- modal 메서드 ------------------------------------- */
	
		function showModal(message){
			$("#text-warning").text(message);
			$('#joinModal').css('text-align', 'center');
			$('#joinModal').modal('show');
			
		}
	
	/*---------------------------------------// modal 메서드 //------------------------------------- */
	
