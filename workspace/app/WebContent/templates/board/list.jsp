<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>목록</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board/board.css">
</head>
<body>
    <main id="board">
    	<jsp:include page="../fix/header.jsp"/>
        <section id="board-banner">
            <div><a href="javascript:location.href='${pageContext.request.contextPath}/board/write.board?page=${page}&sort=${sort}&type=${type}&keyword=${keyword}'"><img src="${pageContext.request.contextPath}/static/images/board_banner.png"></a></div>
        </section>
        <section id="info-wrap">
            <article id="info-container">
                <h6 class="info">게시글 목록<br>${total}개</h6>
                <section class="order">
                    <a class="${sort == null or sort == 'recent' ? 'selected' : ''}">최신순</a>
                    <a class="${sort == 'popular' ? 'selected' : ''}">인기순</a>
                </section>
            </article>
            <section id="content-wrap">
                <ul></ul>
                <div id="paging-wrap">
                	<c:if test="${prev}">
	                    <a href="javascript:location.href='/board/listOk.board?page=${startPage - 1}&sort=${sort}&type=${type}&keyword=${keyword}'" class="paging paging-move"><img src="${pageContext.request.contextPath}/static/images/prev.png" width="15px"></a>
                	</c:if>
                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    	<c:choose>
                    		<c:when test="${i eq page}">
			                    <a href="javascript:void(0)" class="paging paging-checked"><c:out value="${i}"/></a>
                    		</c:when>
                    		<c:otherwise>
			                    <a href="javascript:location.href='/board/listOk.board?page=${i}&sort=${sort}&type=${type}&keyword=${keyword}'" class="paging"><c:out value="${i}"/></a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:if test="${next}">
                    	<a href="javascript:location.href='/board/listOk.board?page=${endPage + 1}&sort=${sort}&type=${type}&keyword=${keyword}'" class="paging paging-move"><img src="${pageContext.request.contextPath}/static/images/next.png" width="15px"></a>
                    </c:if>
                    <div></div>
                </div>
            </section>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
	let contextPath = "${pageContext.request.contextPath}";
	let page = `${page}`, type = `${type}` || null, keyword = `${keyword}`, sort = `${sort}`;

	let boards = `${boards}`;
	let files = `${files}`;
</script>
<script src="${pageContext.request.contextPath}/static/js/board/board.js"></script>
<script src="${pageContext.request.contextPath}/static/js/board/list.js"></script>
</html>
















