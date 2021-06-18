<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="notice-view-wrap">
	<div class="notice-box">
		<div class="view">
			<h2><c:out value="${board}"/></h2>
	
			<div class="view-hd">
				<p class="title"><b><c:out value="${read.po_title}" /></b></p>
				<span>답변수 : <c:out value="${answerCnt}" /></span>
				<span>조회수 : <c:out value="${read.po_views}" /></span>
				<span>등록일 : <fmt:formatDate value="${read.po_datetime}" pattern="yyyy-MM-dd"/></span>
				<span>작성자 : <b><c:out value="${read.po_writer}" /></b></span>
			</div>

			<div class="view-content">
			<p>${read.po_contents}</p>
				<c:out value="" escapeXml="false"/>
			</div>

			<c:if test="${not empty fileList}">
				<div class="view-file">
					<c:forEach items="${fileList}" var="file">
						<div>
							<a href="/board/downloadFile?fi_num=${file.fi_num}&po_num=${file.po_num}">
								<i class="fa fa-download" aria-hidden="true"></i><c:out value=" ${file.fi_ori_filename}"/>[${file.fi_filesize}kb]
							</a>
							<a href="#" onclick="javascript:confirmDeleteFile(${file.fi_num}, ${file.po_num});">[삭제]</a>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div> <!-- view -->
	</div> <!-- notice-box -->
	
	<div class="answer-wrap">
		<div class="answer-box">
			<h3>댓글</h3>
			
			<c:forEach items="${answerList}" var="answer">
				<div class="answer">
					<div class="answer-writer">
						<span><c:out value="${answer.ans_writer}" /></span>
					</div>
					
					<div class="answer-content-box">
						<div class="answer-content">
							<p class="ans-contents" id="ans_num${answer.ans_num}"><c:out value="${answer.ans_contents}" /></p>
						</div>
						
						<div class="answer-info">
							<span><fmt:formatDate value="${answer.ans_datetime}" pattern="yyyy-MM-dd" /></span>
							<a href="#none" onclick="javascript:updateAnswerDetail(${answer.ans_num}, '${answer.ans_contents}'); return false;">수정</a>
							<a href="/answer/delete?ans_num=${answer.ans_num}&po_num=${read.po_num}">삭제</a>
							<a>답글쓰기</a>
						</div> <!-- answer-info -->
					</div> <!-- answer-content-box -->
				</div> <!-- answer -->
			</c:forEach>
			
			<form action="/answer/write" method="post" name="answerForm">
				<div class="answer-write-wrap">
					<div class="answer-write-box">
						<p><c:out value="${session.me_nickName}"/><input type="hidden" name="ans_writer" value=""></p>
						<textarea rows="" cols="" name="ans_contents" placeholder="댓글을 남겨주세요."></textarea>
						<input type="hidden" name="po_num" value="${read.po_num}"/>
						<input type="button" onclick="answerSubmit();" value="등록"/>
					</div>
				</div>
			</form>
			
		</div> <!-- answer-box -->
	</div> <!-- answer-wrap -->
	
	<div class="write-btn-box">
		<a href="/board/notice_list?board=${board}&num=1">목록으로</a>
		<a href="/board/notice_updateView?po_num=${read.po_num}">수정</a>
		<a href="#" onclick="javascript:noticeDelete();">삭제</a>
	</div>
</div> <!-- notice-view-wrap -->

<script type="text/javascript">
	function noticeDelete() {
		if(confirm('삭제하시겠습니까?') == true) {
			location.href = "/board/notice_delete?po_num=${read.po_num}";
		}
	}	
	
	function answerSubmit() {
		var ans_contents = $('ans_contents').val();
		
		if(ans_contents == '') {
			alert("답글을 입력하세요.");
		}
		else {
			document.answerForm.submit();
		}
	}
	
	function updateAnswerDetail(ans_num, ans_contents) {
		var htmls = '';
		
		htmls += '<form action="/answer/update?ans_num='+ans_num+'&po_num=${read.po_num}" method="post" name="update_answer_form">';
		htmls += '<textarea name="update-answer-contents" rows="" cols="" style="width:100%; height: 100px;">'+ans_contents+'</textarea>';
		htmls += '<a href="#none">취소 </a>';
		htmls += '<a href="#none" onclick="update_answer_form_submit();"> 완료</a>';
		htmls += '</form>';		
		
		$("#ans_num"+ans_num).replaceWith(htmls);
	}
	
	function update_answer_form_submit() {
		var contents = $("update-answer-contents");
		
		if(contents == '') {
			alert("답글을 입력하세요!");
		}
		else {
			document.update_answer_form.submit();
		}
	}
	
	function confirmDeleteFile(fi_num, po_num) {
		if(confirm("삭제하시겠습니까?") == true) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/board/deleteFile' />",
				dataType : "JSON",
				data : {"fi_num" : fi_num, "po_num" : po_num},
				success : function(data) {
					if(data.success == "true") {
						location.reload();
					}
					else {
						alert("파일 삭제가 실패했습니다.");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		}
	}
</script>

<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>