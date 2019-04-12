<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/doc.css" rel="stylesheet" type="text/css">

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

.table th{
	color: #000!important;
}

p.docContents{
	font-weight: lighter;
	letter-spacing: -0.5px;
	color: #686868;
}                
</style>

<div class="container-fluid facilitiesContainer">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">시설/대관</p>
				<p class="engHeadline">Facility/Hiring Hall</p>
			</div>
			<!-- headline end -->
		</div>
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->

<div class='container docFacilitiesInfoWrapper'>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id='facilitiesInfoContainer'>   
			<div class='bInfoWrapper'>
				<h2 class='text-center'>대관절차</h2>
			</div>
					
			<!-- 내용 -->  
			<div class='docContentsWrapper'>
				<p class='docContents'>※대관자는 공여의 성공적인 개최를 위하여 공연과 관련된 전반적인 진행상황을 대구오페라하우스와 충분히 사전협의하여 주시기 바랍니다.</p>            
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width='25%'>절차</th>
								<th width='75%'>내용</th>        
							</tr> 
						</thead>
						<tbody>                
							<tr>
								<td>대관상담</td>
								<td  class='text-left'>대관문의는 대관 담당자에게 문의하시면 됩니다. 053-666-6060</td>
							</tr>
							<tr>
								<td>대관신청</td>
								<td class='text-left'>
									대관신청을 할 때, 공연대관신청서 및 공연계획서를 작성하여 담당자에게 제출합니다. (심의 자료이므로 상세히 작성)<br>
								 	정기대관: 연2회-상반기 3월(7월~12월), 하반기 9월(다음해 일정 1월~6월)<br>
									수시대관: 당해연도 잔여일정에 수시로 신청 가능
								</td>  
							</tr>
							<tr>
								<td>대관심의</td>
								<td class='text-left'>전문가들로 구성된 운영자문위원회에서 공연단체, 출연자, 작품등의 수준을 심사하고 대관을 결정합니다. 대관은 신청 마감 후 심의까지 1달정도 소요됩니다.</td>
							</tr>
							<tr>
								<td>대관승인</td>
								<td class='text-left'>신청건에 대하여 심의를 거쳐 승인여부 및 사용료 납부기간을 정하여 서면으로 통보하여 드립니다. (긴급한 경우 구두통보)</td>
							</tr>
							<tr>
								<td>대관심의</td>
								<td class='text-left'>
									대관 승인 후 15일 이내에 대관계약을 하고, 계약금을 납부하셔야 합니다.<br>
									계약금은 공연 대관료의 30%이며 계약 체결시에 납부하셔야 합니다.<br>
									수시대관의 경우 승인 통보시에 대관계약일 및 계약금 등을 통보합니다.
								</td>
							</tr>
							<tr>
								<td>대관료납부</td>
								<td class='text-left'>잔금은 사용예정일 50일 전까지 납부하셔야 하며, 부대시설 사용료는 공연종료일까지 납부하셔야 합니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">입장권 검인</h3>
				<ul class='rules'>
					<li>- 입장권 발행은 사전에 대구오페라하우스와 협의하셔서 진행해야 합니다.</li>
					<li>- 공연 7일전까지 입장권 검인신청서를 작성 하셔야 합니다.</li>
				</ul>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">공연홍보</h3>
				<ul class='rules'>
					<li>공연의 홍보를 위하여 대구오페라하우스는 인터넷 홈페이지, 포스터부착, 리플렛전시 등이 있으며 세부사항은 담당자와 협의해 주시기 바랍니다.</li>
				</ul>
				<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">무대스텝회의</h3>
				<ul style='margin-bottom: 80px'>             
					<li>공연 14일전까지 스텝회의 후 공연장사용협조내역서와 무대설치계획서(방염서류, 무대진행계획서, 무대제작도면, 조명도면)를 제출하여 주시기 바랍니다.</li>
				</ul>                                  
			</div>                            
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>