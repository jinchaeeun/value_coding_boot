<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../js/ckeditor5/sample/styles.css">
<script type="text/javascript" src="../js/ckeditor5/build/ckeditor.js"></script>

<div class="notice-write-wrap">
	<div class="notice-write-box">
		<h1>글쓰기</h1>

		<form action="/board/notice_update" name="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="po_num" value='<c:out value="${update.po_num}" />'>
			<div class="write-form">
				<ul>
					<li>
						<label for="">제목</label>
						<input class="title" type="text" name="po_title" placeholder="제목을 입력하세요" value="<c:out value='${update.po_title}' />">
						
						<select name="po_boardname" id="">
							<option value="<c:out value='${update.po_boardname}' />"><c:out value='${update.po_boardname}' /></option>
							<option value="공지사항">공지사항</option>
							<option value="자유게시판">자유게시판</option>
							<option value="언어">언어</option>
							<option value="데이터베이스">데이터베이스</option>
							<option value="데이터과학">데이터과학</option>
							<option value="개발도구">개발도구</option>
							<option value="프로젝트 관리">프로젝트 관리</option>
						</select>
					</li>
					<li>
						<label for="">내용</label>
						<textarea name="po_contents" id="editor"><c:out value='${update.po_contents}' /></textarea>
					</li>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="file">
							<div>
								<a href="/board/downloadFile?fi_num=${file.fi_num}&po_num=${file.po_num}">
									<i class="fa fa-download" aria-hidden="true"></i><c:out value=" ${file.fi_ori_filename}"/>[${file.fi_filesize}kb]
								</a>
								<a href="#" onclick="javascript:confirmDeleteFile(${file.fi_num}, ${file.po_num});">[삭제]</a>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<li>
							<label for="">첨부파일</label>
							<input type="file" id="files" name="files" multiple="multiple">
						</li>
					</c:if>
					
					<li class="check-box"> <!-- 관리자가 로그인 했을 때만 보이도록함 -->
						<label for="">공지 선택</label>
						<div class="checkbox">
							<input type="checkbox" id="check-notice" name="po_noticeYn"> 
							<label for="check-notice" class="check-text">선택시 공지사항</label>
						</div>
					</li>
				</ul>
			</div> <!-- write-form -->
			
			<div class="write-btn-box">
				<a href="/board/notice_list?num=1">목록으로</a>
				<a href="#" onclick="javascript:fn_check();">저장</a>
			</div>
		</form>
	</div> <!-- notice-write-box -->
	
	
</div> <!-- notice-write-wrap -->

<script type="text/javascript">
	function fn_check() {
		var po_title = $("input[name=po_title]").val();
		var po_contents = CKEDITOR.instances.editor.getData();
		console.log(po_contents);
		var po_boardname = $("select[name=po_boardname]").val();
		
		if(po_title == '') {
			alert('제목을 작성해주세요');
		}
		else if(po_boardname == '') {
			alert('게시판을 선택해주세요');
		}
		else if(po_contents == '') {
			alert('내용을 작성해주세요');
		}
		else {
			document.writeForm.submit();
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