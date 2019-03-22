<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?bd" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/member.css?b" rel="stylesheet" type="text/css">
<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js'></script>


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
	height: 180px;
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
	padding: 25px 15px 30px 0;    
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
     
	<div class="table-wrapper">
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
	</div>	<!-- table-wrapper end -->
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
	        formatter: function (value, ctx) {
	        	let sum = 0;
	        	let dataArr = ctx.chart.data.datasets[0].data;
	        	dataArr.map(data => {
	        	    sum += data;
	        	});
	        	let percentage = (value * 100 / sum).toFixed(0) + "%";
	        	return percentage;
	        	}
	      }, 
	    }
	  }  
	});
</script>








<%@ include file="../include/footer.jsp"%>