<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="mypage-box">
	<h1>김나현님 마이페이지</h1>
		<ul class="mypage-tap">
			<li class="mypage-tapmenu on" id="mytap1"><a href="#" id="mypage-menu1"><span>내 정보 수정</span></a></li>
			<li class="mypage-tapmenu" id="mytap2"><a href="#"><span>나의 게시물</span></a></li>
		</ul>
	
	<div class="mypage" id="ajax_div">
			<span>닉네임</span>
			<input type="text" placeholder="닉네임" />
			<div class="nick_check">이미 사용 중인 닉네임입니다.</div>
			<span>아이디(이메일)</span>
			<input type="text" id="mypage_Email" placeholder="value_coding@naver.com" readonly onfocus="this.blur()" />
			
			<span>비밀번호</span>
			<input type="password"  placeholder="비밀번호" />
			
			<span>비밀번호 확인</span>
			<input type="password"  placeholder="비밀번호 확인" />
			
			<span>선호 개발 언어</span>
			<div class="checkDevLangDiv">
				<ul>
					<li>
						<label><input type="checkbox" name="devLang" value="Java">Java</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="Python">Python</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="JSP">JSP</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="PHP">PHP</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="C">C</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="C++">C++</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="R">R</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="Git">Git</label>
					</li>
					<li>
						<label><input type="checkbox" name="devLang" value="Etc">Etc</label>
					</li>
				</ul>
			</div>
			<button>회원 정보 수정</button>
		</div>	
</div>

<script>
$('#mytap1').bind('click', function(event) {
	   fn_getPage('./mypage01.jsp');
	   
	    $(this).addClass('on');
	    $('#mytap2').removeClass('on');
	});
	
$('#mytap2').bind('click', function(event) {
fn_getPage('./mypage02.jsp');

		$(this).addClass('on');
		$('#mytap1').removeClass('on');
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
