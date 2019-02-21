<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/performance.css?b" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myDatepicker.css" rel="stylesheet" type="text/css">
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/performance.js"></script>  
<!-- handlebars -> 제이쿼리 먼저 있어야 함. -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- MDTimePicker -->
<link href="${pageContext.request.contextPath }/resources/css/mdtimepicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/mdtimepicker.js"></script>

<div class="container-fluid perfContainer">
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
<div class="container-fluid perfInfoWrapper">
	<div class="listWrapper">
		<div class="container">
			<h3 class="text-center">일력별 공연안내</h3>  
			
			<div class='searchWrap'>
				<!-- 연도 선택 -->
				<select id="selectYear" name="selectYear">
					<option value="2018">2018</option>
					<option value="2019" selected="selected">2019</option>
				</select>
		
				<!-- 월 선택 -->
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
					<a class="btn btn-outline-info" role="button" href="#">1월</a>
					<a class="btn btn-outline-info" role="button" href="#">2월</a>
					<a class="btn btn-outline-info" role="button" href="#">3월</a>
					<a class="btn btn-outline-info" role="button" href="#">4월</a>
					<a class="btn btn-outline-info" role="button" href="#">5월</a>
					<a class="btn btn-outline-info" role="button" href="#">6월</a>
					<a class="btn btn-outline-info" role="button" href="#">7월</a>
					<a class="btn btn-outline-info" role="button" href="#">8월</a>
					<a class="btn btn-outline-info" role="button" href="#">9월</a>
					<a class="btn btn-outline-info" role="button" href="#">10월</a>
					<a class="btn btn-outline-info" role="button" href="#">11월</a>
					<a class="btn btn-outline-info" role="button" href="#">12월</a>
				</div>
			
			</div>	<!-- searchWrap end -->

			<p>
			<c:forEach items="${result }" var="vo">
				<p>공연코드 : ${vo.showCode }</p>
				<p>공연제목 : ${vo.showName }</p>
				<p>공연종류 : ${vo.showType }</p>
				<p>공연시간 : ${vo.totalTime }분</p>
				<p>공연시작시간 : <fmt:formatDate value="${vo.startTime }" pattern="HH:mm"/></p>
				<p>공연시작일 : <fmt:formatDate value="${vo.showStartdate }" pattern="MM. dd"/>(<fmt:formatDate value="${vo.showStartdate }" pattern="E"/>)</p>
				<p>공연종료일 : <fmt:formatDate value="${vo.showEnddate }" pattern="MM. dd"/>(<fmt:formatDate value="${vo.showEnddate }" pattern="E"/>)</p>
				<c:if test="${vo.fno.facilitiesNo == 1}">
					<p>공연장소 : 대구오페라하우스 본관</p>
				</c:if>   
				<c:if test="${vo.fno.facilitiesNo == 2}">
					<p>공연장소 : 대구오페라하우스 별관</p>
				</c:if>
				<%-- <p>이미지 : <img src="displayFile?filename=${vo.showImagePath }" class="perfImg"></p> --%>
				<p>이미지경로 원본 : <span class="origin"></span></p>
				<p>이미지경로2 : <span class='myPath'>${vo.showImagePath }</span></p>
				<hr>
			</c:forEach>
		</p>
			
 		 </div>
	
			</div>  
		
		
		
		
		</div>
		

<script>
	$(function(){
		var path = $(".myPath").text();
		console.log(path);
		var front = path.substring(0, 12);
		var end = path.substring(14);
		var origin = front + end;
		console.log(front);
		console.log(end);
		console.log(origin);
	
		
	})
</script>

<%@ include file="../include/footer.jsp"%>