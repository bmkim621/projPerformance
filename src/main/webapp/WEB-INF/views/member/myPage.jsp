<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>
<!-- alert plugin -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/join.css?ab" rel="stylesheet" type="text/css">

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
	</div>
	<!-- row end -->
</div>
<!-- container end -->


<div class='container'>
	<div class='titleWrapper'>
		<h2 class='text-center'>마이페이지</h2>
		<hr>
	</div>
                                       
	<div class='joinNoticeWrapper'>
		<h2>기본정보</h2>
		<span id='joinNoticeSpan'><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">표시는 필수입력 항목입니다.</span>
	</div>

	<form action="modifyInfo" method="post" class="form-horizontal" id='f1'>
		<div class="form-group row">

			<label class="col-sm-2 col-form-label" for="id">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name='id' id="id" value="${mvo.id }" style='border:none; background-color: #fff; padding-left: 0; color: #575e96;' readonly="readonly">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="name">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">이름</label>

			<div class="col-sm-3">
				<input type="text" class="form-control" name='memberName' id="name" value="${mvo.memberName }" style='border:none; background-color: #fff; padding-left: 0; color: #575e96;' readonly="readonly">
			</div>  
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="password">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">비밀번호</label>
			<div class="col-sm-3">

				<input type="password" class="form-control" name="password" id='password'>
			</div>
			<div class='col-sm-6'>
				<span class='validationTitle'>6~10자 이내의 소문자/숫자 조합만 가능합니다.</span>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="passwordConfirm">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">
				비밀번호 확인</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" name="passwordConfirm" id='passwordConfirm'>
			</div>
			<div class='col-sm-6'>
				<span></span>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="email"><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">이메일</label>
			<div class="col-sm-10">              
 				<!-- <input type="text" class="form-control" name='email' id="email"> -->
				<input type="text" class="form-control" style="width: 20%; display: inline-block; margin-right: 5px;" id='emailAddr1' name='emailAddr1'>@
						<!-- 직접 입력 시  -->                   
						<input type="text" class="form-control" style="width: 22%; display: inline-block; margin-right: 5px;" disabled="disabled" id='emailAddr2' name='emailAddr2'>
						<select id="selectEmailAddr" name='selectEmailAddr'>
							<option value='hanmail.net' ${fn:substringAfter(mvo.email, '@') eq 'hanmail.net' ? 'selected' : '' }>hanmail.net</option>
							<option value='naver.com' ${fn:substringAfter(mvo.email, '@') eq 'naver.com' ? 'selected' : '' }>naver.com</option>   
							<option value='nate.com' ${fn:substringAfter(mvo.email, '@') eq 'nate.com' ? 'selected' : '' }>nate.com</option>
							<option value='gmail.com' ${fn:substringAfter(mvo.email, '@') eq 'gmail.com' ? 'selected' : '' }>gmail.com</option>
							<option value='hotmail.com' ${fn:substringAfter(mvo.email, '@') eq 'hotmail.com' ? 'selected' : '' }>hotmail.com</option>
							<option value='paran.com' ${fn:substringAfter(mvo.email, '@') eq 'paran.com' ? 'selected' : '' }>paran.com</option>
							<option value='empal.com' ${fn:substringAfter(mvo.email, '@') eq 'empal.com' ? 'selected' : '' }>empal.com</option>
							<option value='korea.com' ${fn:substringAfter(mvo.email, '@') eq 'korea.com' ? 'selected' : '' }>korea.com</option>
							<option value='freechal.com' ${fn:substringAfter(mvo.email, '@') eq 'freechal.com' ? 'selected' : '' }>freechal.com</option>
							<option value='0'>직접 입력</option>
						</select>  
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="phone"><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">연락처</label>
			<div class="col-sm-5">

				<select id="selectPhoneFirst">
					<option value='010' ${fn:substring(mvo.phone, 0, 3) eq '010' ? 'selected' : '' }>010</option>
					<option value='011' ${fn:substring(mvo.phone, 0, 3) eq '011' ? 'selected' : '' }>011</option>   
					<option value='016' ${fn:substring(mvo.phone, 0, 3) eq '016' ? 'selected' : '' }>016</option>
					<option value='017' ${fn:substring(mvo.phone, 0, 3) eq '017' ? 'selected' : '' }>017</option>
					<option value='018' ${fn:substring(mvo.phone, 0, 3) eq '018' ? 'selected' : '' }>018</option>
					<option value='019' ${fn:substring(mvo.phone, 0, 3) eq '019' ? 'selected' : '' }>019</option>  
				</select> -<input type='text' class='form-control phoneNum' style="width: 20%;" id="phoneMiddle" name='phoneMiddle'> -<input type='text' class='form-control phoneNum' style="width: 20%;" id="phoneLast" name='phoneLast'>
					<input type='hidden' id='phoneFirst' name='phoneFirst'>
			</div>
		</div>

		<div class="form-group row" style="height: 190px;">
			<label class="col-sm-2 col-form-label" for="address"><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">
				주소</label>

			<div class="col-sm-6">                      
				<div class="form-group" style='padding: 0px; margin-left: 15px;'>  

					<input class="form-control" style="width: 30%; display: inline;" name="addr1" id="addr1" type="text" readonly="readonly" value="${fn:substring(mvo.address, 1, 6)} ">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>

					<input class="form-control" style="top: 5px; margin-top: 10px;" name="addr2" id="addr2" type="text" readonly="readonly" value='${fn:substringBefore(fn:trim(fn:substringAfter(mvo.address, ")")) , "/")}'/>
					<input class="form-control" style='margin-top: 10px;' name="addr3" id="addr3" type="text" value="${fn:trim(fn:substringAfter(mvo.address, '/')) }"/>
				</div>

			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-12 text-center">
				<button type="button" class="btn" id="btnModifyInfo">나의 정보 변경</button>
				<button type="button" class="btn" id="btnWithdraw">회원 탈퇴</button>
			</div>
		</div>
	</form>

