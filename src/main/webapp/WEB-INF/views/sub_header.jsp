<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en" class="vlt-is--custom-cursor">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <!-- 반응형 (기기 해상도별)-->
  <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0, user-scalable=yes">

  <title>The value of together</title>

<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 스크롤시 fixed -->
<script src="../js/autofix.js"></script>

<!-- fullfage -->
<script src="../js/fullpage.min.js"></script>
<link rel="stylesheet" href="./js/fullpage.min.css">

<!-- 숫자 카운터 counterUp -->
<script src="../js/jquery.counterup.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.5/waypoints.min.js"></script>

<!-- swiper -->
<script src="../js/swiper.min.js"></script>
<link rel="stylesheet" href="../js/swiper.min.css">

<link rel="stylesheet" href="../css/style.css">

<!-- 모바일 -->
<link rel="stylesheet" media="screen and (max-width: 480px)" href="./css/480.css">

<!-- 태블릿 세로--> 
<link rel="stylesheet" media="screen and (min-width: 481px) and (max-width: 720px)" href="./css/720.css">

<!-- 태블릿 가로-->
<link rel="stylesheet" media="screen and (min-width: 721px) and (max-width: 1024px)" href="./css/1024.css">
<!-- PC -->
<link rel="stylesheet" media="screen and (min-width: 1025px)" href="./css/pc.css">

</head>

<body>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

<!-- 콘텐츠 시작 -->
<div class="header" data-aos="fade-down" data-aos-delay="300">
	<!-- 로고, 메뉴 -->
	<div class="header-box">
		<h1><a href="/"><span>가치 코딩 .</span></a></h1>

		<div class="cursor">
		</div>

		<div class="tnb">
         <ul>
            <!--tnb-->
			<li><a href="#"><c:out value="${session.me_nickName}"/></a></li>
			<!-- 로그인이 된 경우 -->
			<c:if test="${not empty session}">
				<li><a href="<c:url value='/member/actionLogout.do'/>">로그아웃</a></li>
				<li><a href="<c:url value='/member/mypage'/>">마이페이지</a></li>
			</c:if>
			<!-- 로그인이 안된 경우 -->
			<c:if test="${empty session}">
				<li><a href="<c:url value='/member/login'/>">로그인</a></li>
				<li><a href="<c:url value='/member/join'/>">회원가입</a></li>
			</c:if>
         </ul>
      </div>

      <div class="gnb">
         <ul>
            <li><a href="#">ABOUT</a></li>
            <li><a href="#">가치 코딩</a>
               <ul class="sub-gnb">
                  <li><a href="#">언어</a></li>
                  <li><a href="#">DATABASE</a></li>
                  <li><a href="#">데이터 과학</a></li>
                  <li><a href="#">개발도구</a></li>
                  <li><a href="#">프로젝트 관리</a></li>
               </ul>
            </li>
            <li><a href="#">커뮤니티</a>
               <ul class="sub-gnb">
                  <li><a href="#">일상</a></li>
                  <li><a href="#">프로젝트</a></li>
                  <li><a href="#">책/강의/프로그램</a></li>
                  <li><a href="#">스터디</a></li>
               </ul>
            </li>
            <li><a href="#">코딩 테스트</a></li>
            <li><a href="#">CONTACT</a></li>
         </ul>

		</div>
	</div>
</div>
