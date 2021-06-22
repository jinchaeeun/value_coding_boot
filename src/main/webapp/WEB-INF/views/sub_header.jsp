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

		<link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="../css/bootstrap.min.css">

		<!-- 스크롤시 fixed -->
		<script src="../js/autofix.js"></script>

		<!-- fullfage -->
		<script src="../js/fullpage.min.js"></script>
		<link rel="stylesheet" href="../js/fullpage.min.css">

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

		<!-- 콘텐츠 시작 -->
		<div class="header" data-aos="fade-down" data-aos-delay="300">
			<!-- 로고, 메뉴 -->
			<div class="header-box">
				<h1><a href="/">가<span>치</span> 코딩 .</a></h1>

				<div class="cursor">
				</div>

				<div class="tnb">

					<ul>
						<li><a href="#"><c:out value="${session.me_nickName}"/></a></li>					
						<!-- 로그인이 된 경우 -->					
						<c:if test="${not empty session}">
							<div class="notification waiting">
								<span class="number"></span>
							</div>
						
							<li class="notice"><a>알림</a>
							
								<ul class="notice-sub sub-gnb">
									<li>
										<span class="delete-all" onclick="javascript:courseDeleteAll();">전체 삭제</span>
									</li>
									
									<c:forEach var="course" items="${courses}">
										<li>
											<div class="notice-info">
												<a class="notice-query" href="/board/notice_view?po_num=<c:out value='${course.noti_po_num }' />" >${course.noti_message }</a>
												<span class="date-span"><c:out value="${course.noti_datetime }" /></span>
											</div>
										<span class="delete-btn" onclick="javascript:courseDelete(${course.noti_id });"></span>
										</li>
									</c:forEach>
								</ul>
								
								<script type="text/javascript">
									function courseDeleteAll() {
										location.href = "/course_delete_all";
									}							
								
									function courseDelete(data) {
										location.href = "/course_delete?noti_id=" + data;
									}
								</script>
							</li>

							<li><a href="<c:url value='/member/actionLogout.do'/>">로그아웃</a></li>
							<li><a href="<c:url value='/member/mypage_activity'/>">마이페이지</a></li>
							
							<script>
					            let Sub = document.querySelector('.notice-sub');
					            let SubCount = Sub.childElementCount - 1;
					            
					            let X = document.getElementsByClassName("number")[0];
					            X.innerText = SubCount;
							</script>
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
						<li><a href="#"># 가치 코딩</a>
							<ul class="sub-gnb">
								<li><a href="/board/notice_list?board=언어&num=1">언어</a></li>
								<li><a href="/board/notice_list?board=DATABASE&num=1">DATABASE</a></li>
								<li><a href="/board/notice_list?board=데이터 과학&num=1">데이터 과학</a></li>
								<li><a href="/board/notice_list?board=개발도구&num=1">개발도구</a></li>
								<li><a href="/board/notice_list?board=프로젝트 관리&num=1">프로젝트 관리</a></li>
							</ul>
						</li>

						<li><a href="#"># 커뮤니티</a>
							<ul class="sub-gnb">
								<li><a href="/board/notice_list?board=일상&num=1">일상</a></li>
								<li><a href="/board/notice_list?board=프로젝트&num=1">프로젝트</a></li>
								<li><a href="/board/notice_list?board=책/강의/프로그램&num=1">책/강의/프로그램</a></li>
								<li><a href="/board/notice_list?board=스터디&num=1">스터디</a></li>
								<li><a href="/board/notice_list?board=공지사항&num=1">공지사항</a></li>
							</ul>
						</li>
						
						<li><a href="<c:url value='/coding/codingTest'/>"># 코딩연습</a></li>

						<li><a href="none"># 만든이</a></li>
					</ul>
				</div>
			</div>
		</div>