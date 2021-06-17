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
					<li>
						<label for="">첨부파일</label>
						<input type="file" id="files" name="po_file_path" multiple="multiple">
					</li>
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
				<a href="#" onclick="document.updateForm.submit();">저장 </a>
			</div>
		</form>
	</div> <!-- notice-write-box -->
	
	
</div> <!-- notice-write-wrap -->

<script type="text/javascript">
ClassicEditor
.create(document.querySelector('#editor'), {
	heading: {
        options: [
            { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
            { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
            { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
            { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' }
        ]
    },
	toolbar: {
		items: [
			'heading',
			'|',
			'fontFamily',
			'fontSize',
			'fontColor',
			'bold',
			'underline',
			'italic',
			'blockQuote',
			'specialCharacters',
			'|',
			'bulletedList',
			'numberedList',
			'indent',
			'outdent',
			'|',
			'codeBlock',
			'insertTable',
			'mediaEmbed',
			'link',
			'imageUpload',
			'undo',
			'redo'
		]
	},
	fontFamily: {
		options: [
			'default',
			'Arial',
			'궁서체',
			'바탕',
			'돋움'
		],
		supportAllValues: true
	},
	language: 'ko',
	image: {
		toolbar: [
			'imageTextAlternative',
			'imageStyle:full',
			'imageStyle:side'
		]
	},
	table: {
		contentToolbar: [
			'tableColumn',
			'tableRow',
			'mergeTableCells',
			'tableCellProperties',
			'tableProperties'
		]
	},
	licenseKey: '',
})
.then(editor => {
	window.editor = editor;
})
.catch(error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	
	console.error( error );
});
</script>
<!-- 하단 푸터 불러오기 -->
<jsp:include page="../sub_footer.jsp"></jsp:include>