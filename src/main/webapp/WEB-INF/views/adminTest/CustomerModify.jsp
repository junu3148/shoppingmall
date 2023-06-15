<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>portfolio</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sub.css"
	type="text/css">
<!-- 서브 css -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 최신버전 js -->
<script type="${pageContext.request.contextPath}/assets/text/javascript"
	src="js/script3.js"></script>
<!-- js -->


<style>
@import url("https://fonts.googleapis.com/css?family=Fira+Sans");

html,body {

  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: "Fira Sans", Helvetica, Arial, sans-serif;
}

.form-structor {
  background-color: whitesmoke;
  border-radius: 15px;
  height: 550px;
  width: 350px;
  position: relative;
  overflow: hidden;
  }
 
  .form-input{ 
    text-align: center;
    margin-top: 20%;
  }

  .customer-img{
    width: 30%;
  }

  .customer-info{
    margin-top: 10%;
  }
table{ 
  text-align: center;
  margin: 10%;
  width: 80%;
  line-height: 2.5;
}
tr{margin: 10%}
td{padding: 10%;}
.modify-btn{ margin-top: 5%;}

.form-structor{
text-align: center;
margin-top: 0%;
margin-bottom: 20%;
margin-left: auto;
margin-right: auto;
}
input{
	border: none;
}

</style>

</head>

<body>


	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->


	<main id="pd_detail">

		<section class="detail_wrap clear">
				<div>

					<!-- modifyform -->



	  

  <div class="form-structor">
    <div class ="form-input">
        <img class = "customer-img" src ="https://cdn-icons-png.flaticon.com/512/666/666201.png" >
        <div class = "customer-info">
          <p> 안녕하세요 회원님!</p>
         	<p> ${Message} </p>
          <form action ="${pageContext.request.contextPath}/customer/modify" method = "get" id ="modify-button">
          <table>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>이름 :</td>
            	<td>${customer.customerName}</td>
            </tr>
            <tr>
                <td>아이디 :</td>
                <td>${customer.customerId}</td>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type ="password" name ="customerPassword" id ="inputPassword"></td>
            </tr>
          </table>
        	<input type ="hidden" name = "customerNo" value = "${customer.customerNo}" >
          <button type ="submit" class ="modify-btn btn btn-primary">수정하기</button>
          </form>
        </div>
    </div>

	
	
	
	




					<!-- modifyform end-->
				</div>
			</div>
		</section>






		<!-- 탑버튼 -->
		<a href="#none" class="top_btn"><img
			src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
			alt=""></a>
		<!-- /탑버튼 -->

	</main>




</body>
<script>
	$('#modify-button').on("submit", function(){
		
		
		var inputPassword = $('#inputPassword').val()
		
		if(inputPassword.length <4){
			alert('비밀번호는 4자리 이상이어야 합니다.')
			return false;
		}
		return true;
	})
	
</script>


</html>










