<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="join-box">
	<h1>회원가입</h1>
	<div class="join">
		<span>닉네임</span>
		<input type="text" placeholder="닉네임">
		<span>아이디(이메일)</span>
		<input type="text" placeholder="아이디">
		
		<span>비밀번호</span>
		<input type="password"  placeholder="비밀번호">
		
		<span>비밀번호 확인</span>
		<input type="password"  placeholder="비밀번호 확인">
		
		<span>선호 개발 언어</span>
		<div class="checkDevLangDiv">
			<ul>
				<li>
					<label><input type="checkbox" name="devLang" value="Java">Java</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="Python">Python</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="JSP">JSP</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="PHP">PHP</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="C">C</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="C++">C++</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="R">R</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="Git">Git</label>
				</li>
				<li>
					<label><input type="checkbox" name="devLang" value="Etc">Etc</label>
				</li>
			</ul>
		</div>
		<button>가입하기</button>
	</div>
	<div class="button">
		<a href="../index.jsp">이전</a>
	</div>
</div>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>
