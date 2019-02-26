<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/performance.css?bsc" rel="stylesheet" type="text/css">
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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

<style>
.selectCategoryStyle .btnCategory{
	color: #3d49a2!important;
	text-decoration: underline;
	font-weight: bold;
}

.selectMonthStyle{
	background-color: #3d49a2;
	width: 78px;   
}

.selectMonthStyle .btnMonth{
	color: white!important;
	font-weight: bold;  
}
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

<div id="temp">
<script>
	var today = '<fmt:formatDate value="${map.sYear }" pattern="yyyy-MM-dd"/>';	//2019-02-01
	var year = today.substring(0, 4);    //2019 
	var month = today.substring(5, 7);   //02

	$(function(){
		$("#selectYear option[value="+ year + "]").attr("selected", true);	//year와 값 비교해서 option의 value가 2019가 selected 되게 함.
	 	
		var t = document.getElementsByClassName("btnMonth");
		var x = month - 1;
//		t[x].style.color = 'red';

		//현재 달(ex.2월)의 부모인 li 태그에 test2라는 클래스 이름 추가.
		var y = t[x].parentNode;
		y.classList.add('selectMonthStyle');
		
		var m = parseInt(month);
		$(".chkMonth").val(m);

	})

</script>
</div>

  
<!-- 공연안내  -->
<div class="container-fluid perfInfoWrapper">
	<div class="listWrapper">       
			<h2 class="text-center">월별 공연안내</h2><hr>            
			
			<div class='searchWrap'>  
				<select id="selectYear" name="selectYear" class="selectpicker" data-width="100px">
					<option value="2018" ${date.sYear == 2018 ? 'selected' : '' } >2018</option>
					<option value="2019" ${date.sYear == 2019 ? 'selected' : '' } >2019</option>
				</select>
				
						
				<!-- 월 선택 -->
				<div class="selectMonthWrapper">
					<ul class='monthList'>
					<c:forEach var="i" begin="1" end="12" step="1">
						<li><a href="#" data-month='${i }' class='btnMonth'><span class='spanMonth'>${i }</span>월</a></li>
					</c:forEach>
					</ul>
					<!-- 월  -->
					<input type='hidden' class='chkMonth'>
					
				</div>
				
				<!-- 카테고리 선택 -->
				<div class='perfCategoryWrapper'>
					<ul class='perfCategory'>  
						<li class='selectCategoryStyle'><a href="#" data-category='' class='btnCategory'>전체보기</a></li>
						<li><a href="#" data-category='A' class='btnCategory'>기획공연</a></li>
						<li><a href="#" data-category='B' class='btnCategory'>대관공연</a></li>
						<li><a href="#" data-category='C' class='btnCategory'>오페라축제</a></li>
						<li><a href="#" data-category='D' class='btnCategory'>살롱콘서트</a></li>
					</ul>
					<!-- 카테고리 -->
					<input type='hidden' class='chkCategory'>
				</div>
				
		
			
			</div>	<!-- searchWrap end -->

		<div class='resultSearchWrapper'>
		
		</div>

	
			</div>  <!-- listWrapper end -->
		
		</div>	<!-- perfInfoWrapper end -->
		
		<!-- 날짜  -->
		<input type='hidden' id="startDate">

<!-- 템플릿 -->  
<script id="template2" type="text/x-handlebars-template">
{{#each.}}
<div class='showListWrapper'>

<div class='show-img-box'>
{{#ifCond showImagePath}}
<img src="${pageContext.request.contextPath }/resources/images/no-image.jpg" alt="no-image">
</div>

<div class='show-item-details'>
	<span class='show-name'>{{showName}}</span>  
	<span class='show-date'>{{tempDate showStartdate}}({{tempweek showStartdate}}) ~ {{tempDate showEnddate}} ({{tempweek showEnddate}})</span>	
</div>

{{else}}
<img src="displayFile?filename={{showImagePath}}">
</div>

<div class='show-item-details'>
	<a href="${pageContext.request.contextPath}/perf/readPerf?showName={{showName}}" class='goReadPage'><span class='show-name'>{{showName}}</span></a>  
	<span class='show-date'>{{tempDate showStartdate}}({{tempweek showStartdate}}) ~ {{tempDate showEnddate}} ({{tempweek showEnddate}})</span>	
</div>

{{/ifCond}}
   
</div> 
{{/each}} 
</script>
		
<script>
//날짜
Handlebars.registerHelper("tempDate", function(value){
	var date = new Date(value);
//	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	
	return month + ". " + day; 
})

Handlebars.registerHelper("tempweek", function(value){
	//일: 0 ~ 토: 6
	var sWeek = ["일", "월", "화", "수", "목", "금", "토"];
	var date = new Date(value);
	var week = date.getDay();
	
	return sWeek[week];
})

//Handlebar if문
Handlebars.registerHelper('ifCond', function(v1, options) {
	if(v1 === null || v1 === "") {
		return options.fn(this);
	}
	return options.inverse(this);
});

	//검색
	function searchPerformance(){
		var sYear = $("select[name='selectYear']").val();
		var sMonth = $(".chkMonth").val();
		var category = $(".chkCategory").val();
		
//		console.log(sYear);
//		console.log(sMonth);
//		console.log(category);  
			    	
		$.ajax({
			
			url: "${pageContext.request.contextPath}/search?sYear=" + sYear + "&sMonth=" + sMonth + "&category=" + category,
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
			var month = $(this).attr("data-month");
//			console.log(month);
			$(".chkMonth").val(month);
			searchPerformance();
			
			return false;   
		})
		
		//연도 선택할 때
		$("#selectYear").change(function(){
			searchPerformance(); 
		})
		
		//카테고리 선택할 때
		$(".btnCategory").click(function(){
			var category = $(this).attr("data-category");
//			console.log(category);
			$(".chkCategory").val(category);
			
			searchPerformance();
		
			return false;
		})
		    
		//카테고리 a의 부모인 li를 클릭할 경우
		var categoryLi = $(".perfCategory > li");
		categoryLi.find('a').click(function(){
			categoryLi.removeClass('selectCategoryStyle');
			$(this).parent().addClass('selectCategoryStyle');            
		})
		
		//월 a의 부모인 li를 클릭할 경우
		var monthLi = $(".monthList > li");
		monthLi.find('a').click(function(){
			monthLi.removeClass('selectMonthStyle');
			$(this).parent().addClass('selectMonthStyle');
		})
		          
		
	})
</script>

<%@ include file="../include/footer.jsp"%>