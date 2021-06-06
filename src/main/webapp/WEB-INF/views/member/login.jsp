<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="login-box">
	<h1>로그인</h1>
	<form method="post" name="frm" action="<c:url value='/member/actionLogin.do'/>">
		<div class="login">
		   <span>아이디(이메일)</span>
		   <input type="text" name="me_id" placeholder="아이디">
		   <span>비밀번호</span>
		   <input type="password" name="me_pass" placeholder="비밀번호">
		   <button type="button" onclick="actionLoginAsync();">로그인</button>
		   <label><input type="checkbox" id="chk-notice" value="log-in">&nbsp로그인 상태 유지</label>
		</div>
	</form>
	<script>
	var msg = '<c:out value="${msg}"/>';
	if (msg != ''){
		alert(msg);
	}
	
	function actionLogin(){
		var frm =document.frm;
		if(frm.me_id.value == ""){
			alert('ID가 비어있습니다.');
			frm.me_id.focus();
		}else if(frm.me_pass.value == ""){
			alert('비밀번호가 비어있습니다.');
			frm.me_pass.focus();
		} else{
			frm.submit();
		}
	}
	
	function actionLoginAsync(){
		var me_id = document.frm.me_id.value;
		var me_pass= document.frm.me_pass.value;
		
		console.log("me_id = " + me_id + ", me_pass = " + me_pass);
		
		$.ajax({
			type: "POST",
			url: "<c:url value='/member/actionLoginAsync.do'/>",
			dataType: "JSON",
			data: {"me_id": me_id, "me_pass": me_pass},
			success : function(data){
				console.log(data);
				if(data.login == true){
					location.href = "<c:url value='/'/>";	//메인 index로 이동
				}else{
					alert('로그인에 실패하였습니다.');
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("실패");
				console.log(textStatus);
			}
			
		})
		
	}
	</script>
	<div class="findIdPw">
	   <a href="#none">아이디 찾기</a>
	   <a href="#none">비밀번호 찾기</a>
	   <a href="<c:url value='/member/join'/>">회원가입</a>      
	</div>
	<a id="kakao-login-btn"></a>
	<!-- 카카오 로그인 -->
	   <div class="kakao-login">
	      <ul>
	         <li onclick="kakaoLogin();">
	           <a href="javascript:void(0)">
	            <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
	           </a>
	         </li>
	      </ul>
	
	      <!-- 카카오 스크립트 -->
	      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	      <script>
	      Kakao.init('365e10715c6beba6ae9f5e655701ff59'); //발급받은 키 중 javascript키를 사용해준다.
	      console.log(Kakao.isInitialized()); // sdk초기화여부판단
	      
	      //카카오로그인
	      function kakaoLogin() {
	         Kakao.Auth.login({
	           success: function (response) { //자료를 성공적으로 보냈을때 출력되는 부분
	            Kakao.API.request({
	              url: '/v2/user/me',
	              success: function (response) {
	                 console.log(response);   //콘솔에 가져온 정보 출력 이메일, 닉네임
	                 location.href="../index.jsp";   //로그인 후 메인 페이지로 이동
	              },
	              fail: function (error) {
	               console.log(error);
	               alert("로그인 실패하였습니다.");
	              },
	            })
	           },
	           fail: function (error) {
	            console.log(error);
	            alert("로그인 실패하였습니다.");
	           },
	         })
	        }
	      </script>
	  </div>

   
	<!-- 네이버 로그인 -->
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin">
		<ul>
			<li>
				<a id="naverIdLogin_loginButton" href="#">
					<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="0">
				</a>
			</li>
		</ul>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	
	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
	   var naverLogin = new naver.LoginWithNaverId(
	      {
	         clientId: "WXFwIJiy9CY4hlkkNLJP",
	         callbackUrl: "http://127.0.0.1:8080/value_coding/member/nCallback.jsp",
	         isPopup: false, /* 팝업을 통한 연동처리 여부 */
	         loginButton: {color: "green", type: 3, width: 222} /* 로그인 버튼의 타입을 지정 */
	      }
	   );
	   
	   /* 설정정보를 초기화하고 연동을 준비 */
	   naverLogin.init();
	   
	</script>
	</div>

	<!-- 구글 로그인 (127.0.0.1 테스트 불가, LOCALHOST사용)-->
	<!-- 구글 로그인 버튼-->
		<!-- 구글 로그인 버튼-->
	<div class="g-signin2" data-onsuccess="onSignIn" data-gapiscan="true" data-onload="true">
	<!-- 스타일 지정하기 -->
		<div class="abcRioButton abcRioButtonLightBlue">
			<div class="abcRioButtonContentWrapper">
				<div class="abcRioButtonIcon" style="padding:8px">
					<div style="width:24px;height:24px;" class="abcRioButtonSvgImageWithFallback abcRioButtonIconImage abcRioButtonIconImage18">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 48 48" class="abcRioButtonSvg">
							<g>
								<path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
								<path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
								<path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
								<path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
								<path fill="none" d="M0 0h48v48H0z"></path>
							</g>
						</svg>
					</div>
				</div>
				<span class="abcRioButtonContents">
					<span id="not_signed_intpqazx6p6z5y">구글계정으로 로그인</span>
					<span id="connectedtpqazx6p6z5y" style="display:none">Signed in</span>
				</span>
			</div>
		</div>
	</div>
</div>
	<!-- 프로필 정보 얻기 -->
	<script>
	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	</script>
	<!--
	로그아웃
		<a href="#" onclick="signOut();">Sign out</a>
	<script>
	  function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	  }
	</script> 
	
	 -->
</div>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>