</div>


<script>
	var emailAddr = "${mvo.email}";
//	console.log(emailAddr);
	var emailStr = emailAddr.split('@');
//	console.log(emailStr);
	$("#emailAddr1").val(emailStr[0]);
	$("#emailAddr2").val(emailStr[1]);
	
	//연락처
	var phoneBefore = "${mvo.phone }";
	var phoneStr = phoneBefore.split('-');
	$("#phoneMiddle").val(phoneStr[1]);
	$("#phoneLast").val(phoneStr[2]);
	
	
	//유효성 검사
	function validate(){
		var vdpwd = /^[a-zA-Z0-9]{6,10}$/	//비밀번호
		var vdemail = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/; // 이메일 아이디(시작은 영문으로만, '_'를 제외한 특수문자 안되며 영문, 숫자, '_'으로만 이루어진 5 ~ 12자 이하
		var vdphone2 = /^[0-9]{3,4}$/;
		var vdphone3 = /^[0-9]{4}$/;
		var address = /^[가-힣][0-9]/;
		
		var password = $("#password").val();
		var passwordConfirm = $("#passwordConfirm").val();
		var emailId = $("#emailAddr1").val();
		var phoneMiddle = $("#phoneMiddle").val();
		var phoneLast = $("#phoneLast").val();
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var phoneFirst = $("#selectPhoneFirst option:selected").val();
		
		if(!vdpwd.test(password)){
			swal({
				  text: "올바르지 않은 비밀번호 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#password").val("");
			$("#password").focus();
			
			return false;
		} else if(!(passwordConfirm.slice(0, passwordConfirm.length) === password.slice(0, password.length))){
			swal({
				  text: "비밀번호가 일치하지 않습니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#passwordConfirm").val("");
			$("#passwordConfirm").focus();
			
			return false;
		} else if(!vdemail.test(emailId)){
			swal({
				  text: "올바르지 않은 이메일 아이디 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#emailId").val("");
			$("#emailId").focus();
			
			return false;
		} else if(!vdphone2.test(phoneMiddle)){
			swal({
				  text: "올바르지 않은 전화번호 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#phoneMiddle").val("");
			$("#phoneMiddle").focus();
			
			return false;
		} else if(!vdphone3.test(phoneLast)){
			swal({
				  text: "올바르지 않은 전화번호 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#phoneLast").val("");
			$("#phoneLast").focus();
			
			return false;
		} else if(passwordConfirm == "") {
			swal({
				  text: "비밀번호 확인을 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#passwordConfirm").focus();
	           return false;
	       } else if(password == "") {
			swal({
				  text: "비밀번호를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#password").focus();
	           return false;
	       } else if(emailId == "") {
			swal({
				  text: "이메일 아이디를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#email").focus();
	           return false;
	       } else if(phoneMiddle == "") {
			swal({
				  text: "연락처를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#phoneMiddle").focus();
	           return false;
	       } else if(phoneLast == "") {
			swal({
				  text: "연락처를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#phoneLast").focus();
	           return false;
	       } else if(addr1.value=="") {
			swal({
				  text: "우편번호를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#addr1").focus();
	           return false;
	       } else if(addr2 == "") {
			swal({
				  text: "주소를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#addr2").focus();
	           return false;
	       } else if(password != passwordConfirm) {
			swal({
				  text: "비밀번호가 일치하지 않습니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				});
			$("#passwordConfirm").val("");
			$("#passwordConfirm").focus();
	           return false;
	       } else{
	    	   $('#phoneFirst').val(phoneFirst);
	    	   $("#f1").submit();
//	    	   return true;
	       }	
	}
	
	
	$(function(){
		//이메일 선택
		$("#selectEmailAddr").change(function(){
			$("#selectEmailAddr option:selected").each(function () { 
				if($(this).val() == '0'){	//직접 입력 선택할 경우
					$("#emailAddr2").val(''); //값 초기화 
					$("#emailAddr2").attr("disabled", false); //input창 입력할 수 있도록 활성화
				}else{ //직접입력이 아닐경우 
					$("#emailAddr2").val($(this).text()); 
					//선택값 입력   
					$("#emailAddr2").attr("disabled", true); //이메일 주소 입력하지 못하게 한다.
				} 
			});
		})
		
		//수정 버튼
		$("#btnModifyInfo").click(function(){
			validate();
		})
	})
</script>

<!-- 우편번호 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
//           console.log(data.zonecode);
//	         console.log(fullRoadAddr);
             
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
       
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>




<%@ include file="../include/footer.jsp"%>