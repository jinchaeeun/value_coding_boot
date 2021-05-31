<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="snb-wrap">
	<div>
		<ul>
			<li class="on"><a href="../board/notice.jsp"><span>공지사항</span></a></li>
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
			<li data-aos="fade-up" data-aos-delay="200">
				<div class="no">3</div>
				<div class="title"><a href="./notice_view.jsp">공지사항 입니다.</a></div>
				<div class="writer">관리자</div>
				<div class="date">2021-04-27</div>
				<div class="answer">2</div>
				<div class="hot">10</div>
				
			</li>
			<li data-aos="fade-up" data-aos-delay="300">
				<div class="no">2</div>
				<div class="title"><a href="./notice_view.jsp">공지사항 입니다.</a></div>
				<div class="writer">관리자</div>
				<div class="date">2021-04-27</div>
				<div class="answer">0</div>
				<div class="hot">25</div>
			</li>
			<li data-aos="fade-up" data-aos-delay="400">
				<div class="no">1</div>
				<div class="title"><a href="./notice_view.jsp">공지사항 입니다.</a></div>
				<div class="writer">관리자</div>
				<div class="date">2021-04-27</div>
				<div class="answer">1</div>
				<div class="hot">5</div>
			</li>
		</ul>
	</div> <!-- notice-box -->
	
	<div class="write-btn-box">
		<a href="./notice_write.jsp">글쓰기</a>
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

<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>