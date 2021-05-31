<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="about-wrap">
	<div class="about-box">
		<div class="about-hd section" id="section0">
			<div class="about-img-logo">
				<img alt="" src="https://lh3.googleusercontent.com/proxy/XnTbkns4wgbeh2mYTyhas9Ho2jh-2Yt-LsgNzYZnPo48TTqNFB-Hb2ep2BcQgMHAotwAE884-R05sdD5eCBEZBTGRI7eAiKhgRENRULo9j4bhyVLsX0o1LgHPRuNRaQ020UQ-1kd4O5o0A">
			</div>
			<div class="about-comment">
				<span>개발자의, 개발자에 의한, 개발자를 위한, <b>개발자 커뮤니티</b></span>
				<br><br><br>
				<p>가치 코딩은 개발자들이 서로 같이 가치 있는 코딩을 하기위해 만든 개발자 커뮤니티 입니다.</p>
			</div>
		</div> <!-- about-hd -->
			
		<div class="about-intro section" id="section1">
			<h2>한국의 수많은 개발자들</h2>
			<p>우리나라의 수많은 개발자들과 예비 개발자들이 개발을 하고 있습니다.</p>
			
			<div class="about-intro-number">
				<ul>
					<li>
						<p class="counter">300,000</p>
						<span>SW 전문인력</span>
					</li>
					<li>
						<p class="counter">32,000</p>
						<span>매년 SW 전공 졸업자 수</span>
					</li>
					<li>
						<p class="counter">26,000</p>
						<span>SW 기업 수</span>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 카운트업 js -->
		<script>
			$('.counter').counterUp({
				delay: 5,
				time: 500
			});
		</script>
		
		<div class="about-body section" id="section2">
			<div class="about-maker">
				<h2>만든이들</h2>
				<div class="about-dev">
					<div class="about-dev-people">
						<div class="about-dev-img">
							<img alt="" src="../img/question.png">
						</div>
						<div class="about-dev-info">
							<p>강아현 </p>
							<br>
							<p>GitHub 주소 : </p>​
							<p>E-mail : </p>​
							<p>맡은 역할 : </p>
						</div>
					</div> <!-- about-dev-people -->
					<div class="about-dev-people">
						<div class="about-dev-img">
							<img alt="" src="../img/question.png">
						</div>
						<div class="about-dev-info">
							<p>김나현</p>
							<br>
							<p>GitHub 주소 : </p>​
							<p>E-mail : </p>​
							<p>맡은 역할 : </p>
						</div>
					</div> <!-- about-dev-people -->
					<div class="about-dev-people">
						<div class="about-dev-img">
							<img alt="" src="../img/question.png">
						</div>
						<div class="about-dev-info">
							<p>마제환 : Ma JeHwan</p>
							<br>
							<p>GitHub 주소 : https://github.com/mjh1583</p>​
							<p>E-mail : mjh1583@naver.com</p>​
							<p>맡은 역할 : 게시판의 HTML + CSS + 백엔드 구현</p>
						</div>
					</div> <!-- about-dev-people -->
					<div class="about-dev-people">
						<div class="about-dev-img">
							<img alt="" src="../img/question.png">
						</div>
						<div class="about-dev-info">
							<p>진채은</p>
							<br>
							<p>GitHub 주소 : </p>​
							<p>E-mail : </p>​
							<p>맡은 역할 : </p>
						</div>
					</div> <!-- about-dev-people -->
				</div> <!-- about-dev -->	
			</div> <!-- about-us -->
		</div> <!-- about-body -->
	</div> <!-- about-box -->
</div> <!-- about-wrap -->

<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>