<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!doctype html>
<html lang="ko">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>join, login</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/login.css"
	type="text/css">
<!-- 초기화 css -->
<!-- 아이콘 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
	rel="stylesheet" />
<!-- jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>




</head>
<body>



	<div class="container" id="container">
		<div class="form-container sign-up-container"></div>
		<div class="form-container sign-in-container">
			<form action="${pageContext.request.contextPath}/customer/join"
				method="get" id = "joinForm">
				<h1>회원가입</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>

				<!------------------------------- 인풋 영역 ---------------------------------------->
				<!-- 아이디 유효성 체크 html 요소 -->
				<span id = "checkId"></span>
				<input type="text" placeholder="Id"id="inputId" name="customerId" required> 
				<input type="text" placeholder="name" id = "" name="customerName" required /> 
				<input type="password" id="inputPassword" placeholder="Password" name="customerPassword"  required/>
				<a href="#"></a>
				<button type="submit">회원가입</button>
			</form>
		</div>

		<!-------------------------------//인풋 영역//---------------------------------------->

		<!----------------------------- 가입창으로 이동하는 버튼 공간 ----------------------------->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>회원이신가요?</h1>
					<p>지금 바로 로그인하세요!</p>
					<a class="btn btn-outline-light btn-lg " href="${pageContext.request.contextPath}/customer/loginPage"> 로그인 페이지로 이동하기 </a>
				</div>
			</div>
		</div>
	</div>
	<!-----------------------------// 가입창으로 이동하는 버튼 공간 //----------------------------->


	
	<!------------------------------------// 모달창 양식 //-------------------------------------->


<div id="joinModal" class="modal">
     <div class="modal-dialog">
          <div class="modal-content">
               <div class="modal-header">
                    <h4 class="modal-title">Notice</h4>
               </div>
               <div class="modal-body">
               <br>
                    <p id = "text-warning">알림</p>
               </div>
               <div class="modal-footer">
                    <button type="button" class="btn btn-primary modalCheckBtn">확인</button>
               </div>
          </div>
     </div>
</div>




</body>


<!-------------------------------- 아이디 유효성 검사 AJAX로~~ -------------------------------->

<script>
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
	
	
	</script>



</html>
