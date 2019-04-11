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
					<li class='selectCategoryStyle'><a href="${pageContext.request.contextPath}/doc/info">예매안내</a></li>
					<li><a href="${pageContext.request.contextPath}/doc/discount">기본할인안내</a></li>
					<li><a href="${pageContext.request.contextPath}/doc/refund">환불/취소안내</a></li>
				</ul>
			</div>
			
			<!-- 내용 -->
			<div class='docContentsWrapper'>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">인터넷 예매</h3>
				<ul>
					<li>- 대구오페라하우스 사이트에서 직접 예매</li>
					<li>- 대구오페라하우스(홈페이지, 전화)를 통해서 예매하시면 예매수수료가 없습니다.</li>
				</ul>             
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">전화 예매</h3>
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width='25%'>예매처</th>
								<th width='25%'>전화번호</th>
								<th width='50%'>운영시간</th>        
							</tr> 
						</thead>
						<tbody>                
							<tr>
								<td>대구오페라하우스 별관</td>
								<td>053-666-6170</td>
								<td>평일 화~금 오전 10시 ~ 오후 5시<br>(일, 월, 공휴일은 휴무)</td>
							</tr>
							<tr>
								<td>인터파크 콜센터</td>
								<td>1544-1555</td>  
								<td>평일/토요일 오전 9시 ~ 오후 8시,<br>일요일/공휴일 오전 9시 ~ 오후 6시</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">방문 예매</h3>
				<p class='contentsBold'>대구오페라하우스 별관</p>
				<ul class='rules'>
					<li>- 운영시간 : 평일 화~토 오전 10시 ~ 오후 5시 (일, 월, 공휴일은 휴무)</li>
					<li>- 대구오페라하우스 본관 사무실은 방문 예매가 불가하오니, 공연 기획사 측에 문의바랍니다.</li>
				</ul>
				<p class='contentsBold'>현장매표소 운영은 공연 당일 본관 1층에서만 진행하며, 공연 시작 1시간 30분 전부터 공연시작 전까지 구입가능 합니다.</p>
				<ul class='rules'>
					<li>- 대관공연은 방문예매가 불가하오니, 공연 기획사 측에 문의바랍니다.</li>
				</ul>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">입장권 수령 안내</h3>
				<ul style='margin-bottom: 80px'>             
					<li>- 공연 당일 수령 - 공연시작 1시간 30분 전부터 1층 매표소에서 수령</li>
					<li>- 공연일 이전 수령 - 대구오페라하우스 별관에서 수령 (단, 오페라하우스 기획공연으로 전화예매 티켓에 한함)</li>
					<li>- 티켓 수령시 예매자명과 예매번호를 정확히 알고 오시면 티켓 수령이 좀 더 원활할 수 있습니다.</li>
					<li>- 입장권 분실 및 파손 시 재발급이 되지 않으니 보관에 유의하여 주십시오.</li>
				</ul>                                  
			</div>                         
		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>