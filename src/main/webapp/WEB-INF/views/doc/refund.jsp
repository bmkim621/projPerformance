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

/* 내용 */
h3.contentsHeadline{
	color: #353535;
	letter-spacing: -0.5px;
	font-weight: 300;
	margin-top: 50px;                  
}

h3.contentsHeadline img{
	margin-right: 15px;        
}

div.docContentsWrapper ul{
	list-style: none;
	text-align: left;
	color: #686868;
	font-weight: 300;
	letter-spacing: -0.5px;         
	margin-bottom: 2.0rem;                                   
	margin-top: 0.8rem;        
}

ul.rules{
	margin-top: 0.2rem!important;
	margin-bottom: 15px!important;  
}

p.contentsBold{
	color: #3d49a2;
	letter-spacing: -0.5px; 
	font-size: 18px;
	padding-left: 40px;
	margin-bottom: 0.5rem;
}

/* 테이블 */
div.table-responsive{
	margin-top: 25px;
	text-align: center;  
}

table thead{
	border-top: 2px solid #3d49a2;
	background-color: #f2f2f2;       
}

.table th{
	color: #000!important;
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
				<h2 class='text-center'>예매안내</h2>
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
					<li><a href="${pageContext.request.contextPath}/doc/discount">기본할인안내</a></li>
					<li class='selectCategoryStyle'><a href="${pageContext.request.contextPath}/doc/refund">환불/취소안내</a></li>
				</ul>
			</div>
			
			<!-- 내용 -->
			<div class='docContentsWrapper'>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">입장권 환불 안내</h3>
				<p class='contentsBold'>입장권 취소 및 환불해당예매처로 하시면 됩니다.</p>
				<ul>
					<li>- 인터파크 환불마감시간 : 평일/일요일/공휴일 오후5시, 토요일 오전11시</li>
					<li>- 대구오페라하우스 전화예매 환불가능시간 : 평일 09:30~17:00, 공휴일인 경우 그 전일까지</li>
					<li>- 관람일 전일 오후 5시 이후 (토요일은 오전 11시) 또는 관람일 당일 예매하신 건에 대해서는 예매 후 취소/변경/환불이 불가합니다.</li>
					<li>- 토요일이 공휴일인 경우, 토요일 오전 11시 기준으로 적용됩니다.</li>
				</ul>             
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">취소 수수료 안내</h3>
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width='25%'>구분</th>
								<th width='30%'>취소수수료</th>
								<th width='45%'>비고</th>        
							</tr> 
						</thead>
						<tbody>                
							<tr>
								<td>예매후 7일이내</td>
								<td>수수료없음</td>
								<td rowspan="5" class='text-left'>※ 예매당일에 취소하는 경우 이외에는 예매수수료가 환불되지 않음<br>※ 예매 후 7일 이내라도 취소시점이 공연일로부터 10일 이내라면 그에 해당하는 취소수수료 부과</td>
							</tr>
							<tr>
								<td>예매후 8일 ~ 관람일 10일전</td>
								<td>뮤지컬, 콘서트, 클래식 등 공연권 : 4,000원<br>연극, 전시 등 입장권 : 2,000원<br>(단, 티켓 금액의 10% 이내)</td>  
							</tr>
							<tr>
								<td>관람일 9일전 ~ 7일전</td>
								<td>티켓금액의 10%</td>  
							</tr>
							<tr>
								<td>관람일 6일전 ~ 3일전</td>
								<td>티켓금액의 20%</td>  
							</tr>
							<tr>
								<td>관람일 2일전 ~ 1일전</td>
								<td>티켓금액의 30%</td>  
							</tr>
						</tbody>
					</table>
				</div>
				<ul style='margin-bottom: 80px; padding-left: 0;'>             
					<li>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</li>
					<li>- 웹 취소 가능시간 이후에는 취소가 불가합니다.</li>
					<li>- 단, 관람일 당일 취소가능한 상품의 경우 관람일 당일 취소 시에는 티켓금액의 90%가 과금됩니다.</li>
					<li>- 상품의 특성에 따라서, 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인)</li>
				</ul>                                  
			</div>                         
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>