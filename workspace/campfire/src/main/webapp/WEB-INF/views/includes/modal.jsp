<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>모닥불</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/layout.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/title-icon.png">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<body class="is-preload">

				<!-- modal -->	
				<div class="modal-wrapper">
					<div class="modal loginModal">
						<div class="head-pop"><h2>로그인</h2>
						</div>
						<form name="" action="#" method="" >
							<div class="row gtr-uniform">
								<div class="col-10 col-11-xsmall" style="margin: 0 auto; margin-top: 10%; padding:0;">
									<label for="userId">아이디</label>
									<input type="text" name="userId" id="userId" placeholder="ID">
									<label for="userPw" style="margin-top: 15px;">비밀번호</label>
									<input type="password" name="userPw" id="userPw" placeholder="PASSWARD">
									<div><a href="javascript:void(0);" id="goSignUpBtn" style="text-decoration: none;">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#" id="findIdPw" style="text-decoration: none;">아이디/비밀번호 찾기</a></div>
									<ul class="actions">
										<li>
											<a><img id="kakaoImage" style="height: 46px;" src="/resources/images/kakaoLogin.png"></a>
											<a><img id="kakaoImageLarge" style="height: 46px; width: 100%;" src="/resources/images/kakaoLoginLarge.png"></a>
										</li>
										<li>
											<a class="button primary" id="loginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
										</li>
									</ul>
								</div>        
							</div>
						</form>
					</div>
		
					<div class="modal findModal" style="display:none;">
						<div class="head-pop">
							<div style="width: 49%; display: inline-block;"><a href="javascript:void(0);" id="findIdBtn" style="text-decoration: none;">
								<h2 style="color: #2388fa;">아이디 찾기</h2>
							</a></div>
							<div style="width: 49%; display: inline-block;"><a href="javascript:void(0);" id="findPwBtn" style="text-decoration: none;">
								<h2>비밀번호 찾기</h2>
							</a></div>
						</div>
						<hr style="margin: 25px;">
						<!-- 아이디찾기 -->
						<form name="findIdForm" action="#" method="" >
							<div class="row gtr-uniform">
								<div class="col-10 col-11-xsmall" style="margin: 0 auto; margin-top: 10%;">
									<h3 class="cautionMsg" style="text-align: center;">가입에 등록한 이메일을 입력해주세요.</h3>
									<label for="userEmail2">이메일</label>
									<input type="email" name="userEmail" id="userEmail2" placeholder="EMAIL">
									<ul class="actions">
										<li id="centerBtn">
											<a href="javascript:goSignIn2()" class="button primary" class="goLoginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
										</li>
										<li id="centerBtn">
											<a class="button primary" id="goFindIdBtn" style="border-radius: 6px; height: 46px;">아이디 찾기</a>
										</li>
									</ul>
								</div>        
							</div>
						</form>
						<!-- 비밀번호 찾기 -->
						<form name="findPwForm" action="#" method="" style="display: none;">
							<div class="row gtr-uniform">
								<div class="col-10 col-11-xsmall" style="margin: 0 auto;">
									<h3 class="cautionMsg" style="text-align: center;">가입에 등록한 이메일을 입력해주세요.<br>해당 이메일로 비밀번호 변경 링크를 발송합니다.</h3>
									<label for="userId3">아이디</label>
									<input type="text" name="userId" id="userId3" placeholder="ID">
									<label for="userEmail3">이메일</label>
									<input type="email" name="userEmail" id="userEmail3" placeholder="EMAIL">
									<ul class="actions">
										<li id="centerBtn">
											<a href="javascript:goSignIn2()" class="button primary" style="border-radius: 6px; height: 46px;">로그인</a>
										</li>
										<li id="centerBtn">
											<a class="button primary" style="border-radius: 6px; height: 46px;">이메일 발송</a>
										</li>
									</ul>
								</div>        
							</div>
						</form>
					</div>
		
					<div class="modal signUpModal" style="display:none;">
						<div class="backFa" style="display: none; text-align: right; margin-right: 2%;">
							<span class="fa fa-hand-point-up" style="font-size: 12px;">나가기</span>
						</div>
						<div class="head-pop">
							<div style="width: 49%; display: inline-block;"><h2>회원가입</h2></div>
						</div>
						<form name="" action="#" method="">
							<div class="row gtr-uniform">
								<div class="col-10 col-11-xsmall" style="margin: 0 auto; padding: 0;">
									<span style="color: red;">* </span><span style="font-weight: bold;">아이디</span><span style="font-size: small; color: red;
										font-family:sans-serif;"> (* 영문 혹은 영문+숫자 조합, 12길이)</span>
									<input type="text" name="memberId" id="memberId" maxlength="12"/>
									<font id="idCheck2_text" size="3"></font> 
									<font id="idCheck_text" size="2"></font>
									<br>
									<span style="color: red;">* </span><span style="font-weight: bold;">비밀번호</span>
									<span style="font-size: 12px; font-family:Verdana, Geneva, Tahoma, sans-serif; color: red;">
											(* 영문+숫자+대소문자 조합 8자이상 입력) </span>
									<input type="password" name="memberPw" id="memberPw"/>
									<br>
									<span style="color: #ff0000;">* </span><span style="font-weight: bold;">비밀번호 확인 </span>
									<input type="password" name="memberPw2" id="memberPw2" />
									<font id="pwCheck_text" size="3" style="text-align: right;"></font>
									<br>
									<span style="color: red;">* </span><span style="font-weight: bold;">이메일</span>
								<br>
									<input class="mediaInput" type="email" name="memberEmail" style="width:66%; float:left" placeholder="abc@gmail.com" />
									<a href="javascript:EmailCheck();" class="btn-right"
									type="submit" style="font-size: 14px; border-radius: 6px; width: 34%;">
									인증번호 전송</a>
									<br><br>
									<div class="mail_verify_input_box" id="mail_verify_input_box_false">
									<input class="mediaInput" type="text" name="verify" id="verify" class="verify" style="width:66%; float:left" placeholder="7자리" disabled="disabled" />
									<a href="javascript:verifyCheck();" class="btn-right"
									type="submit" style="font-size: 14px; border-radius: 6px; width: 34%;">
									인증번호 확인</a>
									</div>
									<font id="verify_check" size="3"></font>
									
									<input type="checkbox" id="Agree" name="Agree">
									<label for="Agree" style="margin-top: 3%;">
										<span style="color:crimson; font-size: 14px;">*[필수] <b>홈페이지 이용약관 동의</b> </span>
									</label> 
								<br>
								<div style="text-align: center;">
									<a id="submit" href="javascript:formSubmit()" class="btn-right" type="submit" 
									style="border-radius: 6px; margin: 0 auto;">가입하기</a>
								</div>
								</div>        
							</div>
						</form>
		
					</div>
				</div>


	</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<!-- modal -->
<script src="/resources/assets/js/modal.js"></script>
<!-- modal end -->

</html>