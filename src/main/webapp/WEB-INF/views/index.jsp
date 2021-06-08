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

	<div class="main-gallery-wrap">
		<div class="m-g-box">
			<div class="main-gallery">
				<ul>
					<li data-aos="fade-up" data-aos-delay="300">
						<div class="info">
								<h3>질문</h3>
								<p>
									기술적인 질문에 대한 최상의 답변을 찾고,
									<br/>다른 사람들이 대답하도록 도와주세요.
									<br/>모든 개발자는 <span>가치</span>에 대한 탭이 열려 있습니다.
								</p>
							</a>
							<div class="slabel">
							  <input id="credit-card" type="text" pattern="[0-9]{13,16}" placeholder="궁금한 점을 입력해주세요.">
							  <label for="credit-card">궁금한 점이 있으신가요?<img src="./img/question.png"></label>
							</div>
						</div>
					</li>
				</ul>

				<div class="section over-hide" data-aos="fade-up" data-aos-delay="300">
				<div class="container">
				  <div class="row full-height justify-content-center">
					<div class="col-12 text-center align-self-center py-5">
					  <div class="section text-center py-5 py-md-0">
							  <input class="tgl tgl-flip pricing" type="checkbox" id="pricing" name="pricing"/>
							  <label class="tgl-btn" for="pricing" data-tg-off="답변을 기다리는 질문" data-tg-on="내 프로필"></label>
						<div class="card-3d-wrap mx-auto">
						  <div class="card-3d-wrapper">
							<div class="card-front">
							  <div class="pricing-wrap">
								<h4 class="mb-5"><c:out value="${session.me_nickName}"/></h4>
								<h2 class="mb-2"><sup>답변 받은 질문</sup>12 / 14<sup>전체 질문</sup></h2>
								<p class="mb-4">${session.me_devLang} | Python | JSP</p>
								<p class="mb-1"><i class="uil uil-location-pin-alt size-22"></i></p>
								<p class="mb-4">개발자</p>
								<div class="app-container" id="taskList">
								  <h1 class="app-header">알림</h1>
								  <ul class="task-list">
									<li class="task-list-item" v-for="task in tasks">
									  <label class="task-list-item-label">
										<input type="checkbox">
										<span class="task-list-span">{{task.name}}</span>
										<span class="date-list-span">{{task.date}}</span>
									  </label>
									  <span @click="delItem(task)" class="delete-btn" title="Delete Task">{{task.del}}</span>
									</li>
								  </ul>
								</div>
								<div class="img-wrap img-2">
								  <img src="https://assets.codepen.io/1462889/sea.png" alt="">
								</div>
								<div class="img-wrap img-3">
								  <img src="https://assets.codepen.io/1462889/water.png" alt="">
								</div>
								  </div>
								</div>
							<div class="card-back">
							  <div class="pricing-wrap">
								<h4 class="mb-5"> <c:out value="${session.me_nickName}"/> </h4>
								<div class="app-container question-container" id="questionList">
								  <span class="tag-span">java</span>
								  <span class="tag-span">python</span>
								  <span class="tag-span">jsp</span>
								  <h1 class="app-header question-header">답변을 기다리는 관심질문</h1>
								  <ul class="task-list">
									<li class="task-list-item" v-for="question in questions">
									  <label class="task-list-item-label question-label">
										<input type="checkbox">
										<span>{{question.name}}</span>
									  </label>
									  <span class="date-list-span">{{question.date}}</span>
									  <span class="tag-list-span">{{question.tag}}</span>
									</li>
								  </ul>
								</div>
								<div class="img-wrap img-2">
								  <img src="https://assets.codepen.io/1462889/grass.png" alt="">
								</div>
								<div class="img-wrap img-5">
								  <img src="https://assets.codepen.io/1462889/Ivy.png" alt="">
								</div>
								  </div>
								</div>
							  </div>
							</div>
						  </div>
						</div>
					  </div>
				  </div>
				</div>


			</div>
		</div>
	</div>

</div>
<!-- 하단 헤더 불러오기 -->
<jsp:include page="footer.jsp"></jsp:include>
