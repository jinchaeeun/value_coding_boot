<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

    <div class="mypage">
        <h2><span style="color: #1d3a6d;"><c:out value="${session.me_nickName}"/></span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu on"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu"><a href="#">답변</a></li>
            </ul>

            <div class="mypage-con">
                <div class="left-dash">
                    <ul class="mymy">
                        <li><img src="https://clubsports.gcu.edu/wp-content/uploads/Coach-Avator.png" alt="" width="100px;"></li>
                        <li class="mypage_nick"><b><c:out value="${session.me_nickName}"/></b> Lv.2</li>
                        <li><c:out value="${session.me_devLang}"/></li>
                        <li><c:out value="${session.me_regDate}"/></li>
                    </ul>
                </div>
                <div class="right-dash">
                    <ul class="activity">
                        <li class="myPost">
                            <div class="activity-title">총 게시물</div>
                            <div class="activity-con"><c:out value="${MyPostCnt}"/></div>
                        </li>
                        <li class="myPost">
                            <div class="activity-title">총 댓글</div>
                            <div class="activity-con"><c:out value="${MyCommentCnt}"/></div>    
                        </li>
                        <li class="myPost">
                            <div class="activity-title">총 방문 수</div>
                            <div class="activity-con">5</div>     
                        </li>
                    </ul>
                    
                </div>


                    
            </div>
        </div>
    </div>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>