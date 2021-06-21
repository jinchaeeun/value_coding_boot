<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

<div class="mypage-box">
	<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
			<ul class="mypage-tap">
				<li class="mypage-tapmenu" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
				<li class="mypage-tapmenu on" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
			</ul>
		
		
	<div class="mypage-form">	
		<span>닉네임  <c:out value="${session.me_nickName}"/> | Lv.2</span> 
		<span>선호 언어 <c:out value="${session.me_devLang}"/> </span> 
		<span>총 게시물  <c:out value="${MyPostCnt}"/> </span>
		<span>총 댓글	<c:out value="${MyCommentCnt}"/> </span>
		<span>총 방문일 2</span>
	 <!-- <span>가입 날짜</span> <c:out value="${session.me_regDate}"/> -->

    </div>
    
</div>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>