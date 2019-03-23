<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?bd" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/member.css?b" rel="stylesheet" type="text/css">
<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js'></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style>
div.contents-wrapper {
	border: 1px solid #ccc;
	width: 460px;                
	height: 200px;
	padding: 10px;
	display: inline-block;
	margin: 15px;        
}

.my-perf-img {  
	height: 178px;       
}

div.contents-image-wrapper{
	display: inline-block;
	height: 180px;
	width: 145px;
}

div.contents-text-wrapper{
	width: 280px;                 
	height: 175px;                                 
	display: inline-block;     
	float: right;
	padding: 5px 15px 30px 0;          
	overflow: hidden;
}

span.contents-perf-title{
	letter-spacing: -0.6px;
	font-weight: bold;
	color: #353535;
	font-size: 17px;         
}

span.span-list{
	display: block;
}

.span-list{
	font-size: 15px;
	letter-spacing: -0.6px;
	color: #666;
	padding: 10px 0 0 0;
}

.span-contents{
	font-weight: bold;
	padding-left: 20px;
}

.span-align{
	width: 60px;   
	height: 25px;
	display: inline-block;
}

span.my-book-list{
	letter-spacing: -0.6px;
	color: #666;
	text-align: center;
	display: block;
}

.span-bold{
	font-weight: bold;
}

.bookTitleWrapper h2{  
	margin-bottom: 15px;    
}

.chartjs{
	margin-top: 20px;
}

div.table-perf-wrapper{
    background: #fff;
    padding: 0 25px 20px 25px;
    margin: 30px auto;
    margin-bottom: 80px;
    border-radius: 3px;
    padding-bottom: 0!important;
    overflow: hidden;
}

/* 검색 */
div.search-filter-group{
	text-align: right;
	padding-right: 20px;
	padding-bottom: 10px;        
}

div.search-filter-group select{
	font-size: 14px;
	letter-spacing: -0.5px;
	color: #575e96;
	font-weight: bold;
	padding-left: 5px;
	width: 100px;  
	height: 30px;               
}

span.no-result{
	font-size: 22px;
	letter-spacing: -0.8px;
	color: #A7A7A7;       
	text-align: center;
	display: block;
	font-weight: 300;      
}

span.no-result i{
	display: block;
	padding: 20px 0 10px 0;
}
</style>

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

<!-- 후기 리스트 -->
<div class="container-fluid bookTableContainer">
	
	<div class='bookTitleWrapper'>
		<h2 class='text-center'>MY공연</h2>
		<span class='my-book-list'><span class='span-bold'>${info.username }</span>님의 선호하는 공연 장르는 다음과 같습니다.</span>
		<canvas id="chart-horizontal-stacked" class="chartjs" style="display: block; width: 720px; height: 60px;"></canvas>       
		<hr>
	</div>

	<div class="table-perf-wrapper">
	
		<div class="search-filter-group">
			<select name="searchType" id='selectYear'>
				<option value=''>전체</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
				<option value="2017">2017</option>
			</select>
		</div>
		<!-- search-filter-group end -->
	
		<div id='my-book-list-wrapper'>
			<c:forEach items="${list }" var="book">
				<div class='contents-wrapper'>
					<div class='contents-image-wrapper'>
						<img src='displayFile?filename=${book.sCode.showImagePath }' class='my-perf-img'>
					</div>
					<div class='contents-text-wrapper'>
						<span class='contents-perf-title'>${book.sCode.showName }</span>
						<span class='span-list'><span class='span-align'>예매번호</span> <span class='span-contents'>${book.bookNumber }</span></span>
						<span class='span-list'><span class='span-align'>관람일</span> <span class='span-contents'><fmt:formatDate value="${book.bookDate }" pattern="yyyy. MM. dd(E)"/>&nbsp;<fmt:formatDate value="${book.bookTime }" pattern="HH:mm"/></span></span>
						<span class='span-list'><span class='span-align'>좌석</span> 
							<c:if test="${book.seatGrade eq 'N' }">
							<span class='span-contents'>전석 ${book.bookZone }구역 ${book.bookNum }번</span>
							</c:if>
							<c:if test="${book.seatGrade ne 'N' }">
								<span class='span-contents'>${book.seatGrade}석 ${book.bookZone }구역 ${book.bookNum }번</span>
							</c:if>
						</span>
					
					</div>
				</div>
			</c:forEach>
		</div>		    
	</div>	<!-- table-perf-wrapper end -->
</div>



