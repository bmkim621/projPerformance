<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/join.css?bb" rel="stylesheet" type="text/css">
<!-- alert plugin -->
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
	</div>
	<!-- row end -->
</div>
<!-- container end -->


<div class='container'>
	<div class='titleWrapper'>
		<h2 class='text-center'>회원가입</h2>
		<hr>
	</div>

	<div class='joinNoticeWrapper'>
		<h2>기본정보</h2>
		<span id='joinNoticeSpan'><img
			src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">표시는
			필수입력 항목입니다.</span>
	</div>

	<form action="joinForm" method="post" class="form-horizontal" id='f1'>

		<div class="form-group row">

			<label class="col-sm-2 col-form-label" for="id">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name='id' id="id">
			</div>
			<div class='col-sm-6'>
				<button type="button" id='btnIdCheck'>
					<img src="${pageContext.request.contextPath }/resources/images/btn_id_check.gif">
				</button>
				<span class='validationTitle'>4~10자리 이내의 영문/숫자만 사용하실 수 있습니다.</span>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="name">
			<img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">이름</label>

			<div class="col-sm-3">
				<input type="text" class="form-control" name='memberName' id="name">
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
			<div class="col-sm-5">
				<input type="text" class="form-control" name='email' id="email">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="phone"><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">연락처</label>
			<div class="col-sm-5">

				<select id="selectPhoneFirst">
					<option value='010'>010</option>
					<option value='011'>011</option>   
					<option value='016'>016</option>
					<option value='017'>017</option>
					<option value='018'>018</option>
					<option value='019'>019</option>
				</select> -<input type='text' class='form-control phoneNum' style="width: 20%;" id="phoneMiddle" name='phoneMiddle'> -<input type='text' class='form-control phoneNum' style="width: 20%;" id="phoneLast" name='phoneLast'>
					<input type='hidden' id='phoneFirst' name='phoneFirst'>
			</div>
		</div>

		<div class="form-group row" style="height: 190px;">
			<label class="col-sm-2 col-form-label" for="address"><img src="${pageContext.request.contextPath }/resources/images/ico_ness.gif">
				주소</label>

			<div class="col-sm-6">
				<div class="form-group" style='padding: 0px;'>

					<input class="form-control" style="width: 30%; display: inline;"
						name="addr1" id="addr1" type="text" readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>

					<input class="form-control" style="top: 5px; margin-top: 10px;"
						name="addr2" id="addr2" type="text" readonly="readonly" /> <input
						class="form-control" style='margin-top: 10px;' name="addr3"
						id="addr3" type="text" />
				</div>

			</div>



		</div>

		<div class="form-group">
			<div class="col-sm-12 text-center">

				<button type="button" class="btn" id="btnSignUp" disabled="disabled">가입완료</button>
			</div>
		</div>
	</form>

</div>
  




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
           console.log(data.zonecode);
	        console.log(fullRoadAddr);
             
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
       
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

</script>

<script>
	//유효성 검사
	function validate(){
		var vdid = /^[a-z0-9]{4,10}$/; // 아이디가 적합한지 검사할 정규식
		var vdpwd = /^[a-zA-Z0-9]{6,10}$/	//비밀번호
		var vdemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
		var vdname = /^[가-힣]{2,4}$/;
		var vdphone2 = /^[0-9]{3,4}$/;
		var vdphone3 = /^[0-9]{4}$/;
		var address = /^[가-힣][0-9]/;
		
		var id = $("#id").val();
		var name = $("#name").val();
		var password = $("#password").val();
		var passwordConfirm = $("#passwordConfirm").val();
		var email = $("#email").val();
		var phoneMiddle = $("#phoneMiddle").val();
		var phoneLast = $("#phoneLast").val();
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var phoneFirst = $("#selectPhoneFirst option:selected").val();
		
		if(!vdid.test(id)){
			swal({
				  text: "올바르지 않은 아이디 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				});
			$("#id").val("");
			$("#id").focus();
			
			return false;
		} else if(!vdpwd.test(password)){
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
		} else if(!vdname.test(name)){
			swal({
				  text: "올바르지 않은 이름 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#name").val("");
			$("#name").focus();
			
			return false;
		} else if(!vdemail.test(email)){
			swal({
				  text: "올바르지 않은 이메일 형식입니다.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#email").val("");
			$("#email").focus();
			
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
		} else if(id == "") {
			swal({
				  text: "아이디를 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
	           $("#id").focus();
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
	       } else if(email == "") {
			swal({
				  text: "이메일을 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#email").focus();
	           return false;
	       } else if(name == "") {
			swal({
				  text: "이름을 입력해주세요.",
				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  button: "확인",
				}); 
			$("#name").focus();
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
		//아이디 중복확인 버튼  
		$("#btnIdCheck").click(function(){
			var id = $("#id").val();	
//			console.log(id);
			
			if(id == ""){
				swal({
	  				  text: "아이디를 입력해주세요.",
	  				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
	  				  button: "확인",
	  				}); 
			} else{
				$.ajax({
					url: '${pageContext.request.contextPath}/member/idDuplicateChk',
					type:'post',
				    data: {id: id},
				    success:function(data){
			            if($.trim(data)==0){
			            	swal({
			  				  text: "사용가능한 아이디입니다.",
			  				  icon: "success",
			  				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  				  button: "확인",
			  				}); 
			            	
			            	//버튼활성화
			            	$("#btnSignUp").removeAttr("disabled");  
			            }else{
			            	swal({
				  				  text: "이미 존재하는 아이디입니다.",
				  				  icon: "error",
				  				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
				  				  button: "확인",
				  				}); 
			            	$("#btnSignUp").attr("disabled", "disabled");
			            }
			        },
			        error:function(){
			                alert("에러입니다");
			        }
				})	//ajax end
			}	
		})
		
		//가입버튼
		$("#btnSignUp").click(function(){
			validate();
		})
	})
</script>


<%@ include file="../include/footer.jsp"%>