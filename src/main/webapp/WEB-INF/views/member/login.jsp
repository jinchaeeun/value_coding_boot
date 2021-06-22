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
<meta name="google-signin-client_id" content="313884237013-nbebjejv6nsohf9hk0cpump6kr5lvaa8.apps.googleusercontent.com">

<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="login-box">
	<form method="post" name="frm" action="<c:url value='/member/actionLogin.do'/>">
		<div class="login">
		
		   <h1>로그인</h1>
			
		   <input type="text" name="me_id" placeholder="아이디">
		   <input type="password" name="me_pass" placeholder="비밀번호">
		   <button type="button" onclick="actionLogin();">로그인</button>
		   <label><input type="checkbox" id="chk-notice" value="log-in">&nbsp로그인 상태 유지</label>
	
			<div class="findIdPw">
			   <a href="#none">아이디 찾기</a>
			   <a href="#none">비밀번호 찾기</a>
			   <a href="<c:url value='/member/join'/>">회원가입</a>      
			</div>
			<input type="hidden" id="tocken" name="tocken" value="0">
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
		
			</div>
		
			<!-- 구글 로그인 (127.0.0.1 테스트 불가, LOCALHOST사용)-->
			<!-- 구글 로그인 버튼-->
				<!-- 구글 로그인 버튼-->
			<div class="g-signin2" data-onsuccess="onSignIn">
			<!-- 스타일 지정하기 -->
			</div>
	
		</div>
	</form>
	
</div>

<!-- 일반 로그인 -->
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
			return false;
		}else if(frm.me_pass.value == ""){
			alert('비밀번호가 비어있습니다.');
			frm.me_pass.focus();
			return false;
		} else{
			actionLoginAsync();
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
	
	function snsJoinInsert(){
		console.log("sns_id = " + sns_id + ", sns_nick = " + sns_nick + ", sns_type = " + sns_type);
		
		$.ajax({
			type: "POST",
			url: "<c:url value='/member/sosialJoinInsert.do'/>",
			dataType: "JSON",
			data: {"sns_id": sns_id, "sns_nick": sns_nick, "sns_type": sns_type},
			success : function(data){
				console.log(data);
				if(data.login == true){
					location.href = "<c:url value='/'/>";	//메인 index로 이동
				}else{
					alert('해당 버튼으로 가입하지 않은 계정입니다. 가입한 계정으로 다시 시도하여 주십시오.'); //카카오 로그인 실패 에러는 카카오로그인 함수에서 에러 처리해주기 때문에 여기서 가입타입이 맞지않을 때 에러처리를 해 준다. 
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("실패");	//뜨면 url 다시 확인하기
				console.log(textStatus);
			}
			
		})
		
	}
</script>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('365e10715c6beba6ae9f5e655701ff59'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
var sns_id=""; 
var sns_nick="";	
var sns_type=0; //1: 일반, 2: 카카오, 3: 네이버, 4: 구글, 5: 깃허브
//카카오로그인
function kakaoLogin() {
   Kakao.Auth.login({
     success: function (response) { //자료를 성공적으로 보냈을때 출력되는 부분
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {
           console.log(response);   //콘솔에 가져온 정보 출력 이메일, 닉네임
           
           sns_type=2;
           sns_id=response.kakao_account.email;
           sns_nick=response.properties.nickname;
           
           //alert("카카오 로그인 성공 "+ response.kakao_account.email + response.properties.nickname + sns_type);
           snsJoinInsert();	//호출
           
           //location.href="<c:url value='/'/>";   //로그인 후 메인 페이지로 이동
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

	
<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "WXFwIJiy9CY4hlkkNLJP",
         callbackUrl: "http://127.0.0.1:8080/member/nCallback.do",
         isPopup: false, /* 팝업을 통한 연동처리 여부 */
         loginButton: {color: "green", type: 3, width: 222} /* 로그인 버튼의 타입을 지정 */
      }
   );
   
   /* 설정정보를 초기화하고 연동을 준비 */
   naverLogin.init();
   
</script>


<!-- 구글프로필 정보 얻기 -->
<script>
	function onSignIn(googleUser) {
		console.log('구글 함수 들어옴');

	var profile = googleUser.getBasicProfile();
		console.log('Name: ' + profile.getName());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		
		sns_type=4;
	    sns_id=profile.getEmail();
	    sns_nick=profile.getName();
	     
		snsJoinInsert();	//호출
	/* 
		//var auth2 = gapi.auth2.getAuthInstance();
		
		if(auth2.isSignedIn.get()){
			var profile = auth2.currentUser.get().getBasicProfile();
			//console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			
			 sns_type=4;
		     sns_id=profile.getEmail();
		     sns_nick=profile.getName();
		     //confirm("구글 로그인 성공 "+ profile.getEmail() + profile.getName() + sns_type);
		     
		     snsJoinInsert();	//호출
		}
     
     */
    
	}
	
</script>
<!-- 하단 헤더 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>