<script>	
var _stackedHzChart = new Chart(document.getElementById('chart-horizontal-stacked'), {
	  type: 'horizontalBar',
	  data: {
	    labels: [""],	//x축 제목
	    datasets: [
	      { label: "기획공연", data: ['${countA}'], backgroundColor: 'rgba(255, 99, 132, 0.2)', borderColor: 'rgb(255, 99, 132)', borderWidth: 1},
	      { label: "대관공연", data: ['${countB}'], backgroundColor: 'rgba(255, 205, 86, 0.2)', borderColor: 'rgb(255, 205, 86)', borderWidth: 1},
	      { label: "오페라축제", data: ['${countC}'], backgroundColor: 'rgba(75, 192, 192, 0.2)', borderColor: 'rgb(75, 192, 192)', borderWidth: 1},
	      { label: "살롱콘서트", data: ['${countD}'], backgroundColor: 'rgba(54, 162, 235, 0.2)', borderColor: 'rgb(54, 162, 235)', borderWidth: 1}
	    ]
	  }, 
	  options: {
	    tooltips: {
	      enabled: false
	    },
	    legend: {
	      labels: {
	        boxWidth: 15,
	      }
	    },
	    scales: {
	      xAxes: [{
	        stacked: true,
	        ticks: {
	          display: false
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        }        
	      }],
	      yAxes: [{
	        stacked: true,
	        ticks: {
	          display: false
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        }        
	      }],      
	    },
	    plugins: {
	      datalabels: {
	        display: false,  
	        backgroundColor: null,
	      }, 
	    }
	  }  
	});
</script>

<!-- 템플릿 -->  
<script id="template2" type="text/x-handlebars-template">
{{#each.}}
<div class='contents-wrapper'>
	<div class='contents-image-wrapper'>
		<img src='displayFile?filename={{sCode.showImagePath}}' class='my-perf-img'>
	</div>
	<div class='contents-text-wrapper'>
		<span class='contents-perf-title'>{{sCode.showName}}</span>
		<span class='span-list'><span class='span-align'>예매번호</span> <span class='span-contents'>{{bookNumber}}</span></span>
		<span class='span-list'><span class='span-align'>관람일</span> <span class='span-contents'>{{tempDate bookDate}}({{tempweek bookDate}}) {{temptime bookTime}}</span></span>
		<span class='span-list'><span class='span-align'>좌석</span>

	{{#ifCond seatGrade}}
		<span class='span-contents'>전석 {{bookZone}}구역 {{bookNum}}번</span>
	{{else}}
		<span class='span-contents'>{{seatGrade}}석 {{bookZone}}구역 {{bookNum}}번</span>
	{{/ifCond}}
		</span>
	</div>
</div>
{{/each}} 
</script>

<script id="template1" type="text/x-handlebars-template">  
<span class='no-result'><i class="fas fa-exclamation-circle fa-2x"></i>검색 결과가 존재하지 않습니다.</span>
</script>

<script>
//날짜
Handlebars.registerHelper("tempDate", function(value){
	var date = new Date(value);
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	
	if (year < 10) {
		year = "0" + year;	//1~9월은 앞에 0이 붙도록 함. 01, 02, .. 09월
	}
	if (month < 10) {					
		month = "0" + month;
	}
	if (day < 10) {					//1~9일은 앞에 9이 붙도록 함. 01, 02, .. 09일
		day = "0" + day;
	}
	
	return year + ". " + month + ". " + day; 
})

Handlebars.registerHelper("tempweek", function(value){
	//일: 0 ~ 토: 6
	var sWeek = ["일", "월", "화", "수", "목", "금", "토"];
	var date = new Date(value);
	var week = date.getDay();
	
	return sWeek[week];
})

//시간
Handlebars.registerHelper("temptime", function(value){
	var date = new Date(value);
	var hour = date.getHours();
	var minutes = date.getMinutes();
//	var second = date.getSeconds();

	if (hour < 10) {
		hour = "0" + hour;	
	}
	if (minutes < 10) {				
		minutes = "0" + minutes;
	}
			       
	return hour + ":" + minutes; 
})

//if
Handlebars.registerHelper('ifCond', function(v1, options) {
	if(v1 === "N") {
		return options.fn(this);
	}
	return options.inverse(this);
});
</script>

<script>
	$(function(){
		$("#selectYear").change(function(){
			var year = $("#selectYear").val();
//			console.log(year);

			$.ajax({
				
				url: "${pageContext.request.contextPath}/member/search?year=" + year,
				type: "GET",
				dataType: "json",
				success: function(json){					
//					console.log(json);
			
					$("#my-book-list-wrapper").empty();
				
					//검색결과 있을 때
					if(json.length > 0){
						var source = $("#template2").html();
						var f = Handlebars.compile(source);
						var result = f(json);
						$("#my-book-list-wrapper").append(result);
					} else{
						var source = $("#template1").html();
						var f = Handlebars.compile(source);
						var result = f(json);
						$("#my-book-list-wrapper").append(result);
					}
					
					
				}
			})	//ajax end
		})
	})
</script>






<%@ include file="../include/footer.jsp"%>