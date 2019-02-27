<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/join.css?a" rel="stylesheet" type="text/css">

<div class="container-fluid loginContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">멤버십 안내</p>
				<p class="engHeadline">Membership</p>
			</div>
			<!-- headline end -->
		</div>
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->


<!-- 로그인화면-->
<div class="container-fluid loginFormContainer">

	<div class="login-wrapper">
	
		<div class="login-form">
			<form action="loginPost" method="post">
				<h3 class="text-center">회원로그인</h3>
				<p class='spanWelcom'>재단법인 대구오페라하우스에 오신 것을 환영합니다.</p>   
				<div class="form-group has-error myId">
					<i class="fas fa-user"></i>
					<input type="text" class="form-control" name="userid" placeholder="아이디" required="required">
				</div>
				<div class="form-group myPw">
					<i class="fas fa-lock"></i>     
					<input type="password" class="form-control" name="userpw" placeholder="비밀번호" required="required">
				</div>        
				<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
				</div>
				<p class='pLost'><a href="#">아이디 · 비밀번호 찾기</a></p>
			</form>
			
			<p class="text-center notMember">회원이 아니시라면?&nbsp;&nbsp;<a href="#" class='btnGoJoinForm'>회원가입</a></p>  
		</div>
	
	</div>	<!-- login-wrapper end -->

</div>	<!-- container end -->



<%@ include file="../include/footer.jsp"%>