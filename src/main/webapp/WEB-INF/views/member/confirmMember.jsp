<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/join.css?a" rel="stylesheet" type="text/css">
<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
			<form action="confirmMember" method="post" id='f1'>
				<h3 class="text-center">비밀번호 재확인</h3>
				<p class='spanWelcom'>개인정보 보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.</p>
				<div class="form-group has-error myId">
					<label>아이디</label><input type="text" class="form-control" required="required" value="${info.userid }" name='inputMemberPw' id='inputConfirmId' readonly="readonly">
				</div>
				<div class="form-group myPw">
					<label>비밀번호</label><input type="password" class="form-control" required="required" name='inputMemberId' id='inputConfirmPw'>  
				</div>        
				<div class="form-group">               
				<button type="button" class="btn btn-primary btn-lg btn-block" id='btnConfirm'>확인</button>
				<p>${msg }</p>
				</div>
			</form> 
		</div>
	
	</div>	<!-- login-wrapper end -->

</div>	<!-- container end -->

<script>
	$(function(){
		$("#btnConfirm").click(function(){
			var inputMemberId = $("#inputConfirmId").val();
			var inputMemberPw = $("#inputConfirmPw").val();
			
			if(inputMemberPw == ""){
				swal("", "비밀번호를 입력해주세요.", "error");
			} else{
				f1.submit();
			}
		})
	})
</script>

<%@ include file="../include/footer.jsp"%>