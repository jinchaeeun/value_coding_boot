<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../sub_header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

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
				</div>

				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">가입하기</button>
				</div>
			</form>
		</div>
	
	<div class="button">
		<a href="/login">이전</a>
	</div>
</div>

<!-- 하단 헤더 불러오기 -->
 <jsp:include page="../sub_footer.jsp"></jsp:include>
