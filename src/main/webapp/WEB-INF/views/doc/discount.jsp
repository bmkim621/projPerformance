<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
<link href="${pageContext.request.contextPath }/resources/css/performance.css?a" rel="stylesheet" type="text/css">

<style>
div.bInfoWrapper h2 {
	margin-top: 60px;             
	margin-bottom: 40px;  
	letter-spacing: -0.8px;
}

div.bContentsWrapper{
	position: relative;
}

div.bContentsWrapper img{
	width: 100%;
	height: 80%;  
}

p#bHeadline{
	display: inline-block;
	position: absolute;
	top: 60px;   
	left: 80px;
	color: #fff;
	font-size: 2.0vw;                         
	letter-spacing: -0.5px;
	line-height: 1.3;                                               
	text-align: left;
	font-weight: 300;
}

p#bContents{
	width: 48%;                   
	display: inline-block;
	position: absolute;
	left: 80px;
	bottom: 40px;        
	color: #fff;
	font-size: 1.12vw;                                                           
	letter-spacing: -0.5px;                                         
	text-align: left;
	font-weight: 300;
	margin: 0;
}

/* 카테고리 */
ul.docCategory{
	list-style: none;
	width: 100%;
	height: 50px;
	margin: 40px 0 60px 0;    
	padding: 0;          
}

ul.docCategory li{
	float: left;  
	width: 33.33%;                   
	height: 50px;     
	line-height: 50px;
	border: 1px solid #ddd;
}

ul.docCategory li:hover{
	border: 1px solid #3d49a2;
}

ul.docCategory li:hover a{
	color: #3d49a2;          
}

ul.docCategory li a{
	display: inline-block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-decoration: none;
	color: #626262;
	font-size: 17px;  
	letter-spacing: -0.5px;  
}

li.selectCategoryStyle{
	border: 1px solid #3d49a2;            
	background-color: #3d49a2;         
}

li.selectCategoryStyle a{
	color: #fff!important;         
}

/* 테이블 */
div.table-responsive{
	margin-top: 25px;
	text-align: center;  
	margin-bottom: 50px;          
}

table tbody{
	border-top: 2px solid #3d49a2;
}

.table td, .table th{
	vertical-align: middle;
	color: #686868;
	font-weight: lighter;
	letter-spacing: -0.5px;
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

<div class='container docBookInfoWrapper'>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id='bookInfoContainer'>   
			<div class='bInfoWrapper'>
				<h2 class='text-center'>기본할인안내</h2>
			</div>
			
			<div class='bContentsWrapper'>
				<img src="${pageContext.request.contextPath }/resources/upload/show2_topbg.png">
				<div class='bTextWrapper'>
					<p id='bHeadline'>(재)대구오페라하우스는<br>언제나 관객 여러분의 편안하고 쾌적한 공연관람 환경을 위해<br>최선의 노력을 다하고 있습니다.</p>
					<p id='bContents'>대구오페라하우스에서 진행되는 모든 공연은 언제나 인터넷 예매가 가능하오나, 일부 대관공연은 주관사의 운영형태에 따라 동일한 서비스가 제공되지 않을 수 있사오니 이 점 양해 부탁드립니다.</p>
				</div>
			</div>
			
			<!-- 카테고리 선택 -->
			<div class='docCategoryWrapper'>
				<ul class='docCategory'>    
					<li><a href="${pageContext.request.contextPath}/doc/info">예매안내</a></li>
					<li class='selectCategoryStyle'><a href="${pageContext.request.contextPath}/doc/discount">기본할인안내</a></li>
					<li><a href="${pageContext.request.contextPath}/doc/refund">환불/취소안내</a></li>
				</ul>
			</div>
			
			<!-- 내용 -->
			<div class='docContentsWrapper'>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>                
							<tr>
								<td rowspan="4" style='background-color: #f2f2f2; color: #000;'>기본할인</td>
								<td>10%</td>
								<td class='text-left'>10인 이상, 대구오페라하우스 홈페이지 회원, 코코아 회원</td>
							</tr>
							<tr>
								<td>20%</td>  
								<td class='text-left'>30인 이상, 문화패스(청소년 및 대학생 8세~24세)</td>
							</tr>
							<tr>
								<td>30%</td>  
								<td class='text-left'>100인 이상</td>
							</tr>
							<tr>
								<td>50%</td>  
								<td class='text-left'>65세 이상(본인), 장애인(동반 1인 포함), 국가유공자(본인)</td>
							</tr>
							<tr>
								<td rowspan="3" style='background-color: #f2f2f2; color: #000;'>특별할인</td>
								<td rowspan="2">20%</td>  
								<td class='text-left'>그린카드(현장 결제 시), 아이조아 카드 소지자, 산모수첩 소지자(동반 1인 포함)</td>
							</tr>
							<tr> 
								<td class='text-left'>예술인패스(본인), DGtickets 방문 예매 시(053-422-1255)</td>
							</tr>
							<tr>
								<td>50%</td>  
								<td class='text-left'>대구오페라하우스 후원회</td>
							</tr>
						</tbody>
					</table>
				</div>                    
			</div>                         
		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>