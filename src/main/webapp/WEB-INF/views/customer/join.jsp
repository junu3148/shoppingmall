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
<style>
</style>

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
<!-- java script-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>





</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container"></div>
		<div class="form-container sign-in-container">
			<form action="${pageContext.request.contextPath}/customer/join"
				method="get">
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
				<input type="text" placeholder="name" name="customerName" required /> 
				<input type="password" placeholder="Password" name="customerPassword"  required/>
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
					<h1>이미 아이디가 있으신가요?</h1>
					<p></p>
					<button class="ghost" id="signUp">로그인 페이지로 이동하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-----------------------------// 가입창으로 이동하는 버튼 공간 //----------------------------->


</body>


<!-------------------------------- 아이디 유효성 검사 AJAX로~~ -------------------------------->

<script>
	window.onload = function() {

		console.log('onload 이벤트 발생 체크')
		
		
		
		/*아이디 유효성 검사*/
		
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
		
		
		
		
	}; //window event end
</script>



</html>
