<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board/board.css">
</head>

<body>
    <main id="board">
        <jsp:include page="../fix/header.jsp"/>
        <section id="board-banner">
            <div><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/static/images/board_banner.png"></a></div>
        </section>
        <section id="info-wrap">
            <article id="info-container">
                <h6 class="info">게시글 상세보기</h6>
                <section class="move-page">
                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/listOk.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}'">목록으로</a>
                    <c:if test="${sessionScope.memberId eq board.memberId}">
	                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/update.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}&boardId=${board.boardId}'" class="update">수정</a>
	                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/deleteOk.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}&boardId=${board.boardId}'" class="delete">삭제</a>
                    </c:if>
                </section>
            </article>
            <section id="detail-title">
                <h2>${board.boardTitle}</h2>
            </section>
            <section id="detail-info">
                <div class="profile">
                    <div><img src="${pageContext.request.contextPath}/static/images/profile.png" width="15px"></div>
                    <h6 class="writer">${board.memberName}</h6>
                </div>
                <hr>
                <h6 id="detail-read-count">조회 ${board.boardReadCount}</h6>
                <hr>
                <h6 id="show-reply"><a href="javascript:showReply()">댓글 달기</a></h6>
            </section>
            <section id="reply-write-wrap">
                <div class="profile">
                    <div><img src="${pageContext.request.contextPath}/static/images/profile.png" width="15px"></div>
                    <h6 class="writer">${board.memberName}</h6>
                </div>
                <textarea cols="30" rows="1" placeholder="내 댓글" name="replyContent"></textarea>
                <button id="write-ok">작성완료</button>
            </section>
            <h5 id="content">
               	${board.boardContent}
            </h5>
            <section id="replies-wrap">
	            <div class="logo-area">
					<img src="${pageContext.request.contextPath}/static/images/dimmed-reply.png" class="infinite_rotating_logo" width="48">
				</div>
                <ul></ul>
                <button type="button" id="more-replies">
                	<div>더보기</div>
                	<div><img src="${pageContext.request.contextPath}/static/images/plus.png" width="24"></div>
                </button>
            </section>
            <div>
            	<c:forEach var="file" items="${files}">
            		<a href="${pageContext.request.contextPath}/file/download.file?fileSystemName=${file.fileSystemName}&fileOriginalName=${file.fileOriginalName}">
                		<img src="${pageContext.request.contextPath}/upload/${file.fileSystemName}" width="100%" class="file-list">
                	</a>
                </c:forEach>
            </div>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
	let contextPath = "${pageContext.request.contextPath}";
	let boardId = "${board.boardId}";
	let memberId = "${sessionScope.memberId}";
</script>
<script src="${pageContext.request.contextPath}/static/js/board/board.js"></script>
<script src="${pageContext.request.contextPath}/static/js/board/reply.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/js/board/reply-scroll.js"></script> --%>
</html>