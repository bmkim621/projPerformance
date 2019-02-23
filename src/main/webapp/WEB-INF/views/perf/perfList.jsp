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

<style>
	
</style>

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

<h1>테스트</h1>

<div id="temp">
<script>
	var today = '<fmt:formatDate value="${map.sYear }" pattern="yyyy-MM-dd"/>';	//2019-02-01
	var year = today.substring(0, 4);    //2019 
	var month = today.substring(5, 7);   //02

	$(function(){
		$("#selectYear option[value="+ year + "]").attr("selected", true);	//year와 값 비교해서 option의 value가 2019가 selected 되게 함.
	/* 	var t = document.getElementsByClassName("spanMonth");
		var x = month - 1;
		t[x].style.color = 'red'; */
		var m = parseInt(month);
		$(".chkMonth").val(m);

	})

</script>
</div>

<!-- 공연안내  -->
<div class="container-fluid perfInfoWrapper">
	<div class="listWrapper">
		<div class="container">
			<h3 class="text-center">일력별 공연안내</h3>  
			
			<div class='searchWrap'>
				<!-- 연도 선택 -->
				<select id="selectYear" name="selectYear">
					<option value="2018" ${date.sYear == 2018 ? 'selected' : '' }>2018</option>
					<option value="2019" ${date.sYear == 2019 ? 'selected' : '' }>2019</option>
				</select>
		
				<!-- 월 선택 -->
				<div class="selectMonthWrapper">
					<ul class='monthList'>
					<c:forEach var="i" begin="1" end="12" step="1">
						<li><a href="#" data-month='${i }' class='btnMonth'><span class='spanMonth'>${i }</span>월</a></li>
					</c:forEach>
					</ul>
					<!-- 월  -->
					<input type="hidden" class="selectMonth">	<!-- 현재 월 -->
					<input type='hidden' class='chkMonth'>
				</div>
				
		
			
			</div>	<!-- searchWrap end -->

<%--  			<div class='perfListWrapper'>
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
				<!-- 공연 이미지 -->
				<c:if test="${vo.showImagePath == null}">  
					<p>보여지는 이미지 : <img src="${pageContext.request.contextPath }/resources/images/no-image.jpg" alt="no-image"></p>
				</c:if>
				<c:if test="${vo.showImagePath != null}">
					<p>보여지는 이미지 : <img src='displayFile?filename=${vo.showImagePath }'></p>
				</c:if>
				<hr>
			</c:forEach>
		</div>	<!-- perfListWrapper end -->  --%>
		
		<div class='resultSearchWrapper'></div>
					
 		 </div>
	
			</div>  
		
		</div>
		
<script>
	//검색
	function searchPerformance(){
		var sYear = $("select[name='selectYear']").val();
		var sMonth = $(".chkMonth").val();
		console.log(sYear);
		console.log(sMonth);

		$.ajax({
			
			url: "${pageContext.request.contextPath}/search?sYear=" + sYear + "&sMonth=" + sMonth,
			type: "GET",
			dataType: "json",
			success: function(json){
				
				console.log(json);
		
				$(".resultSearchWrapper").empty();
				
				var source = $("#template2").html();
				var f = Handlebars.compile(source);
				var result = f(json);
				$(".resultSearchWrapper").append(result);
				
			}
		})
	}
	
	$(function(){
		searchPerformance();  
		
		//월 선택할 때
		$(".btnMonth").click(function(){
			var mo = $(this).attr("data-month");
//			console.log(mo);
			$(".chkMonth").val(mo);
			searchPerformance();
			
			return false;   
		})
		
		//연도 선택할 때
		$("#selectYear").change(function(){
			searchPerformance(); 
		})
		
		
		
	})
</script>

<!-- 템플릿 -->  
<script id="template2" type="text/x-handlebars-template">
{{#each.}}
<p>{{showName}}</p>
{{/each}}
</script>  

<%@ include file="../include/footer.jsp"%>