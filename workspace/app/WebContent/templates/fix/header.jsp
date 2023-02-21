<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleag.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header/header.css">
</head>
<body>
<header>
    <div id="header">
        <div id="logo">
            <img src="${pageContext.request.contextPath}/static/images/logo.png">
        </div>
        <div id="category">
            <div class="profile">
                <img src="${pageContext.request.contextPath}/static/images/default-profile.png" width="30">
            </div>
            <div>
                <a href="">로그아웃</a>
            </div>
        </div>
    </div>
</header>
</body>
</html>












