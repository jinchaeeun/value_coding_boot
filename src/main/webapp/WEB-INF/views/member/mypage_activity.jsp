<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>	


<c:set var="session" value="${sessionScope.login}" scope="application"/>

<div id="ajax_div">
	
    <div class="mypage">
        <h2><span style="color: #1d3a6d;"><c:out value="${session.me_nickName}"/></span>의 마이페이지</h2>
        <div class="mypage-form">
            <ul class="mypage-tap">
                <li class="mypage-tapmenu on" id="btn1"><a href="#">내 활동</a></li>
                <li class="mypage-tapmenu" id="btn2"><a href="#">정보 수정</a></li>
                <hr>
                <li class="mypage-tapmenu" id="btn3"><a href="#">게시글</a></li>
                <li class="mypage-tapmenu" id="btn4"><a href="#">답변</a></li>
            </ul>




            <div class="mypage-con">
                <div class="left-dash">
                    <ul class="mymy">
                        <li><img src="../img/user.png" alt="" width="100px;"></li>
                        <li class="mypage_nick"><b><c:out value="${session.me_nickName}"/></b></li>
                        <li><c:out value="${session.me_devLang}"/></li>
                        <li><c:out value="${session.me_regDate}"/></li>
                    </ul>
                </div>
                <div class="right-dash">
                    <ul class="activity">
                        <li class="myPost">
                            <div class="activity-title">총 게시물</div>
                            <div class="activity-con"><c:out value="${MyPostCnt}"/></div>
                        </li>
                        <li class="myPost">
                            <div class="activity-title">총 댓글</div>
                            <div class="activity-con"><c:out value="${MyCommentCnt}"/></div>    
                        </li>
                        <!-- 
                        <li class="myPost">
                            <div class="activity-title">총 방문 수</div>
                            <div class="activity-con">5</div>     
                        </li>
                        
                         -->
                    </ul>
                    
                </div>
 
            </div>
        </div>
        
        
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

$('.on').bind('click', function(event) {
	console.log("btn1 click");
	fn_getPage('./mypage_activity');
	console.log("btn1 click after");
	});
$('#btn2').bind('click', function(event) {
	console.log("btn2 click");
   fn_getPage('./mypage_modify');
	});
$('#btn3').bind('click', function(event) {
	   fn_getPage('./mypage_board');
		});
$('#btn4').bind('click', function(event) {
	   fn_getPage('./mypage_comment');
		});

	function fn_getPage(url) {
	   $.ajax({
		url : url,
		type : 'post',
		data : {
				test : '1', 
				test: '2',
				}, //get-> sample11_1.jsp&test=1
		dataType : 'html', // html, json, xml
		beforeSend : function(){
			//로딩.........show
		},

		success : function(data){
	         $('#ajax_div').html(data);
		},
		
		error : function(){
			//alert('오류 발생')
		},
		complete : function(){
			//hide	
		}
	});
}

</script>


<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>
 