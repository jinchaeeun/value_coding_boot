<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="mypage">
        <h2><span style="color: #1d3a6d;">죽전동딩코</span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu on"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu"><a href="#">답변</a></li>
            </ul>
            

	
		 <div class="mypage-con-column">
		 	<div class="mypage-boardbox">
		     <a href="#" onclick="deleteAllConfirm(); return false;">전체 삭제</a>
            	<ul>
					<c:forEach items="${boardVO }" var="postVO">
				<li>
					<div class="myquestion">
						<ul class="mypage-board">
							<li> 게시판 | <c:out value=" ${postVO.po_boardname }" /> <c:out value=" ${postVO.po_num }" /></li>
							<li><h2><a href="<c:url value='/board/notice_view?po_num=${postVO.po_num }' />"><c:out value="${postVO.po_title }" /></a></h2></li>
							<li><c:out value=" ${postVO.po_contents }" /></li>
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
$('#mytap1').bind('click', function(event) {
	   fn_getPage('./mypage');
	   
	    $(this).addClass('on');
	    $('#mytap2').removeClass('on');
	    $('#mytap3').removeClass('on');
	});
	
$('#mytap2').bind('click', function(event) {
fn_getPage('./mypage_board');

		$(this).addClass('on');
		$('#mytap1').removeClass('on');
		$('#mytap3').removeClass('on');
	});


	
	
 
function deleteConfirm(po_num){
	if(confirm('삭제하시겠습니까?') == true) {
		location.href = '/board/notice_delete?po_num=' + po_num;
	}
}

function deleteAllConfirm(){
	if(confirm('전체 삭제하시겠습니까?') == true) {
		location.href = '<c:url value='/member/mypage_BoardDelete.do' />';
	}
}

</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>