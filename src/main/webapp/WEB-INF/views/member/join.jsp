<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<script type="text/javascript">

		$(document).ready(function(){

			$("#submit").on("click", function(){
				if($("#me_nickName").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#me_nickName").focus();
					return false;
				} else if($("#me_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#me_id").focus();
					return false;
				} else if($("#me_pass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#me_pass").focus();
					return false;
				} else if($("#me_pass2").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#me_pass2").focus();
					return false;
				} else if($("#me_pass").val() != $("#me_pass2").val()){
					alert("비밀번호 입력 값이 다릅니다.");
					$("#me_pass2").focus();
					return false;
				}
			});
		})
	</script>
	
<div class="join-box">
	<h1>회원가입</h1>
	<div class="join">

		<form action="/member/join" method="post">

			<div class="form-group has-feedback">
				<label class="control-label" for="me_nickName">닉네임</label> 
				<input class="form-control" type="text" id="me_nickName" name="me_nickName" placeholder="닉네임" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="me_id">아이디(이메일)</label> 
				<input class="form-control" type="text" id="me_id" name="me_id" placeholder="아이디(이메일)" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="me_pass">비밀번호</label> 
				<input class="form-control" type="password" id="me_pass" name="me_pass" placeholder="비밀번호" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="me_pass2">비밀번호 확인</label> <input
					class="form-control" type="password" id="me_pass2" name="me_pass2"
					placeholder="비밀번호 확인" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="checkDevLangDiv">선호 개발 언어</label>
				<div class="checkDevLangDiv">
					<ul>
						<li><label><input type="checkbox" name="me_devLang"
								value="Java">Java</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="Python">Python</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="JSP">JSP</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="PHP">PHP</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="C">C</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="C++">C++</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="R">R</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="Git">Git</label></li>
						<li><label><input type="checkbox" name="me_devLang"
								value="Etc">Etc</label></li>
					</ul>
				</div>
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">가입하기</button>
			</div>
		</form>
	</div>

	<div class="button">
		<a href="/login">이전</a>
	</div>
</div>

<!-- 하단 헤더 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>
