<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/book.css?abccc" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js"></script>
                   
<div class="container-fluid bookContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">공연정보</p>
				<p class="engHeadline">Performance Guide</p>
			</div>
			<!-- headline end -->
		</div>                                                  
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->           
</div>
<!-- container end -->


<!-- 공연안내  -->
<div class="container-fluid bookWrapper">
	<!-- 진행 단계 선택 -->
	<div class="book-progress-wrapper">
		<ul>
			<li class='selectStyle'><a href="#"><span class='spanStep'>01</span>&nbsp;&nbsp;관람일/회차선택</a></li>
			<li><a href="#"><span class='spanStep'>02</span>&nbsp;&nbsp;좌석선택</a></li>
			<li><a href="#"><span class='spanStep'>03</span>&nbsp;&nbsp;가격/할인선택</a></li>
			<li><a href="#"><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</a></li>
			<li><a href="#"><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</a></li>
		</ul>
</div>                                             
	          
                      
	                                     
	
	                           
	<div class='book-step-wrapper'>
	
	<!-- 달력 -->
	<div id="datepicker" class="calendar"></div>
	<!-- 정보 -->
	<div class='temp'></div>          
	
	<h4>${list }</h4>          
	
	</div>
	


	   
</div>	<!-- perfInfoWrapper end -->




<%@ include file="../include/footer.jsp"%>