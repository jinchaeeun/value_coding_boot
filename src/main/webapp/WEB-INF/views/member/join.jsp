<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

	
<script type="text/javascript">
var msg = '<c:out value="${msg}"/>';
if (msg != ''){
	alert(msg);
}


function submitForm(){

	var me_nickName = $.trim($("#me_nickName").val());
	var me_id = $.trim($("#me_id").val());
	var me_pass = $.trim($("#me_pass").val());
	var me_pass2 = $.trim($("#me_pass2").val());
	
	// 이메일 정규식
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

	 if(me_nickName ==""){
		alert("닉네임을 입력해주세요.");
		$("#me_nickName").focus();
	} else if( me_id ==""){
		alert("아이디를 입력해주세요.");
		$("#me_id").focus();
	} else if (!me_id.match(regExp)){
		alert("이메일 형식을 맞춰주세요");
		$("#me_id").focus();
	} else if(me_pass ==""){
		alert("비밀번호를 입력해주세요.");
		$("#me_pass").focus();
	} else if(me_pass2 ==""){
		alert("비밀번호 확인을 입력해주세요.");
		$("#me_pass2").focus();
	} else if(me_pass != me_pass2){
		alert("비밀번호 입력 값이 다릅니다.");
		$("#me_pass2").focus();
	}else{
		document.frm.submit();
	}
};


function checkId(){
	var me_id = document.frm.me_id.value;
	
	$.ajax({
		type: "POST",
		url: "<c:url value='/member/checkId.do'/>",
		dataType: "JSON",
		data: {"me_id": me_id},
		success : function(data){
			console.log(data);
			if(data.duplicate == true){
				alert("이미 가입된 ID입니다.");
			}else{
				alert("가입 가능한 ID입니다.");
			}
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log(textStatus);
		}
		
	})
	
}
		
		
	</script>
	
<div class="join-box">
	<h1>회원가입</h1>
	<div class="join">

		<form method="post" name="frm"  action="<c:url value='/member/joinInsert'/>">

			<div class="form-group has-feedback">
				<label class="control-label" for="me_nickName">닉네임</label> 
				<input class="form-control" type="text" id="me_nickName" name="me_nickName" placeholder="닉네임" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="me_id">아이디(이메일)</label> 
				<input class="form-control" type="text" id="me_id" name="me_id" placeholder="아이디(이메일)" ><a href="javascript:checkId();" class="checkId">중복확인</a>
				
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
						<li><label><input type="checkbox" name="me_devLang" value="Java">Java</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="Python">Python</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="JSP">JSP</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="PHP">PHP</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="C">C</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="C++">C++</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="R">R</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="Git">Git</label></li>
						<li><label><input type="checkbox" name="me_devLang" value="Etc">Etc</label></li>
					</ul>
				</div>
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" onclick="submitForm();">가입하기</button>
			</div>
		</form>
	</div>

	<div class="button">
		<a href="/login">이전</a>
	</div>
</div>

<!-- 하단 헤더 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>
