<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/member.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/term.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/info.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal/modal.css">
    <title>로그인</title>
</head>
<body>
    <main id="login">
        <div class="modal">
            <div class="warn-modal">
                <div id="content-wrap"></div>
            </div>
        </div>
        <section id="login-container">
            <div id="logo">
                <img src="${pageContext.request.contextPath}/static/images/logo.png">
            </div>
            <article>
                <div class="login">
                    <h2 id="title">
                        JSP 로그인
                    </h2>
                    <h5>JSP 아이디로<br>모든 JSP 서비스를 이용할 수 있습니다.</h5>
                </div>
                <form action="${pageContext.request.contextPath}/loginOk.member" name="login" method="post">
                    <div class="login">
                        <div class="info-container info-container-first">
                            <span>
                                <input type="text" id="id" name="memberIdentification" autocomplete="off" placeholder="아이디">
                                <img width="16px">
                            </span>
                            <p class="help"></p>
                        </div>
                        <div class="info-container">
                            <span>
                                <div class="password">
                                    <input type="password" id="password" name="memberPassword" placeholder="비밀번호">
                                    <img width="16px">
                                    <p class="help"></p>
                                </div>
                            </span>
                        </div>
                        <div>
                            <div id="check-save-id">
                                <label class="check-save-id-wrap">
                                    <section>
                                        <input type="checkbox" name="auto-login" value="true">
                                        <span class="checkbox">
                                            <img src="${pageContext.request.contextPath}/static/images/check_all.png" width="15px">
                                        </span>
                                        <p class="h5">로그인 상태 유지</p>
                                    </section>
                                </label>
                            </div>
                        </div>
                        <button type="button" class="login" onclick="send()">로그인</button>
                        <button type="button" class="join" onclick="location.href='${pageContext.request.contextPath}/join.member'">회원가입</button>
                    </div>
                </form>
            </article>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/member/login.js"></script>
<script src="${pageContext.request.contextPath}/static/js/modal/modal.js"></script>
</html>
<c:if test="${not empty param.login}">
	<script>
		showWarnModal("아이디 또는 비밀번호를<br>확인해주세요");
	</script>
</c:if>	








