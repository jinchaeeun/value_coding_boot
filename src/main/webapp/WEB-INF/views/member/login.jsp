<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="313884237013-nbebjejv6nsohf9hk0cpump6kr5lvaa8.apps.googleusercontent.com">

<div class="login-box">
	<h1>로그인</h1>
	<div class="login">
	   <span>아이디(이메일)</span>
	   <input type="text" placeholder="아이디">
	   <span>비밀번호</span>
	   <input type="password"  placeholder="비밀번호">
	   <button>로그인</button>
	   <label><input type="checkbox" id="chk-notice" value="log-in">&nbsp로그인 상태 유지</label>
	</div>
	<div class="findIdPw">
	   <a href="#none">아이디 찾기</a>
	   <a href="#none">비밀번호 찾기</a>
	   <a href="../member/join.jsp">회원가입</a>      
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
	<div class="g-signin2" data-onsuccess="onSignIn">
	<!-- 스타일 지정하기 -->
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
<style>

.login-box img{
width: 220px;
height: auto;
margin-top: 10px;
}
.login-box .findIdPw a{
padding: 5px 10px 5px 10px;
border-right: 1px solid #ccc;
}
.login-box .findIdPw a:last-child{border: 0;}


.kakao-login ul li{
	display: inline-block;
}

.g-signin2 > div {
display: inline-block;
    width: 220px;
}
</style>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>