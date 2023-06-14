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
   

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/login.css" type="text/css"> <!-- 초기화 css -->
<script type="text/javascript"  src="${pageContext.request.contextPath}/assets/js/login.js"></script>
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
  <div class="form-container sign-up-container">
    <form action="${pageContext.request.contextPath}/user/login" method = "post">
      <h1>Create Account</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      
      <span>or use your email for registration</span>
      <button type ="submit">로그인</button>
    </form>
      <!--------------------------------// 로그인을 위한 input 영역 //-------------------------------->
      <!--------------------------------// 로그인을 위한 input 영역 //-------------------------------->
    
    
  </div>
  <div class="form-container sign-in-container">
    <form action="${pageContext.request.contextPath}/customer/login" method = "get">
      <h1>로그인</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your account</span>
      <input type="text" placeholder="Id" name = "customerId"/>
      <input type="password" placeholder="Password" name = "customerPassword" />
      <a href="#">비밀번호를 잊어버리셨나요?</a>
      <button type ="submit">로그인</button>
    </form>
  </div>
  
  <!----------------------------- 가입창으로 이동하는 버튼 공간 ----------------------------->
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Welcome Back!</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>저희 사이트가 처음이신가요?</h1>
        <p>회원가입하세요!</p>
        <button class="ghost" id="signUp">회원가입</button>
      </div>
    </div>
  </div>
</div>
  <!-----------------------------// 가입창으로 이동하는 버튼 공간 //----------------------------->



</body>
</html>
