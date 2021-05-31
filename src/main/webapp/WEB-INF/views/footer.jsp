<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 하단 정보 불러오기 -->

<style>
.ani-ft{transition:all 0.3s;
animation-name:ani-bt;
animation-delay: 0.35s;
animation-duration: 0.35s;
bottom:-100px;
animation-fill-mode: forwards;
}

@keyframes ani-bt{
	0%{
		bottom:-100px;
		opacity: 0;
	}
	100%{
		bottom:0;
		opacity: 1;
	}
}

</style>

<div class="footer ani-ft">
<!-- 하단 정보 -->	
	<div>
		<div class="f-copy">
			<p>copyright(c) 가치 코딩. All Rights Reserved</p>

		</div>
	</div>
</div>


<!-- 콘텐츠 끝 -->
<script>
	$(".gnb li").hover(function() {
		$(this).children("ul").slideToggle(100)
	})

	let mouseCursor = document.querySelector(".cursor");
	let tnbLinks = document.querySelectorAll(".tnb li a");
	let gnbLinks = document.querySelectorAll(".gnb li a");
	let qnaLinks = document.querySelectorAll(".slabel");
	let togLinks = document.querySelectorAll(".tgl-btn");
	let logLinks = document.querySelectorAll(".logo");
	window.addEventListener("scroll", cursor);
	window.addEventListener("mousemove", cursor);
	function cursor(e) {
		mouseCursor.style.left = e.pageX + "px";
		mouseCursor.style.top = e.pageY - scrollY + "px";
	}

	tnbLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});

	gnbLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});

	qnaLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});

	togLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});
	
	logLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});


	$(document).ready(function() {
		document.querySelector(".circle-small").classList.add("go");
		document.querySelector(".circle-big").classList.add("go");
	});

  AOS.init();
</script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.11/vue.min.js'></script>
  <script id="rendered-js" >
	new Vue({
	  el: '#taskList',
	  data: {
		title: 'to do list',
		tasks: [
		{ name: "새로운 환경에서 로그인 되었습니다.", date: "방금"},
		{ name: "'스프링 부트 모드 선택' 질문의 답변이 등록되었습니다.", date: "25분 전"},
		{ name: "'UEFI와 레거시 부팅의 차이점' 질문의 답변이 등록되었습니다.", date: "2시간 전"}] },

	  methods: {
		delItem: function (task) {
		  this.tasks.splice(this.tasks.indexOf(task), 1);
		} } });
	//# sourceURL=pen.js

	let tlsLinks = document.querySelectorAll(".task-list-span");
	let delLinks = document.querySelectorAll(".delete-btn");
	tlsLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});

	delLinks.forEach((link) => {
		link.addEventListener("mouseover", () => {
			mouseCursor.classList.add("cursor-grow");
		});
		link.addEventListener("mouseleave", () => {
			mouseCursor.classList.remove("cursor-grow");
		});
	});
</script>

  <script id="rendered-js" >
	new Vue({
	  el: '#questionList',
	  data: {
		title: 'to do list',
		questions: [
		{ name: "백 스택에서 조각을 호출하는 방법", date: "방금", tag: "java, android, kotlin"},
		{ name: "중복 값이있는 동일한 키로 목록 별 그룹화", date: "3분 전", tag: "java, java-8, hashmap"},
		{ name: "Ajax를 사용한 Django 메시지", date: "25분 전", tag: "java, python-3.9, django-3.2"},
		{ name: "UTF-8로 작성된 스프링 디코딩", date: "2시간 전", tag: "java"},
		{ name: "Java EE의 환경 변수에 따른 구성 파일" , date: "2021.05.25.", tag: "java, tomcat"}]},

	 });
	//# sourceURL=pen.js
</script>


</body>

</html>


