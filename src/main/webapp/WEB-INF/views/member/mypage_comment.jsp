<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>
	
<c:set var="session" value="${sessionScope.login}" scope="application"/>

<div class="mypage">
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu" id="btn1"><a href="/member/mypage_activity">내 활동</a></li>
                <li class="mypage-tapmenu" id="btn2"><a href="/member/mypage_modify">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu" id="btn3"><a href="/member/mypage_board?num=1">내 게시글</a></li>
                <li class="mypage-tapmenu on" id="btn4"><a href="/member/mypage_comment?num=1">내 답변</a></li>
            </ul>
            
		 <div class="mypage-con-column">
		 
        	<h1>답변</h1>
        		
		 	<div class="mypage-boardbox">
		     <a href="#" onclick="deleteAllConfirm(); return false;">전체 삭제</a>
		     
		     
		     <div class="MyCommentCnt" style="text-align:center; margin-top:200px;">
	    		<c:if test="${MyCommentCnt == 0 }">
	    			작성하신 답변이 없습니다!
				</c:if>
			</div>
			
		     
            	<ul>
					<c:forEach items="${answerVO }" var="myComment">
				<li>
					<div class="myquestion">
						<ul class="mypage-board">
							<li> 게시판 | <c:out value=" ${myComment.po_boardname } " /> ${myComment.po_num } ${myComment.po_title }</li>
							<li><h2><a href="<c:url value='/board/notice_view?po_num=${postVO.po_num }' />"><c:out value="${myComment.ans_contents }" /></a></h2></li>
							<li>${myComment.ans_datetime }</li>
						</ul>
						<div class="mypage-boardinfo">
							<div class="myboard-cnt">
								<span style="color:#1d3a6d"><c:out value="${postVO.po_ans_cnt }" /></span>
							</div>
							<ul class="myquestion-manage">
								<!-- 
								<li><a href="#" onclick="modifyComment (${myComment.ans_num}, ${myComment.po_num}); return false;">수정</a></li> -->
				  				<li class="myquestion-remove"><a href="#" onclick="deleteConfirm( ${myComment.ans_num}, ${myComment.po_num});return false;">삭제</a></li>			
							</ul>
						</div>
					</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="paging">
				<div>
					<ul>
						<li><a href="/member/mypage_comment?num=1">처음</a></li>
						<c:if test="${page.prev}">
							<li><a href="/member/mypage_comment?num=${page.startPageNum - 1}">이전</a></li>
						</c:if>
						
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<c:if test="${select != num}">
								<li><a href="/member/mypage_comment?num=${num}">${num}</a></li>	
							</c:if>
							<c:if test="${select == num}">
								<li class="on"><a href="/member/mypage_comment?num=${num}">${num}</a></li>	
							</c:if>
						</c:forEach>
						
						<c:if test="${page.next}">
							<li><a href="/member/mypage_comment?num=${page.endPageNum + 1}">다음</a></li>
						</c:if>
						<li><a href="/member/mypage_comment?num=${page.lastPageNum}">마지막</a></li>
					</ul>
				</div>
			</div> <!-- paging -->
			</div>
	</div>	

</div>


<script>
/* 
$('#btn1').bind('click', function(event) {
	fn_getPage('./mypage_activity');
	});
$('#btn2').bind('click', function(event) {
   fn_getPage('./mypage_modify');
	});
$('#btn3').bind('click', function(event) {
	   fn_getPage('./mypage_board?num=1');
		});
$('#btn4').bind('click', function(event) {
	   fn_getPage('./mypage_comment?num=1');
		}); */

		
function deleteConfirm(ans_num, po_num){
	if(confirm('삭제하시겠습니까?') == true) {
		location.href = "/answer/delete?ans_num=" + ans_num + "&po_num= " + po_num;
	}
}


function deleteAllConfirm(){
	if(confirm('전체 삭제하시겠습니까?') == true) {
		location.href = '/member/mypage_CommentDelete.do';
	}
}


/*
function modifyComment(ans_num, po_num) {
	if(confirm('댓글 수정을 위해 해당 페이지로 이동합니다.') == true) {
		location.href = "/answer/update?ans_num=" + ans_num + "&po_num=" + po_num;
	}
	
}
*/
		



</script>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>