
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    #topbar {
        width: 100%;
        height: 25px;
        background-color: black;
    }

    #content {
        display: flex;
    }

    #sidebar-content {
        width: 15%;
        height: 100dvh;
        background-color: lightgray;
        padding: 10px;
    }

    #form-content {
        width: 80%;
        padding: 10px;
    }
    a{
        text-decoration: none;
        color: purple; 
    }

</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
</head>
<body>
    <div id="topbar"></div>
    <div id="content">
        <div id="sidebar-content">
            <div style="float:inline-end; text-align: center; height: 90%;" >
                <br>
                <a href="./productView">제품 관리</a>
                <br>
                <a href="./customerView">고객 관리</a>
            </div>
        </div>
        <div id="form-content">







        </div>
    </div>
</body>
</html>