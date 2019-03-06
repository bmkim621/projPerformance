<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/performance.css?a" rel="stylesheet" type="text/css">
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
			</div>	<!-- headline end -->
		</div>	<!-- col-sm-12 end -->
	</div>	<!-- row end -->
</div>	<!-- container end -->

<!-- 상세보기 -->
<div class='container-fluid readShowWrapper'>
	<div class='readWrapper'>
		<h2 class="text-center">월별 공연안내</h2><hr>	           
		
		<div class='showDetails'>
			<div class='read-img-box'>
				<c:if test="${PerformanceVO.showImagePath == null}">
					<img src="${pageContext.request.contextPath }/resources/images/no-image.jpg" alt="no-image">
				</c:if>
				<c:if test="${PerformanceVO.showImagePath != null}">
					<img src='displayFile?filename=${PerformanceVO.showImagePath }'>
				</c:if>
			</div>	
			
			<div class='read-contents'>
				<c:choose>
					<c:when test="${PerformanceVO.showType eq 'A'}"><p class='read-category'>기획공연</p></c:when>
					<c:when test="${PerformanceVO.showType eq 'B'}"><p class='read-category'>대관공연</p></c:when>
					<c:when test="${PerformanceVO.showType eq 'C'}"><p class='read-category'>오페라축제</p></c:when>
					<c:when test="${PerformanceVO.showType eq 'D'}"><p class='read-category'>살롱콘서트</p></c:when>
					<c:when test="${PerformanceVO.showType eq 'E'}"><p class='read-category'>기타</p></c:when>
					<c:otherwise><p class='read-category'></p></c:otherwise>
				</c:choose>
				
				<p class='read-name'>${PerformanceVO.showName }</p>
				<ul>
					<li>
						<p class='spanTitle'>공연기간</p>
						<p class='spanContents'>
							<fmt:formatDate value="${PerformanceVO.showStartdate }" pattern="yyyy년 MM월 dd일(E)"/>~
							<fmt:formatDate value="${PerformanceVO.showEnddate }" pattern="yyyy년 MM월 dd일(E)"/>
						</p>       
					</li>
					<li>
						<p class='spanTitle'>장소</p>
						<p class='spanContents'>
							<c:if test="${PerformanceVO.fno.facilitiesNo == 1}">대구오페라하우스 본관</c:if>
							<c:if test="${PerformanceVO.fno.facilitiesNo == 2}">대구오페라하우스 별관(카메라타)</c:if>
						</p>
					</li>
				</ul>
			</div>
			  
			<div class='btnWrapper'>
				<a href="${pageContext.request.contextPath }/book/stepOne?showName=${PerformanceVO.showName }"><img src="${pageContext.request.contextPath }/resources/upload/btn_reservation1.gif"></a>
				<a href="#" class='btnGoList'><img src="${pageContext.request.contextPath }/resources/upload/btn_list.gif"></a>
			</div>
			
		</div>
		
		
	<!-- 리스트 -->
	<input type='hidden' id='inputYear' >
	<input type='hidden' id='inputMonth'>
	<input type='hidden' id='inputCategory' value='${PerformanceVO.showType }'>
	<input type='hidden' id='mydate' value='<fmt:formatDate value="${PerformanceVO.showStartdate }" pattern="yyyy-MM-dd"/>'> 
	</div>	<!-- readWrapper end -->

	
 </div>	<!-- readShowWrapper end -->

	
	<script>
		//리스트로
		function goPageList(){
			var sYear = $("#inputYear").val();
			var sMonth = $("#inputMonth").val();
			var category = $("#inputCategory").val();
			
			console.log(sYear);
			console.log(sMonth);
			console.log(category);
			  
		 	location.href = "${pageContext.request.contextPath}/perf/perfList";  
//			location.href = "${pageContext.request.contextPath}/perf/perfList?sYear=" + sYear + "&sMonth=" + sMonth + "&category=" + category;	
			
		}
	
		$(function(){
			var y = $("#inputCategory").val();
	//		console.log(y);	//카테고리
			
			var t = $("#mydate").val();   
	//		console.log(t);         
			var year = t.substring(0, 4);
	//		console.log(year);    
			$("#inputYear").val(year);
			var month = t.substring(5, 7);
			var numMonth = parseInt(month);
	//		console.log(numMonth);      
			$("#inputMonth").val(numMonth); 
			
			
			$(".btnGoList").click(function(){
				goPageList();
			})
		})
	</script>
	
	
<%@ include file="../include/footer.jsp"%>