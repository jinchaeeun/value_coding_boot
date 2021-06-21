<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="../css/style.css">

<div class="circle-small"></div>
<div class="circle-big"></div>	

<c:set var="session" value="${sessionScope.login}" scope="application"/>

 <div class="mypage">
        <h2><span style="color: #1d3a6d;">죽전동딩코</span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu" id="btn1"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu on" id="btn2"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu" id="btn3"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu" id="btn4"><a href="#">답변</a></li>
            </ul>
           
    <c:if test="${session.me_singupcode != 1}">
	<form method ="post" name="mypageForm" action="<c:url value='/member/ModifyMypage'/>">
		<div class="mypage-form">
				<span>소셜 로그인 가입자</span>
				<span>닉네임</span>
				<input type="text" name="me_nickName" id="me_nickName" value='<c:out value="${session.me_nickName}"/>' />
				<span>아이디(이메일)</span>
				<input type="text" name="me_id" id="mypage_Email" value='<c:out value="${session.me_id}"/>' readonly onfocus="this.blur()" />
				
				<span>선호 개발 언어</span>
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
						<li><label><input type="checkbox" name="me_devLang" value="Etc">기타</label></li>
					</ul>
				</div>
				
				<button class="btn btn-success" type="button" onclick="mypageSNS_SubmitForm();">회원정보 수정</button>
				<a href="<c:url value='/member/memberDeleteView'/>">회원탈퇴</a>
		</div>	
		</form>
	</c:if>
	
	
		<c:if test="${session.me_singupcode == 1}">
		<form method ="post" name="mypageForm" action="<c:url value='/member/ModifyMypage'/>">
		     <div class="mypage-con-column">
                <div class="mypage-mod">
                    <span>닉네임</span>
                    <input type="text" name="me_nickName" id="me_nickName" value='죽전동딩코' />
                    <span>아이디(이메일)</span>
                    <input type="text" name="me_id" id="mypage_Email" value='032605' readonly onfocus="this.blur()" />
                    
                    <span>비밀번호</span>
                    <input type="password" name="me_pass" id="me_pass" placeholder="비밀번호" />
                    <span>비밀번호 확인</span>
                    <input type="password" name="passConfig" id="me_pass2" placeholder="비밀번호 확인" />
                    
                    <span>선호 개발 언어</span>
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
                            <li><label><input type="checkbox" name="me_devLang" value="Etc">기타</label></li>
                        </ul>
                    </div>
				
				<button class="btn btn-success" type="button" onclick="mypage_SubmitForm();">회원정보 수정</button>
				<a href="<c:url value='/member/memberDeleteView'/>" class="memberdelete">회원탈퇴</a>
				</div>
			</div>	
		</form>
		</c:if>
	
 
        </div>
    </div>

 
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

$('#btn1').bind('click', function(event) {
	fn_getPage('./mypage_activity');
	});
$('#btn2').bind('click', function(event) {
   fn_getPage('./mypage_modify');
	});
$('#btn3').bind('click', function(event) {
	   fn_getPage('./mypage_board');
		});
$('#btn4').bind('click', function(event) {
	   fn_getPage('./mypage_comment');
		});


	

// 체크된 것을 배열로 넣기
var checkedLang = "${session.me_devLang}"
var checkedArr = checkedLang.split(",");

console.log (checkedArr);

$(document).ready(function() {
	    for (var checkDevLangDiv in checkedArr) {
	                    $("input[name=me_devLang][value="+checkedArr[checkDevLangDiv]+"]").prop("checked",true);
	    }    
	});
	
	
var msg = '<c:out value="${msg}"/>';
if (msg != ''){
	alert(msg);
}


function mypageSNS_SubmitForm(form){
	
	if($("#me_nickName").val().trim() ==""){
		alert("닉네임을 입력해주세요.");
		$("#me_nickName").focus();
	} else{
		document.mypageForm.submit();
	}
};

</script>
