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
                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/update.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}&boardId=${board.boardId}'" class="update">수정</a>
                    <a href="javascript:location.href='${pageContext.request.contextPath}/board/deleteOk.board?page=${page}&sort=${sort}&type=${empty type ? 'null' : type}&keyword=${keyword}&boardId=${board.boardId}'" class="delete">삭제</a>
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
                <textarea id="" cols="30" rows="1" placeholder="내 댓글"></textarea>
                <button>작성완료</button>
            </section>
            <h5 id="content">
               	${board.boardContent}
            </h5>
            <section id="replies-wrap">
                <ul>
                    <li>
                    	<h4 class="title">
                    		댓글이 없습니다.
                    	</h4>
                    </li>
                </ul>
            </section>
            <div>
            	<c:forEach var="file" items="${files}">
            		<a href="${pageContext.request.contextPath}/file/download.file?fileSystemName=${file.fileSystemName}&fileOriginalName=${file.fileOriginalName}">
                		<img src="${pageContext.request.contextPath}/upload/${file.fileSystemName}" width="100%" class="file-list">
                	</a>
                </c:forEach>
            </div>
            <%-- <section id="replies-wrap">
                <ul>
                    <li>
                        <div>
                            <section class="content-container">
                                <div class="profile">
                                    <div><img src="${pageContext.request.contextPath}/static/images/reply_profile.png" width="15px"></div>
                                    <h6 class="writer">홍길동</h6>
                                </div>
                                <h4 class="title">
                                    위키백과 가져옴~<br><br>
                                    REST(Representational State Transfer)는 월드 와이드 웹과 같은 분산 하이퍼미디어 시스템을 위한 소프트웨어 아키텍처의 한
                                    형식이다. 이 용어는 로이 필딩(Roy Fielding)의 2000년 박사학위 논문에서 소개되었다. 필딩은 HTTP의 주요 저자 중 한 사람이다. 이
                                    개념은 네트워킹 문화에 널리 퍼졌다.<br>
                                    엄격한 의미로 REST는 네트워크 아키텍처 원리의 모음이다. 여기서 '네트워크 아키텍처 원리'란 자원을 정의하고 자원에 대한 주소를 지정하는 방법
                                    전반을 일컫는다. 간단한 의미로는, 웹 상의 자료를 HTTP위에서 SOAP이나 쿠키를 통한 세션 트랙킹 같은 별도의 전송 계층 없이 전송하기 위한 아주
                                    간단한 인터페이스를 말한다.<br>
                                    이 두 가지의 의미는 겹치는 부분과 충돌되는 부분이 있다. 필딩의 REST 아키텍처 형식을 따르면 HTTP나 WWW가 아닌 아주 커다란 소프트웨어
                                    시스템을 설계하는 것도 가능하다. 또한, 리모트 프로시저 콜 대신에 간단한 XML과 HTTP 인터페이스를 이용해 설계하는 것도 가능하다.<br>
                                    필딩의 REST 원리를 따르는 시스템은 종종 RESTful이란 용어로 지칭된다. 열정적인 REST 옹호자들은 스스로를 RESTafrians 이라고
                                    부른다.
                                </h4>
                                <h6 clss="board-info">
                                    <span class="date">방금 전</span>
                                </h6>
                            </section>
                        </div>
                    </li>
                    <li>
                        <div>
                            <section class="content-container">
                                <div class="profile">
                                    <div><img src="${pageContext.request.contextPath}/static/images/reply_profile.png" width="15px"></div>
                                    <h6 class="writer">홍길동</h6>
                                </div>
                                <h4 class="title">@RestController 때려놓으면 ViewResolver 사용 못함</h4>
                                <h6 clss="board-info">
                                    <span class="date">1일 전</span>
                                </h6>
                            </section>
                        </div>
                    </li>
                    <li>
                        <div>
                            <section class="content-container">
                                <div class="profile">
                                    <div><img src="${pageContext.request.contextPath}/static/images/reply_profile.png" width="15px"></div>
                                    <h6 class="writer">홍길동</h6>
                                </div>
                                <h4 class="title">어노테이션 하나씩 구글링 해보셈</h4>
                                <section class="reply-update-wrap">
                                    <textarea id="" cols="30" rows="1" placeholder="내 댓글"></textarea>
                                    <div class="button-wrap">
                                        <button class="update-done">작성완료</button>
                                        <button class="calcel">취소</button>
                                    </div>
                                </section>
                                <h6 clss="board-info">
                                    <span class="date">2일 전</span>
                                    <span class="date">·</span>
                                    <span class="update">수정</span>
                                    <span class="date">·</span>
                                    <span class="delete">삭제</span>
                                </h6>
                            </section>
                        </div>
                    </li>
                    <li>
                        <div>
                            <section class="content-container">
                                <div class="profile">
                                    <div><img src="${pageContext.request.contextPath}/static/images/reply_profile.png" width="15px"></div>
                                    <h6 class="writer">홍길동</h6>
                                </div>
                                <h4 class="title">
                                    REST가 Representational State Transfer 축약어인데 페이지 요청보다는 데이터 요청에 가깝다고 생각하면 됨.
                                </h4>
                                <h6 clss="board-info">
                                    <span class="date">3일 전</span>
                                </h6>
                            </section>
                        </div>
                    </li>
                    <li>
                        <div>
                            <section class="content-container">
                                <div class="profile">
                                    <div><img src="${pageContext.request.contextPath}/static/images/reply_profile.png" width="15px"></div>
                                    <h6 class="writer">홍길동</h6>
                                </div>
                                <h4 class="title">REST 어렵긴 하지..</h4>
                                <h6 clss="board-info">
                                    <span class="date">6일 전</span>
                                </h6>
                            </section>
                        </div>
                    </li>
                </ul>
            </section> --%>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
	let contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/static/js/board/board.js"></script>

</html>