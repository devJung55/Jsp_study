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
        <div id="search">
            <div class="search-wrap">
                <form action="${pageContext.request.contextPath}/board/listOk.board" name="search-form">
			        <div>
			        	<select name="type">
			        		<option value="title&content&writer" ${type=='null' or type=='title&content&writer' ? 'selected' : '' }>전체</option>
			        		<option value="title" ${type=='title' ? 'selected': ''}>제목</option>
			        		<option value="content" ${type=='content' ? 'selected': ''}>내용</option>
			        		<option value="writer" ${type=='writer' ? 'selected': ''}>작성자</option>
			        		<option value="content&writer" ${type=='content&writer' ? 'selected': ''}>내용 또는 작성자</option>
			        	</select>
			        </div>
                    <div class="search-container">
                        <input type="text" autocomplete="off" name="keyword" value="${keyword}">
                        <button type="submit" onclick=""><img src="${pageContext.request.contextPath}/static/images/search.png"
                                width="20px"></button>
                    </div>
                </form>
            </div>
        </div>
        <div id="category">
            <div class="profile">
                <img src="${pageContext.request.contextPath}/static/images/default-profile.png" width="30">
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/logout.member">로그아웃</a>
            </div>
        </div>
    </div>
</header>
</body>
</html>












