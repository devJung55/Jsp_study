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
    <title>회원가입</title>
</head>
<body>
    <main id="join">
        <div class="modal">
            <div class="warn-modal">
                <div id="content-wrap"></div>
            </div>
        </div>
        <section id="join-container">
            <div id="logo">
                <div id="back">
                    <img src="${pageContext.request.contextPath}${pageContext.request.contextPath}/static/images/back.png">
                </div>
                <img src="${pageContext.request.contextPath}${pageContext.request.contextPath}/static/images/logo.png">
            </div>
            <article>
                <div class="term">
                    <h3 id="title">
                        스프링부트 가입을 시작합니다
                    </h3>
                    <h5>스프링부트 회원이 되면 커뮤니티, 댓글, 검색, 첨부 파일 모두 이용할 수 있습니다.</h5>
                    <h5>
                        스프링부트에 회원으로 이미 등록되어 있다면<br>
                        <span>
                            <a href="javascript:location.href='${pageContext.request.contextPath}/login.member'">로그인</a>을 통해 서비스를 이용해주세요.
                        </span>
                    </h5>
                </div>
                <div class="info">
                    <h3 id="title">
                        기본 정보를 입력해주세요
                    </h3>
                    <h5>정확한 정보를 입력해야 정상적으로 서비스를 이용할 수 있습니다. 부정확한 정보를 입력하여 발생된 피해에 대해서는 스프링부트에 어떠한 책임도 없습니다. </h5>
                </div>
                <div class="join">
                    <h3 id="title">
                        회원 정보 입력 후, 가입을 완료해주세요!
                    </h3>
                </div>
                <form action="${pageContext.request.contextPath}/joinOk.member" name="join" method="post">
                    <div class="term">
                        <div id="check-all-wrap">
                            <label class="checkbox-all-wrap">
                                <section>
                                    <input type="checkbox" name="checkAll">
                                    <span class="checkbox">
                                        <img src="${pageContext.request.contextPath}/static/images/check_all.png" width="15px">
                                    </span>
                                    <p class="h5">전체 동의</p>
                                </section>
                            </label>
                        </div>
                        <ul>
                            <h6>서비스 이용을 위해 동의가 필요합니다.</h6>
                            <li>
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check" class="required">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">[필수] 이용약관 동의</p>
                                        </section>
                                    </label>
                                </div>
                                <button type="button" class="term-detail">
                                    <img src="${pageContext.request.contextPath}/static/images/term_detail.png" width="25px">
                                </button>
                            </li>
                            <li>
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check" class="required">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">[필수] 개인정보 수집 이용 동의</p>
                                        </section>
                                    </label>
                                </div>
                                <button type="button" class="term-detail">
                                    <img src="${pageContext.request.contextPath}/static/images/term_detail.png" width="25px">
                                </button>
                            </li>
                        </ul>
                        <hr class="line">
                        <ul>
                            <h6>특별한 혜택과 최신 소식을 받아보세요!</h6>
                            <li>
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check" id="enable">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">[선택] 서비스/이벤트 정보 제공을 위한 개인정보 수집 이용 동의</p>
                                        </section>
                                    </label>
                                </div>
                                <button type="button" class="term-detail">
                                    <img src="${pageContext.request.contextPath}/static/images/term_detail.png" width="25px">
                                </button>
                            </li>
                            <li class="options options-title disable">
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">[선택] 광고성 정보 수신 동의</p>
                                        </section>
                                    </label>
                                </div>
                                <button type="button" class="term-detail">
                                    <img src="${pageContext.request.contextPath}/static/images/term_detail.png" width="25px">
                                </button>
                            </li>
                            <li class="options options-list disable">
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">SMS</p>
                                        </section>
                                    </label>
                                </div>
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">이메일</p>
                                        </section>
                                    </label>
                                </div>
                                <div>
                                    <label class="checkbox-wrap">
                                        <section>
                                            <input type="checkbox" name="check">
                                            <span class="checkbox">
                                                <img src="${pageContext.request.contextPath}/static/images/check.png" width="15px">
                                            </span>
                                            <p class="h6">전화</p>
                                        </section>
                                    </label>
                                </div>
                            </li>
                        </ul>
                        <p class="ad-content">스프링부트가 제공하는 서비스의 광고성 정보를 수신합니다.</p>
                        <button type="button" class="next" onclick="goInfo()">다음</button>
                    </div>
                    <div class="info">
                        <div class="info-container">
                            <label>이름</label>
                            <span>
                                <input type="text" id="name" name="memberName" autocomplete="off" placeholder="영문 혹은 한글, 2~20자">
                                <img width="16px">
                            </span>
                            <p class="help"></p>
                        </div>
                        <div class="info-container">
                            <label>생년월일</label>
                            <span>
                                <input type="text" id="birth" name="memberBirth" autocomplete="off" placeholder="예) 19990101">
                                <img width="16px">
                            </span>
                            <p class="help"></p>
                        </div>
                        <div class="info-container">
                            <label>휴대폰 번호</label>
                            <span>
                                <input type="text" id="phone" name="memberPhone" autocomplete="off" placeholder="예) 01000000000">
                                <img width="16px">
                            </span>
                            <p class="help"></p>
                        </div>
                        <button type="button" class="next" onclick="goJoin()">다음</button>
                    </div>
                    <div class="join">
                        <div class="basic-info-container">
                            <h3>기본 정보</h3>
                            <dl>
                                <dt>이름</dt>
                                <dd></dd>
                                <dt>생년월일</dt>
                                <dd></dd>
                                <dt>휴대폰 번호</dt>
                                <dd></dd>
                            </dl>
                        </div>
                        <div class="info-container info-container-first">
                            <label>아이디</label>
                            <span>
                                <input type="text" id="id" name="memberIdentification" autocomplete="off" placeholder="영문 혹은 영문+숫자, 4~20자">
                                <img width="16px">
                            </span>
                            <p class="help"></p>
                        </div>
                        <div class="info-container">
                            <label>비밀번호</label>
                            <span>
                                <div class="password">
                                    <input type="password" id="password" name="memberPassword" placeholder="영어, 숫자, 특수문자 중 2가지 이상 10~20자">
                                    <img width="16px">
                                    <p class="help"></p>
                                </div>
                                <div class="password password-check">
                                    <input type="password" id="password-check" placeholder="비밀번호 재입력">
                                    <img width="16px">
                                    <p class="help"></p>
                                </div>
                            </span>
                        </div>
                        <div class="info-container">
                            <label>이메일</label>
                            <span>
                                <div class="email-wrap">
                                    <div class="email-first">
                                        <input type="text" autocomplete="off" placeholder="이메일 앞자리">
                                        <img width="16px">
                                    </div>
                                    <span id="seperator">@</span>
                                    <div class="email-last">
                                        <input type="text" autocomplete="off" placeholder="이메일 뒷자리">
                                        <img width="16px">
                                    </div>
                                    <input type="hidden" name="memberEmail">
                                </div>
                            </span>
                            <p class="help"></p>
                            <div class="email-select-wrap">
                                <select class="email">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                </select>
                                <img src="${pageContext.request.contextPath}/static/images/select.png" width="16px" style="display: inline-block;">
                            </div>
                            <h6 class="help">
                                <img src="${pageContext.request.contextPath}/static/images/warn.png" id="warn" width="16px" height="16px">
                                이메일로 비밀번호 변경 링크 등이 발송됩니다. 개인정보 보호를 위해 정확한 메일 정보를 입력해주세요.
                            </h6>
                        </div>
                        <button type="button" class="next" onclick="send()">완료</button>
                    </div>
                </form>
            </article>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>let contextPath = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/static/js/member/check.js"></script>
<script src="${pageContext.request.contextPath}/static/js/modal/modal.js"></script>
<script src="${pageContext.request.contextPath}/static/js/member/join.js"></script>
</html>