<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="notice-view-wrap">
	<div class="notice-box">
		<div class="view">
			<h2>공지사항</h2>
			
			<div class="view-hd">
				<p class="title"><b>공지사항 입니다.</b></p>
				<span>답변수 : 1</span>
				<span>조회수 : 5</span>
				<span>등록일 : 2021-04-27</span>
				<span>작성자 : <b>관리자</b></span>
			</div>

			<div class="view-content">
				<p>공지사항 작성 후 출력 되는 페이지 입니다.</p>
				<p>공지사항 작성은 textarea로 작성이 되었습니다.</p>
			</div>

			<div class="view-file">
				<a href="#none"><i class="fa fa-download" aria-hidden="true"></i> 첨부파일 다운로드.jpg</a>
				<a href="#none"><i class="fa fa-download" aria-hidden="true"></i> 첨부파일 다운로드.jpg</a>
			</div>
		</div> <!-- view -->
	</div> <!-- notice-box -->

	<div class="answer-wrap">
		<div class="answer-box">
			<h3>댓글</h3>
			
			<div class="answer">
				<div class="answer-writer">
					<span>관리자</span>
				</div>
				
				<div class="answer-content-box">
					<div class="answer-content">
						<p>공지사항 댓글 입니다.</p>
					</div>
					
					<div class="answer-info">
						<span>2021.05.26 14:55</span>&nbsp;&nbsp;&nbsp;
						<a>답글쓰기</a>
					</div> <!-- answer-info -->
				</div> <!-- answer-content-box -->
			</div> <!-- answer -->
			
			<div class="answer">
				<div class="answer-writer">
					<span>관리자</span>
				</div>
				
				<div class="answer-content-box">
					<div class="answer-content">
						<p>공지사항 댓글 입니다.</p>
					</div>
					
					<div class="answer-info">
						<span>2021.05.26 14:55</span>&nbsp;&nbsp;&nbsp;
						<a>답글쓰기</a>
					</div> <!-- answer-info -->
				</div> <!-- answer-content-box -->
			</div> <!-- answer -->
			
			<div class="answer">
				<div class="answer-writer">
					<span>관리자</span>
				</div>
				
				<div class="answer-content-box">
					<div class="answer-content">
						<p>공지사항 댓글 입니다. 길게 한번 써봤습니다. 엔터가 안먹히는 이유가 뭘까요?<br>모르겠습니다.</p>
					</div>
					
					<div class="answer-info">
						<span>2021.05.26 14:55</span>&nbsp;&nbsp;&nbsp;
						<a>답글쓰기</a>
					</div> <!-- answer-info -->
				</div> <!-- answer-content-box -->
			</div> <!-- answer -->

			<div class="answer-write-wrap">
				<div class="answer-write-box">
					<p>로그인한 사람의 닉네임</p>
					<textarea rows="" cols="" placeholder="댓글을 남겨주세요."></textarea>
					<input type="button" value="등록">
				</div>
			</div>
		</div> <!-- answer-box -->
	</div> <!-- answer-wrap -->
	
	<div class="write-btn-box">
		<a href="./notice_list.jsp">목록으로</a>
		<a href="./notice_write.jsp">수정</a>
		<a href="#none">삭제</a>
	</div>
</div> <!-- notice-view-wrap -->
<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>