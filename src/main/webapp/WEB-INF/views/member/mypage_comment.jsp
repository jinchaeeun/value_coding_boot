<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>	


<div class="mypage-box">
	<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
			<ul class="mypage-tap">
				<li class="mypage-tapmenu" id="mytap1"><a href="<c:url value='/member/mypage'/>" id="mypage-menu1"><span>내 정보 수정</span></a></li>
				<li class="mypage-tapmenu" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
				<li class="mypage-tapmenu on" id="mytap3"><a href="#"><span>나의 댓글</span></a></li>
			</ul>
		
		
	<div class="mypage-form">	
	

	<ul class="myquestion">

		<c:forEach items="${commentVO }" var="myComment">
		<li>
			<h2 class="myquestion-tittle"><a href="<c:url value='/board/notice_view?po_num=${myComment.co_post_num }' />"><c:out value="${myComment.co_comments }" /></a></h2>
			<div class="myquestion-content">
				${myComment.co_datetime }
			</div>
			<!-- BoardVO랑 CommentVO JOIN해서 select po_title, po_boardname from BoardVO where co_post_num = po_num -->
			${myComment.po_num }  ${myComment.po_title } 	| ${myComment.po_boardname } 
			<ul class="myquestion-manage">
				<li><a href="<c:url value='/board/notice_updateView?po_num=${myComment.co_post_num }' />">수정</a></li>
	  			<li class="myquestion-remove"><a href="#" onclick="deleteConfirm();return false;">삭제</a></li>			
			</ul>
		</li>
		</c:forEach>
	</ul>
    <div class="paging">
        <ul>
             <li><a href="#">처음으로</a></li>
            <li><a href="#">이전</a></li>
            <li class="on"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">다음</a></li>
            <li><a href="#">마지막</a></li>
        </ul>
    </div>
    
</div>

</div>
<script>

<!--
function deleteConfirm(){
	if(confirm('삭제하시겠습니까?') == true) {
		location.href = ;
	}
}

-->

</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>