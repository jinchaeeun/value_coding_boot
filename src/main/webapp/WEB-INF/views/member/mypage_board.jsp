<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="mypage-box">
	<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
			<ul class="mypage-tap">
				<li class="mypage-tapmenu" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
				<li class="mypage-tapmenu on" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
			</ul>
		
		
	<div class="mypage-form">	



	<ul class="myquestion">
		<c:forEach items="${boardVO }" var="postVO">
		<li>
			<h2 class="myquestion-tittle"><a href="<c:url value='/board/notice_view?po_num=${postVO.po_num }' />"><c:out value="${postVO.po_title }" /></a></h2>
			<div class="myquestion-content">	
				<c:out value=" ${postVO.po_contents }" />
			</div>
			<c:out value=" ${postVO.po_boardname }" /> <c:out value=" ${postVO.po_num }" />
			<div> 답변 수 <span style="color:red"><c:out value="${postVO.po_ans_cnt }" /></span></div>
			<ul class="myquestion-manage">
				<li><a href="<c:url value='/board/notice_updateView?po_num=${postVO.po_num}' />">수정</a></li>
	  			<li class="myquestion-remove"><a href="#" onclick="deleteConfirm(${postVO.po_num});return false;">삭제</a></li>			
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



</script>
<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>