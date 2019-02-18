<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- my css -->
<link href="${pageContext.request.contextPath }/resources/css/performance.css?abd" rel="stylesheet" type="text/css">
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>

<style>
.ui-datepicker {
    background-color: #fff;
    box-shadow: inset 0 0 0 1px #ccc;
    width: 100%;
    max-width: 370px;
    z-index: 999 !important;
}

@media all and (max-width: 760px) {
    .ui-datepicker {
        max-width: 290px;
    }
}

.ui-datepicker-year {
    color: #000;
}

.ui-datepicker-month {
    color: #000;
}

.ui-datepicker-header {
    color: #ccc;
    text-align: center;
    font-size: 14px;
    border-bottom: 1px solid #e6ebf0;
    position: relative;
    padding: 12px 0;
}

.ui-datepicker-header .ui-corner-all {
    position: absolute;
    top: 0;
    line-height: 14px;
    text-decoration: none;
    color: transparent;
    font-size: 0;
    width: 40px;
    height: 40px;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAKCAYAAAB8OZQwAAAAkElEQVQYV22OQQ7BUABEZ2hjb8clHIBKRPwurVyniNvURnQjSDSiPYBLWFs2X/6Ixm8szPIlk/eI7xap2s++PTgipYezslpDTADua2gKOxZ0AfhwQTBgXKrr9LoD6hGcHIfhlaawO0FzSJvTqJN8nv/h712O03MU5rUovtnIUXkj8kmmqFYClyCzptPHo4XtG0n5SYl/lxqyAAAAAElFTkSuQmCC);
    background-position: center center;
    background-repeat: no-repeat;
}

.ui-datepicker-header .ui-corner-all.ui-datepicker-prev {
    left: 10px;
}

.ui-datepicker-header .ui-corner-all.ui-datepicker-next {
    right: 10px;
    transform: rotateY(180deg);
}

.ui-datepicker-calendar {
    color: #808080;
    font-size: 14px;
    margin: 0 24px 24px;
}

.ui-datepicker-calendar thead tr {
    border-top: 0;
}

.ui-datepicker-calendar tr {
    border-top: 1px solid #e6ebf0;
}

.ui-datepicker-calendar tr td, .ui-datepicker-calendar tr th {
    width: 45px;
    height: 45px;
    text-align: center;
    vertical-align: middle;
}

@media all and (max-width: 760px) {
    .ui-datepicker-calendar tr td, .ui-datepicker-calendar tr th {
        width: 35px;
        height: 35px;
    }
}

.ui-datepicker-calendar tr td {
    border-right: 1px solid #e6ebf0;
    position: relative;
}

.ui-datepicker-calendar tr td:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    box-shadow: 0 0 0 1px #ccc;
    display: none;
}

.ui-datepicker-calendar tr td.ui-datepicker-today {
    background-color: #ccc;
}

.ui-datepicker-calendar tr td.ui-datepicker-today a {
    color: #fff;
}

.ui-datepicker-calendar tr td.ui-datepicker-today:hover:before {
    display: none;
}

.ui-datepicker-calendar tr td.ui-datepicker-today:hover a {
    color: #fff;
}

.ui-datepicker-calendar tr td:last-child {
    border-right: 0;
}

.ui-datepicker-calendar tr td:hover:before {
    display: block;
}

.ui-datepicker-calendar tr td:hover a {
    color: #ccc;
}

.ui-datepicker-calendar a {
    text-decoration: none;
    color: #808080;
    font-size: 14px;
}

.ui-datepicker-other-month a {
    color: #d0d4d9;
}

</style>

<div class="container-fluid perfContainer">  
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">공연정보</p>
				<p class="engHeadline">Performance Guide</p>
			</div>	<!-- headline end -->
		</div>	<!-- col-sm-6 end -->
	</div>	<!-- row end -->
</div>	<!-- container end -->

<div class="container-fluid contentsWrapper">
	<div class="formWrapper">
	
	<form action="">
		<div class="container">
			<h2>Register</h2>
		    <p>Please fill in this form to create an account.</p>
		    <hr>
		    
<div class="form-group">
    <label for="email"><i class="fa fa-envelope"></i>Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="form-group">
    <label for="name">name:</label>
    <input type="text" class="form-control" id="name">
  </div>  
  
  <div class="form-group">
    <label for="address">address:</label>
    <input type="text" class="form-control" id="address">
  </div>
  
  <div class="form-group" id="dateWrapper">
    <label for="date">date:</label>
    
    <div class="pickDateWrapper">
    	<input type="text" placeholder="input date" name="datepicker" class="form-control datepicker" id="pickDate">
    </div>
  </div>
  
  
		</div>
		
	</form>
	</div>
</div>


<script>

$(function(){
	$(".datepicker").datepicker(
			$.datepicker.regional['ko'] = {
					closeText: '닫기',
					prevText: '이전달',
					nextText: '다음달',
					currentText: '오늘',
					monthNames: ['1월','2월','3월','4월','5월','6월',
					'7월','8월','9월','10월','11월','12월'],
					monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
					dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
					dayNamesShort: ['일','월','화','수','목','금','토'],
					dayNamesMin: ['일','월','화','수','목','금','토'],
					dateFormat: 'yy-mm-dd',
					firstDay: 0,
					isRTL: false,
					showOtherMonths: true,
					selectOtherMonths: true,
				});
})
</script>
<%@ include file="../include/footer.jsp" %>