<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/join.css?bb" rel="stylesheet" type="text/css">
<!-- alert plugin -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
div.termsWrapper{
	overflow: hidden;
}

div.termsWrapper img{
	display: inline-block;
	padding-right: 10px;
}

div.termsWrapper h3{
	display: inline-block;
	margin: 0;
	padding-top: 10px;
	letter-spacing: -0.5px;
	color: #747474;      
	font-weight: normal; 
}

div.termsWrapper div.terms1{
	border: 1px solid #ddd;
	width: 100%;
	height: 250px;
	overflow: auto;
	margin-top: 20px;
	padding: 15px;                               
}

div.termsWrapper div.terms2{
	border: 1px solid #ddd;
	width: 100%;
	height: 200px;  
	margin-top: 20px;
	padding: 15px;  
}

div.terms1 p, div.terms2 p{
	color: #888891;
	font-weight: lighter;
	letter-spacing: -0.5px;
	font-size: 15px;
}

div.terms1 ul, div.terms2 ul{
	list-style: none;
	padding: 0;
	margin-bottom: 1rem;
}

div.terms1 ul li, div.terms2 ul li{   
	color: #888891;
	font-weight: lighter;
	letter-spacing: -0.5px;
	font-size: 15px;
	text-align: left;
}

div.allowWrapper{
	text-align: right;
	color: #666;
	margin: 15px 0 30px 0;
}

/* ========== 체크박스 =========== */
.checkbox label:after{
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr{
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .25em;
    width: 1.1em;
    height: 1.1em;     
    float: left;
    margin-right: .5em;
    margin-top: 3px;             
}      

.checkbox .cr .cr-icon{
    position: absolute;
    font-size: .8em;
    line-height: 0;
    top: 52%;              
    left: 15%;      
    color: #f04040;  
}

.checkbox label{
	margin-bottom: 0;
}

.checkbox label input[type="checkbox"]{
    display: none;
}

.checkbox label input[type="checkbox"] + .cr > .cr-icon{
    transform: scale(3) rotateZ(-20deg);
    opacity: 0;
    transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon{
    transform: scale(1) rotateZ(0deg);
    opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled + .cr{
    opacity: .5;
}

/* 버튼 */
div.termsBtnWrapper{
	overflow: hidden;
	text-align: center;
	margin: 30px 0 50px 0;
}

#btnSignNext{
	width: 230px;
	height: 50px;
	color: white;
	background-color: #2a3072;
	letter-spacing: -0.8px;
	font-size: 16px;
	border: none;
}
</style>

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
	
	<div class='termsWrapper'>
		<h3><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">이용약관</h3>
		<div class='terms1'>
			<p>대구오페라하우스 홈페이지 이용약관</p>
			<p>제1장 총칙</p>
			<p>제1조 (목적) </p>
			<p>본 약관은 대구오페라하우스 (이하 "오페라하우스"라 합니다) 홈페이지가 제공하는 모든 서비스 (이하 "서비스"라 합니다)를 이용함에 있어 이용자와 오페라하우스간의 권리, 의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
			<p>제2조 (약관의 효력과 변경)</p>
			<ul>
				<li>1. 오페라하우스는 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 회원 서비스를 제공할 것 이며, 귀하가 본 약관의 내용에 동의하는 경우, 오페라하우스의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.</li>
				<li>2. 오페라하우스는 필요에 따라 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 오페라하우스 사이트 내에 공지함으로써 그 효력이 발생합니다.</li>
				<li>3. 이용자가 변경된 약관에 동의하지 아니하는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.</li>
			</ul>
			<p>제3조 (약관 외 준칙)</p>
			<p>본 약관에 명시되지 않은 사항과 이 약관의 해석은 「전기통신기본법」, 「전기통신사업법」, 「정보통신망이용촉진및정보보호등에 관한 법률」, 「정보통신윤리위원회심의규정」, 「정보통신윤리강령」, 「프로그램 보호법」 및 기타 대한민국의 관련 법령과 상관습에 의합니다.</p>
			<p>제4조 (용어의 정의)</p>
			<ul>
				<li>1. 이용자 : 본 약관에 따라 오페라하우스가 제공하는 서비스를 받는 자.</li>
				<li>2. 가  입 : 오페라하우스가 제공하는 회원가입 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위</li>
				<li>3. 무료회원 : 오페라하우스에 개인정보를 제공하여 무료회원 등록을 한 자로서, 오페라하우스의 정보를 제공받으며, 오페라하우스가 특별히 제공하는 서비스를 이용할 수 있는 자</li>
				<li>4. 인터넷 ID : 회원식별과 회원의 서비스 이용을 위하여 회원이 신청하고 오페라하우스가 승인하는 문자 및 숫자의 조합</li>
				<li>5. 비밀번호 : 회원의 정보 보호를 위해 이용자 자신이 설정한 문자와 숫자의 조합</li>
				<li>6. 탈    퇴 : 회원이 이용계약을 종료시키는 행위</li>
				<li>7. 본 약관에서 정의하지 않는 용어는 개별서비스에 대한 별도약관 및 이용규정에서 정의 합니다.</li>
			</ul>
		</div>
		
		<div class='allowWrapper'>
			<div class="checkbox">
		        <label><input type="checkbox" id="chkAllow1" name="chkAllow1"><span class="cr"><i class="cr-icon fa fa-check"></i></span>위의 이용약관에 동의합니다.</label>
	       	</div>
	    </div>
	    
	    <h3><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">개인정보수집 및 이용동의</h3>
	    <div class='terms2'>
			<p>대구오페라하우스는 정보주체의 동의에 의해 개인정보를 수집·이용합니다.</p>
			<p>홈페이지 회원관리를 위해 수집·보유하고 있는 주요 개인정보 파일은 다음과 같습니다.</p>
			<ul>
				<li>- 수집 및 이용목적 : 대구오페라하우스 회원관리</li>
				<li>- 개인정보 항목 : 성명, 주민등록번호, 이메일, 전화번호 등</li>
				<li>- 보유 및 이용기간 : 회원가입 ~ 회원탈퇴(탈퇴 시 삭제)</li>
				<li>- 정보주체의 권리 : 본인에 관한 개인정보 열람, 정정.삭제 청구권</li>
			</ul>
		</div>
		
		<div class='allowWrapper'>
			<div class="checkbox">
		        <label><input type="checkbox" id="chkAllow2" name="chkAllow2"><span class="cr"><i class="cr-icon fa fa-check"></i></span>위의 개인정보수집 및 이용동의약관에 동의합니다.</label>
	       	</div>
	    </div>
	    
	    <div class="termsBtnWrapper">
			<button type="button" id="btnSignNext">다음 단계</button>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#btnSignNext").click(function(){
			if($('input:checkbox[name="chkAllow1"]').is(":checked") == false){
				swal({
					  text: "이용약관에 동의해주세요.",
					  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
					  button: "확인",
					}); 
			}
			
			if($('input:checkbox[name="chkAllow2"]').is(":checked") == false){
				swal({
					  text: "개인정보수집 및 이용동의에 동의해주세요.",
					  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
					  button: "확인",
					}); 
			}
			
			if($('input:checkbox[name="chkAllow1"]').is(":checked") && $('input:checkbox[name="chkAllow2"]').is(":checked")){
				location.href = "${pageContext.request.contextPath}/member/joinForm";  
			}
		})
	})
</script>


<%@ include file="../include/footer.jsp"%>