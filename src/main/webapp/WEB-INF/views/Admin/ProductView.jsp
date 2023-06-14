
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>제품 수정 페이지?</title>
    <!--부트 스트랩 코드-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  </head>
  <body>
    <!--부트 스트랩 코드-->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
      <!--js 코드-->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
      <!-- Top Nav Bar  include로 뺄 예정임-->
      <div name = "top bar">
      <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><b>Manager Page</b></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/productView">Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/customerView">Customer</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/salesView">Sales</a>
              </li>
            </ul>
            <span class="navbar-text">
              안녕하세요! 000님  <a class="btn btn-secondary disabled" role="button" aria-disabled="true" href="${pageContext.request.contextPath}/logout">Logout</a>
            </span>
          </div>
        </div>
    </nav>
</div>
    <!--Top Nav Bar End-->

    <div class="p-3 mb-2 bg-body text-body">    <!--배경색 start-->
        <br>

        
        <div align ="center" style ="margin: 5%;">
            <h1 class="display-6"><b>Product Management Page</b></h1><br><hr><br>

            <!--키워드 검색 폼-->
            <form action="${pageContext.request.contextPath}/search">
            <table>
                <tr>
                    <td> 
                        <select name="searchOption" class="form-select" >
                            <option>선택</option>
                            <option value="productName">제품명</option>
                            <option value="productId">제품코드</option>
                        </select>
                    </td>
                    <td>
                        : <input type="text" name="keyword" /> <button type="submit" class="btn btn-secondary">Search</button>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/ProductInsertForm" role="button">Insert</a>
                    </td>
                </tr>

            </table>
        </form><!-- 검색어 마지막-->
    <br>
            <!--금액대별 검색폼-->
            <form action = "/Shoppingmall/searchPrice" method ="GET">
                <table style="margin: 0 auto; width: 90%;">
                    <tr align="center">
                        <!--
                        <td>가격대 검색 : <input type ="number">원 ~ <input type="number">원</td>
                        <td><button type = "submit">조회</button></td>
                        -->
                        <td>
                    <input type="range" min="10000" max="100000" value="0" step="1000" onchange="updateMinRange(this.value)" style="width:20%">
                    <input type="number" min="0" max="100000" step="1" id="minRangeInput" step="1000" name = "minPrice" value = 0 onchange="updateMinRange(this.value)">
                    원 ~
                    <input type="range" min="10000" max="2000000"  step="1000" value="0" onchange="updateMaxRange(this.value)" style="width:20%">
                    <input type="number" min="10000" max="2000000" step="1" id="maxRangeInput" name = "maxPrice" style="width:12.5%" value = 0 onchange="updateMaxRange(this.value)">원 
                    <button type ="submit" class="btn btn-secondary">Search</button>
                </td>
                    </tr>
                </table>
            </form>
            <!--금액대별 검색 end-->


            <bR>
                <div>
                <table  class="table table-striped" >
                    <tr >
                        <td style="width: 20%; text-align: center;">제품코드</td>
                        <td style="width: 30%; text-align: center;">제품명</td>
                        <td style="width: 10%; text-align: center;">개수</td>
                        <td style="width: 30%; text-align: center;">가격</td>
                        <td style="width: 10%; text-align: center;"></td>
                    </tr>
                    <c:forEach items="${productList}" var="product">
                        <tr>
                            <td style="width: 20%; text-align: center;">${product.productNo}</td>
                            <td style="width: 30%; text-align: center;">${product.productName}</td>
                            <td style="width: 10%; text-align: center;">${product.productEa}</td>
                            <td style="width: 30%; text-align: center;"><fmt:formatNumber
                               value="${product.price}" pattern="#,##0원" /></td>
                            <td style="width: 10%; text-align: center;"><a href="${pageContext.request.contextPath}/updateForm/${product.productNo}" class="btn btn-primary">수정</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>










    </div><!--배경색 end-->






    <script>
        function updateMinRange(value) {
          document.getElementById("minRangeInput").value = value;
        }
        function updateMaxRange(value) {
          document.getElementById("maxRangeInput").value = value;
        }

        </script>
  </body>
</html>