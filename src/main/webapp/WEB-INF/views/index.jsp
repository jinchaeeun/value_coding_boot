<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="header.jsp"></jsp:include>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

		<div class="contents">
			<div class="circle-small"></div>
			<div class="circle-big"></div>

			<div class="main-visual">
			    <div class="info-box" data-aos="fade-down" data-aos-delay="500">
					<h3>
						기술적인 질문에 대한 최상의 답변을 찾고 ,<br>
						다름 사람의 답변을 도와주세요 .<br>
						모든 개발자는

					<div id=flip>
						<div><div>같이</div></div>
						<div><div>가치</div></div>
					</div>
						에 대한 탭이 열려 있습니다 .
					</h3>

					<p>
						코딩 질문 및 답변의 최종 컬렉션을 구축하는 국내 공용 플랫폼 가치 코딩은<br>
						기술적인 문제에 대한 답변을 찾고 기여할 수있는 커뮤니티 기반 공간입니다 .					
					</p>

					<a href="/board/notice_list?board=언어&num=1" class="go-btn" href="javascript:void(0)">
					  <span>궁금한 점이 있으신가요? <img src="./img/question.png"></span>
					  <div class="wave"></div>
					</a>
					
				</div>
				<div class="visual-box"  data-aos="fade-up" data-aos-delay="700">
					<img src="./img/value_main.svg" alt="">
				</div>
			</div>
		</div>
	</div>

<!-- 하단 헤더 불러오기 -->
<jsp:include page="footer.jsp"></jsp:include>
