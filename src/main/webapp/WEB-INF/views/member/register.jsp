<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){

			$("#submit").on("click", function(){
				if($("#userNickName").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#userNickName").focus();
					return false;
				}
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userPass2").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				
				if($("#userPass").val() != $("#userPass2").val()){
					alert("비밀번호 입력 값이 다릅니다.");
					$("#userPass2").focus();
					return false;
				}
			});
			
				
			
		})
		
		function test_checkbox(){
				
			String[] values = request.getParameterValues("devLang");
				for(String val: values){
					out.print(val+"<br>");
			}

		}	
	</script>

		<div class="join-box">
			<h1>회원가입</h1>
				<div class="join">
					<form action="/member/register" method="post">
						<div class="form-group has-feedback">
							<label class="control-label" for="userNickName">닉네임</label>
							<input class="form-control" type="text" id="userNickName" name="userNickName" placeholder="닉네임"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userId">아이디(이메일)</label>
							<input class="form-control" type="text" id="userId" name="userId"  placeholder="아이디(이메일)"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userPass">비밀번호</label>
							<input class="form-control" type="password" id="userPass" name="userPass" placeholder="비밀번호"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userPass2">비밀번호 확인</label>
							<input class="form-control" type="password" id="userPass2" name="userPass2" placeholder="비밀번호 확인"/>
						</div>
						
						<div class="form-group has-feedback">
							<label class="control-label" for="checkDevLang">선호 개발 언어</label>
							<div class="checkDevLangDiv">
								<ul>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="Java">Java</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="Python">Python</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="JSP">JSP</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="PHP">PHP</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="C">C</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="C++">C++</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="R">R</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="Git">Git</label>
									</li>
									<li>
										<label><input type="checkbox" id="devLang" name="devLang" value="Etc">Etc</label>
									</li>
								</ul>
							</div>
						</div>
						
						<div class="form-group has-feedback">
							<button class="btn btn-success" type="submit" id="submit" onclick="return test_checkbox()">가입하기</button>
						</div>
					</form>
				</div>
			
			<div class="button">
				<a href="/login">이전</a>
			</div>
		</div>
		

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>
