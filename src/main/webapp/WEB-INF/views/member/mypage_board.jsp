<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 상단 헤더 불러오기 -->
<jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>


<div class="mypage-box">
	<h1><span class="usr_nickname"><c:out value="${session.me_nickName}"/></span>님 마이페이지</h1>
	<ul class="mypage-tap">
		<li class="mypage-tapmenu" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
		<li class="mypage-tapmenu on" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
	</ul>
		
		
	<div class="mypage-form">	
	<ul class="myquestion">
		<li>
			<h2 class="myquestion-tittle"><a href="#">Java 관련 질문</a></h2>
			<div class="myquestion-content">
			자바 관련 질문 내용시스템에서 더 이상 사용하지 않는 동적 할당된 메모리 블록을 찾아 자동으로 다시 사용 가능한 자원으로 회수 하는 것. 시스템에서 가비지 컬렉션을 수행하는 부분을 가비지 컬렉터라 부른다. 고로 자바에서는 메모리 문제를 신경쓰지 않아도 된다!
			</div>
			
			<ul class="myquestion-manage">
				<li><a href="#">수정</a></li>
	  			<li class="myquestion-remove"><a href="#">삭제</a></li>			
			</ul>
		</li>
		<li>
			<h2 class="myquestion-tittle"><a href="#">Java 관련 질문</a></h2>
			<div class="myquestion-content">
			자바 관련 질문 내용시스템에서 더 이상 사용하지 않는 동적 할당된 메모리 블록을 찾아 자동으로 다시 사용 가능한 자원으로 회수 하는 것. 시스템에서 가비지 컬렉션을 수행하는 부분을 가비지 컬렉터라 부른다. 고로 자바에서는 메모리 문제를 신경쓰지 않아도 된다!
			</div>
			
			<ul class="myquestion-manage">
				<li><a href="#">수정</a></li>
	  			<li class="myquestion-remove"><a href="#">삭제</a></li>			
			</ul>
		</li>
		<li>
			<h2 class="myquestion-tittle"><a href="#">Java 관련 질문</a></h2>
			<div class="myquestion-content">
			자바 관련 질문 내용시스템에서 더 이상 사용하지 않는 동적 할당된 메모리 블록을 찾아 자동으로 다시 사용 가능한 자원으로 회수 하는 것. 시스템에서 가비지 컬렉션을 수행하는 부분을 가비지 컬렉터라 부른다. 고로 자바에서는 메모리 문제를 신경쓰지 않아도 된다!
			</div>
			
			<ul class="myquestion-manage">
				<li><a href="#">수정</a></li>
	  			<li class="myquestion-remove"><a href="#">삭제</a></li>			
			</ul>
		</li>
		<li>
			<h2 class="myquestion-tittle"><a href="#">Java 관련 질문</a></h2>
			<div class="myquestion-content">
			자바 관련 질문 내용시스템에서 더 이상 사용하지 않는 동적 할당된 메모리 블록을 찾아 자동으로 다시 사용 가능한 자원으로 회수 하는 것. 시스템에서 가비지 컬렉션을 수행하는 부분을 가비지 컬렉터라 부른다. 고로 자바에서는 메모리 문제를 신경쓰지 않아도 된다!
			</div>
			
			<ul class="myquestion-manage">
				<li><a href="#">수정</a></li>
	  			<li class="myquestion-remove"><a href="#">삭제</a></li>			
			</ul>
		</li>
	
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
	});
	
$('#mytap2').bind('click', function(event) {
fn_getPage('./mypage02');

		$(this).addClass('on');
		$('#mytap1').removeClass('on');
	});
</script>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>