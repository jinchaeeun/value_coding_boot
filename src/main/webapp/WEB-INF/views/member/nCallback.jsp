<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>네이버로그인</title>
  </head>

<body>

   <!-- (1) LoginWithNaverId Javscript SDK -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

   <!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
   
   <script>
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
   					alert('로그인에 실패하였습니다.');
   				}
   			},
   			error : function(jqXHR, textStatus, errorThrown){
   				console.log("실패");	//뜨면 url 다시 확인하기
   				console.log(textStatus);
   			}
   			
   		})
   		
   	}
  	
  	
   var sns_id=""; 
   var sns_nick="";	
   var sns_type=0; //1: 일반, 2: 카카오, 3: 네이버, 4: 구글, 5: 깃허브
   
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "{WXFwIJiy9CY4hlkkNLJP}",
            callbackUrl: "{http://127.0.0.1:8080/member/nCallback.do}",
            isPopup: false,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
         }
      );

      /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
      naverLogin.init();

      /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
            if (status) {
               /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
               var email = naverLogin.user.getEmail();
               if( email == undefined || email == null) {
                  alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                  /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                  naverLogin.reprompt();
                  return;
               }

               sns_type=3;
               sns_id=naverLogin.user.email;
               sns_nick=naverLogin.user.nickname;
               
               confirm("네이버 로그인 성공 "+ naverLogin.user.email + naverLogin.user.nickname + sns_type);
               snsJoinInsert();	//호출
            
//               location.href = "<c:url value='/'/>";
               //window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/"); /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
                 } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
      

   </script>
</body>

</html>