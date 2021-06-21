<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="../css/style.css">

<div class="circle-small"></div>
<div class="circle-big"></div>	

<div class="mypage">
        <h2><span style="color: #1d3a6d;">죽전동딩코</span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu" id="btn1"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu" id="btn2"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu" id="btn3"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu on" id="btn4"><a href="#">답변</a></li>
            </ul>
            
	
	
		 <div class="mypage-con-column">
		 	<div class="mypage-boardbox">
		     <a href="#" onclick="deleteAllConfirm(); return false;">전체 삭제</a>
            	<ul>
					<c:forEach items="${commentVO }" var="myComment">
				<li>
					<div class="myquestion">
						<ul class="mypage-board">
							<li> 게시판 | <c:out value=" ${myComment.po_boardname } " /> ${myComment.po_num } ${myComment.po_title }</li>
							<li><h2><a href="<c:url value='/board/notice_view?po_num=${postVO.po_num }' />"><c:out value="${myComment.co_comments }" /></a></h2></li>
							<li>${myComment.co_datetime }</li>
						</ul>
						<div class="mypage-boardinfo">
							<div class="myboard-cnt">
								<span style="color:#1d3a6d"><c:out value="${postVO.po_ans_cnt }" /></span>
							</div>
							<ul class="myquestion-manage">
								<li><a href="<c:url value='/board/notice_updateView?po_num=${postVO.po_num}' />">수정</a></li>
				  				<li class="myquestion-remove"><a href="#" onclick="deleteConfirm(${postVO.po_num});return false;">삭제</a></li>			
							</ul>
						</div>
					</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			
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

</div>


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



function deleteAllConfirm(){
	if(confirm('전체 삭제하시겠습니까?') == true) {
		location.href = '<c:url value='/member/mypage_CommentDelete.do' />';
	}
}

</script>