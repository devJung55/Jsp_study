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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board/board.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal/modal.css">
    <title>수정하기</title>
</head>

<body>
    <main id="board">
        <div class="modal">
            <div class="warn-modal">
                <div id="content-wrap"></div>
            </div>
        </div>
        <jsp:include page="../fix/header.jsp"/>
        <section id="info-wrap">
            <article id="info-container">
                <h6 class="info">게시글 수정하기</h6>
                <section class="order">
                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/listOk.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}'">목록으로</a>
                </section>
            </article>
            <form action="${pageContext.request.contextPath}/board/updateOk.board" name="writeForm" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="boardId" value="${board.boardId}">
                <legend>
                    <h3>
                        게시글을 <span class="text-accent2">바른말</span>로 <span class="text-accent1">이쁘게</span> 작성해보세요
                    </h3>
                </legend>
                <div id="write-title-wrap" class="wrap">
                    <div class="profile write-profile">
                        <div><img src="${pageContext.request.contextPath}/static/images/profile.png" width="15px"></div>
                        <h6 class="writer">${memberName}</h6>
                    </div>
                    <label>제목</label>
                </div>
                <span class="title area">
                    <textarea rows="1" name="boardTitle" placeholder="멋진 제목을 작성해보세요.">${board.boardTitle}</textarea>
                    <div class="textarea-count">0/30</div>
                </span>
                <div id="write-content-wrap" class="wrap">
                    <label>내용</label>
                </div>
                <span class="content area">
                    <textarea rows="3" name="boardContent" placeholder="여러분의 글솜씨를 보여주세요.">${board.boardContent}</textarea>
                    <div class="textarea-count">0/5,000</div>
                </span>
                <div class="attach-wrap">
                    <label for="upload1" class="attach">
                        <img src="" class="thumbnail">
                        <div class="x">
                            <img src="${pageContext.request.contextPath}/static/images/x.png">
                        </div>
                        <h6 class="plus">+</h6>
                        <h6>대표 이미지</h6>
                    </label>
                    <label for="upload2" class="attach">
                        <img src="" class="thumbnail">
                        <div class="x">
                            <img src="${pageContext.request.contextPath}/static/images/x.png">
                        </div>
                        <h6 class="plus">+</h6>
                        <h6>이미지 추가</h6>
                    </label>
                    <label for="upload3" class="attach">
                        <img src="" class="thumbnail">
                        <div class="x">
                            <img src="${pageContext.request.contextPath}/static/images/x.png">
                        </div>
                        <h6 class="plus">+</h6>
                        <h6>이미지 추가</h6>
                    </label>
                    <label for="upload4" class="attach">
                        <img src="" class="thumbnail">
                        <div class="x">
                            <img src="${pageContext.request.contextPath}/static/images/x.png">
                        </div>
                        <h6 class="plus">+</h6>
                        <h6>이미지 추가</h6>
                    </label>
                </div>
                <input type="file" id="upload1" class="upload" name="upload1" style="display: none;">
                <input type="file" id="upload2" class="upload" name="upload2" style="display: none;">
                <input type="file" id="upload3" class="upload" name="upload3" style="display: none;">
                <input type="file" id="upload4" class="upload" name="upload4" style="display: none;">
                <article class="warn-wrap">
                    <h5 class="warn-title">게시글을 등록하기 전에 확인해주세요!</h5>
                    <ul>
                        <li>게시글 목록에서는 <span class="text-accent1">대표 이미지만 나타나요.</span></li>
                        <li>등록한 게시글은 모든 이용자가 볼 수 있으며, <span class="text-accent1">댓글은 작성자만 삭제할 수 있어요.</span></li>
                        <li>본인이 등록한 게시글은 언제든지 수정 및 삭제가 가능해요.</li>
                        <li>
                            이런 게시글은 본인의 의사와 상관없이 삭제될 수 있어요.
                            <ul class="inner">
                                <li>비속어와 상대방을 비방하는 내용이 있는 경우</li>
                                <li>광고 및 홍보 내용이 있는 경우</li>
                                <li>정치적인 내용이 있는 경우</li>
                            </ul>
                        </li>
                        <li>제목이 길면, 직접 작성한 제목과 다르게 올라갈 수 있어요.</li>
                        <li>게시글 내용을 스프링부트 마케팅 및 광고 목적으로 활용하는 것에 동의합니다.</li>
                        <li>스프링부트는 게시글 내용에 대한 법률적 책임이 없습니다.</li>
                    </ul>
                </article>
                <div id="check-agree">
                    <label class="check-agree-wrap">
                        <section>
                            <input type="checkbox" name="agree">
                            <span class="checkbox">
                                <img src="${pageContext.request.contextPath}/static/images/check_all.png" width="15px">
                            </span>
                            <p class="h5">유의사항을 모두 확인했으며, 동의합니다.</p>
                        </section>
                    </label>
                </div>
                <button>수정 완료</button>
            </form>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/modal/modal.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/board/board.js"></script>
</html>