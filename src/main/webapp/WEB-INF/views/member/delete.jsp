<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}	
		});
		
			
		
	})
</script>
<div class="circle-small"></div>
<div class="circle-big"></div>


	<div class="mypage-box">
		<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
			<ul class="mypage-tap">
				<li class="mypage-tapmenu on" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
				<li class="mypage-tapmenu" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
			</ul>
		
		<form method ="post" action="<c:url value='/member/memberDelete'/>">
		<div class="mypage-form">
				<span>아이디(이메일)</span>
				<input type="text" name="me_id" id="mypage_Email" value='<c:out value="${session.me_id}"/>' readonly onfocus="this.blur()" />
				
				<!-- <span>비밀번호</span>
				<input type="password" name="me_pass" id="me_pass" placeholder="비밀번호" />
				 -->
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				.
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>	
			</form>
			
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
	</div>

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/member/mypage";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>