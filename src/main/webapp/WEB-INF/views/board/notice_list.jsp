<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="snb-wrap">
	<div>
		<ul>
			<li class="on"><a href="/board_list"><span>공지사항</span></a></li>
			<li><a href="#none"><span>자유게시판</span></a></li>
		</ul>
	</div>
</div>

<div class="notice-wrap">
	<div class="search-box">
		<div>
			<input type="text">
			<button>검색</button>
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
					<div class="title"><a href="/board_view"><c:out value="${list.po_title}" /></a></div>
					<div class="writer"><c:out value="${list.po_writer}" /></div>
					<div class="date"><fmt:formatDate value="${list.po_datetime}" pattern="yyyy-MM-dd"/> </div>
					<div class="answer"><c:out value="${list.po_views}" /></div>
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
				<li><a href="#none">처음으로</a></li>
				<li><a href="#none">이전</a></li>
				<li class="on"><a href="#none">1</a></li>
				<li><a href="#none">2</a></li>
				<li><a href="#none">3</a></li>
				<li><a href="#none">다음</a></li>
				<li><a href="#none">마지막</a></li>
			</ul>
		</div>
	</div> <!-- paging -->
</div> <!-- notice-wrap -->


<script type="text/javascript">
 	var msg = '<c:out value="${msg}" />';
	
	if(msg != '')
		alert(msg);
</script>

<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>