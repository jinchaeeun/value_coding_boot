<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="ajax_div">

<c:set var="session" value="${sessionScope.login}" scope="application"/>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>


<div class="mypage-box">
	<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
		<ul class="mypage-tap">
			<li class="mypage-tapmenu on" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
			<li class="mypage-tapmenu" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
		</ul>
	
	<form method ="post" name="mypageForm" action="<c:url value='/member/ModifyMypage'/>">
	<div class="mypage-form">
			<span>닉네임</span>
			<input type="text" name="me_nickName" id="me_nickName" value='<c:out value="${session.me_nickName}"/>' />
			<span>아이디(이메일)</span>
			<input type="text" name="me_id" id="mypage_Email" value='<c:out value="${session.me_id}"/>' readonly onfocus="this.blur()" />
			
			<span>비밀번호</span>
			<input type="password" name="me_pass" id="me_pass" placeholder="비밀번호" />
			
			<span>비밀번호 확인</span>
			<input type="password" name="passConfig" id="me_pass2" placeholder="비밀번호 확인" />
			
			<span>선호 개발 언어</span>
			<div class="checkDevLangDiv">
				<ul>
					<li>
						<label><input type="checkbox" name="me_devLang" value="Java">Java</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="Python">Python</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="JSP">JSP</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="PHP">PHP</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="C">C</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="C++">C++</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="R">R</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="Git">Git</label>
					</li>
					<li>
						<label><input type="checkbox" name="me_devLang" value="Etc">Etc</label>
					</li>
				</ul>
			</div>
			
			<!-- <span>가입 날짜</span> <c:out value="${session.me_regDate}"/> -->
			<button class="btn btn-success" type="button" onclick="mypage_SubmitForm();">회원정보 수정</button>
		</div>	
	</form>
	
</div>


</div>
<script>

var msg = '<c:out value="${msg}"/>';
if (msg != ''){
	alert(msg);
}

$('#mytap1').bind('click', function(event) {
	   fn_getPage('./mypage');
	   
	    $(this).addClass('on');
	    $('#mytap2').removeClass('on');
	});
	
$('#mytap2').bind('click', function(event) {
fn_getPage('./mypage_board');

		$(this).addClass('on');
		$('#mytap1').removeClass('on');
	});

	 
	

function fn_getPage(url) {
	   $.ajax({
		url : url,
		type : 'get',
		data : {
				test : '1', 
				test: '2',
				}, //get-> sample11_1.jsp&test=1
		dataType : 'html', // html, json, xml
		beforeSend : function(){
			//로딩.........show
		},

		success : function(data){
	         $('#ajax_div').html(data);
		},
		
		error : function(){
			//alert('오류 발생')
		},
		complete : function(){
			//hide	
		}
	});
}
	
	
function mypage_SubmitForm(form){
	
	if($("#me_nickName").val().trim() ==""){
		alert("닉네임을 입력해주세요.");
		$("#me_nickName").focus();
	} else if($("#me_pass").val().trim() ==""){
		alert("비밀번호를 입력해주세요.");
		$("#me_pass").focus();
	} else if($("#me_pass2").val().trim() ==""){
		alert("비밀번호 확인을 입력해주세요.");
		$("#me_pass2").focus();
	} else if($("#me_pass").val() != $("#me_pass2").val()){
		alert("비밀번호 입력 값이 다릅니다.");
		$("#me_pass2").focus();
	}else{
		document.mypageForm.submit();
	}
};


</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>