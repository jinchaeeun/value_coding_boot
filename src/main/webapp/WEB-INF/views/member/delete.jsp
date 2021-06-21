<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="mypage">
        <h1><span style="color: #1d3a6d;"><c:out value="${session.me_nickName}"/></span>님 정말 회원탈퇴하시겠습니까?</h1>
        <div class="mypage-form">

			<form method ="post" action="<c:url value='/member/memberDelete'/>">
		     <div class="mypage-con-column">
                <div class="mypage-mod">
				
				<span>아이디(이메일)</span>
				<input type="text" name="me_id" id="mypage_Email" value='<c:out value="${session.me_id}"/>' readonly onfocus="this.blur()" />
				
				<span>비밀번호</span>
				<input type="password" name="me_pass" id="me_pass" placeholder="비밀번호" />
				<div>
					<c:if test="${msg == false}">
						비밀번호가 맞지 않습니다.
					</c:if>
				</div>
				
				<button class="deleteBtn" type="submit" id="submit">회원탈퇴</button>
				<button class="delete_cancle" type="button">취소</button>
				</div>
			</div>	
		</form>
		
	</div>	

</div>


			

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".delete_cancle").on("click", function(){
				
				location.href = "/member/mypage_modify";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#me_pass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#me_pass").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>