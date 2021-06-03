<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="join-box">
	<h1>회원가입</h1>
		<div class="join">
			<script>
			// 가입 버튼 여러 번 클릭하게 될 경우, Submit 중복 방지용
			var joinFormSubmitDone = false;
			function joinFormSubmit(form){
				if (joinFormSubmitDone) {
					alert('처리 중입니다.');
				}
				
				// 닉네임 유효성 검사
				form.userNickName.value = form.userNickName.value.trim();
				
				if(form.userNickName.value.length == 0 ) {
					alert ('닉네임을 입력해주세요');
					form.userNickName.focus();
					
					return;
				}
				
				// 아이디 유효성 검사
				form.me_id.value = form.me_id.value.trim();
				
				if(form.me_id.value.length == 0 ) {
					alert ('아이디를 입력해주세요');
					form.me_id.focus();
					return;
				}
				
				if(form.me_id.value.length < 6 ) {
					alert ('아이디를 6자 이상 입력해주세요');
					form.me_id.focus();
					return;
				}
				
				// 아이디 영문 및 숫자만 입력
				if (isAlphaNumeric(form.me_id.value) == false ) {
					alert ('영문자 소문자와 숫자만 아이디로 입력해주세요 ');
					form.me_id.focus();
					return;
				}
				
				// 아이디 소문자로 변경
				form.me_id.value = form.me_id.value.toLowerCase();
				
				// 비밀번호 유효성 검사 
				form.me_password.value = form.me_password.value.trim();
				
				if(form.me_password.value.length == 0 ) {
					alert ('비밀번호를 입력해주세요');
					form.me_password.focus();
					return;
				}
				
				// 비밀번호 확인 유효성
				form.userPassConfirm.value = form.userPassConfirm.value.trim();
				if (form.me_password.value != form.userPassConfirm.value ) {
					alert ('비밀번호가 일치하지 않습니다.')
					return;
				}
				
				form.submit();
				joinFormSubmitDone = true;
			}
			</script>
			<form action="dojoin" method="post" onsubmit="joinFormSubmit(this); return false;">
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userNickName">닉네임</label>
					<input class="form-control" type="text" id="userNickName" name="me_nickname" placeholder="닉네임"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디(이메일)</label>
					<input class="form-control" type="text" id="userId" name="me_id"  placeholder="6자 이상의 영 소문자 및 숫자를 입력해주세요"/>
					<span class="nick_check_ok">사용 가능한 아이디입니다.</span>
					<span class="nick_check_no">이미 사용 중인 닉네임입니다!.</span>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="me_password" placeholder="비밀번호"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userPassConfirm">비밀번호 확인</label>
					<input class="form-control" type="password" id="userPassConfirm" name="userPassConfig" placeholder="비밀번호 확인"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="checkDevLang">선호 개발 언어</label>
					<div class="checkDevLangDiv">
						<ul>
							<li><label><input type="checkbox" name="devLang" value="Java">Java</label></li>
							<li><label><input type="checkbox" name="devLang" value="Python">Python</label></li>
							<li><label><input type="checkbox" name="devLang" value="JSP">JSP</label></li>
							<li><label><input type="checkbox" name="devLang" value="PHP">PHP</label></li>
							<li><label><input type="checkbox" name="devLang" value="C">C</label></li>
							<li><label><input type="checkbox" name="devLang" value="C++">C++</label></li>
							<li><label><input type="checkbox" name="devLang" value="R">R</label></li>
							<li><label><input type="checkbox" name="devLang" value="Git">Git</label></li>
							<li><label><input type="checkbox" name="devLang" value="Etc">Etc</label></li>
						</ul>
					</div>
				</div>

				<div class="form-group has-feedback">
					<input type="submit" class="btn btn-success" value="가입하기" />
				</div>
			</form>
		</div>
	
	<div class="button">
		<a href="/login">이전</a>
	</div>
</div>
<script>
//아이디 중복검사
$('#userId').on("propertychange change keyup paste input", function(){

	//console.log("keyup 테스트");	
	
	var memberId = $('#userId').val();			// .id_input에 입력되는 값
	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data
	}); // ajax 종료

});// function 종료
</script>
</body>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>