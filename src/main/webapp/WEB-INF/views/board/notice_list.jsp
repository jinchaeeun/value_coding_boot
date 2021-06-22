<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="notice-wrap">
	<h1 class="board-name"><c:out value="${board}"/></h1>
	
	<div class="search-box">
		<div>
			<select name="searchType">
				<option value="title" <c:if test='${page.searchType eq "title"}'>selected</c:if>>제목</option>
				<option value="contents" <c:if test='${page.searchType eq "contents"}'>selected</c:if>>내용</option>
				<option value="title_contents" <c:if test='${page.searchType eq "title_contents"}'>selected</c:if>>제목+내용</option>
				<option value="writer" <c:if test='${page.searchType eq "writer"}'>selected</c:if>>작성자</option>
			</select>
			
			<input type="text" name="keyword" value="${page.keyword}">
			<button type="button" id="searchBtn" onclick="fn_search('${board}');">검색</button>
		</div>
	</div> <!-- search-box -->

	<div class="notice-box" data-aos="flip-left" data-aos-delay="100">
		<ul class="th">
			<li>
				<div class="no">번호</div>
				<div class="title">제목</div>
				<div class="writer">작성자</div>
				<div class="date">작성일</div>
				<div class="answer">답변수</div>
				<div class="hot">조회수</div>		
			</li>
		</ul>
		
		<ul class="td">
			<c:forEach items="${list}" var="list">
				<li data-aos="fade-up" data-aos-delay="200">
					<div class="no"><c:out value="${list.po_num}" /></div>
					<div class="title"><a href="/board/notice_view?po_num=${list.po_num}"><c:out value="${list.po_title}" /></a></div>
					<div class="writer"><c:out value="${list.po_writer}" /></div>
					<div class="date"><fmt:formatDate value="${list.po_datetime}" pattern="yyyy-MM-dd"/></div>
					<div class="answer"><c:out value="${list.po_ans_cnt}" /></div>
					<div class="hot"><c:out value="${list.po_views}" /></div>
				</li>
			</c:forEach>
		</ul>
	</div> <!-- notice-box -->
	
	<div class="write-btn-box">
		<a href="/board/notice_write">글쓰기</a>
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
</div> <!-- notice-wrap -->


<script type="text/javascript">
 	var msg = '<c:out value="${msg}" />';
	
	if(msg != '')
		alert(msg);
</script>

<script type="text/javascript">
	function fn_search(boardName) {
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
	
		console.log(searchType);
		console.log(keyword);
		
		location.href = "/board/notice_list?board="+ boardName +"&num=1" + "&searchType=" + searchType + "&keyword=" + keyword; 
	}
	/* document.getElementById("searchBtn").onClick = function() {
		let searchKey = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
	
		console.log(searchKey);
		console.log(keyword);
		
		location.href = "board/notice_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword; 
	} */
</script>

<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>