<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="../css/style.css">

<div class="mypage">
        <h2><span style="color: #1d3a6d;"><c:out value="${session.me_nickName}"/></span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu" id="btn1"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu" id="btn2"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu on" id="btn3"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu" id="btn4"><a href="#">답변</a></li>
            </ul>
            

	
		 <div class="mypage-con-column">
		 	<div class="mypage-boardbox">
		 	
		 	<!-- 
 		<div class="search-box">
			<div>
				<select name="searchType">
					<option value="title" <c:if test='${page.searchType eq "title"}'>selected</c:if>>제목</option>
					<option value="contents" <c:if test='${page.searchType eq "contents"}'>selected</c:if>>내용</option>
					<option value="title_contents" <c:if test='${page.searchType eq "title_contents"}'>selected</c:if>>제목+내용</option>
					<option value="writer" <c:if test='${page.searchType eq "writer"}'>selected</c:if>>작성자</option>
				</select>
				
				<input type="text" name="keyword" value="${page.keyword}">
				<button type="button" id="searchBtn" onclick="fn_search();">검색</button>
			</div>
		</div> <!-- search-box -->
		 
		
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
				<div>
					<ul>
						<li><a href="/board/notice_list?board=${board}&num=1">처음</a></li>
						<c:if test="${page.prev}">
							<li><a href="/board/notice_list?board=${board}&num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a></li>
						</c:if>
						
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<c:if test="${select != num}">
								<li><a href="/board/notice_list?board=${board}&num=${num}${page.searchTypeKeyword}">${num}</a></li>	
							</c:if>
							<c:if test="${select == num}">
								<li class="on"><a href="/board/notice_list?board=${board}&num=${num}${page.searchTypeKeyword}">${num}</a></li>	
							</c:if>
						</c:forEach>
						
						<c:if test="${page.next}">
							<li><a href="/board/notice_list?board=${board}&num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a></li>
						</c:if>
						<li><a href="/board/notice_list?board=${board}&num=${page.lastPageNum}${page.searchTypeKeyword}">마지막</a></li>
					</ul>
				</div>
			</div> <!-- paging -->
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

<script type="text/javascript">
function fn_search() {
	let searchType = document.getElementsByName("searchType")[0].value;
	let keyword = document.getElementsByName("keyword")[0].value;

	console.log(searchType);
	console.log(keyword);
	
	location.href = "/board/notice_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword; 
}
</script>