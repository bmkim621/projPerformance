<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
<link href="${pageContext.request.contextPath }/resources/css/doc.css" rel="stylesheet" type="text/css">

<style>
div.container.docFacilitiesInfoWrapper{
	padding: 0;
}

div.bInfoWrapper h2 {
	margin-top: 60px;             
	margin-bottom: 40px;  
	letter-spacing: -0.8px;
}

div.bContentsWrapper{
	position: relative;
	overflow: hidden;
}

div.bContentsWrapper img{
	width: 100%;
}

div.bTextWrapper{
	width: 100%;
	height: 28%;     
	background-color: rgba(0, 0, 0, 0.8);                        
	margin: 0;
	padding: 0;
	position: absolute;
	left: 0;
	bottom: 0;
}

p#bHeadline{
	display: inline-block;  
	position: absolute;
	bottom: 85px;                       
	left: 30px;       
	color: #fff;         
	font-size: 28px;                         
	letter-spacing: -0.5px;                                              
	text-align: left;
	font-weight: 300;          
	
}

 p#bContents{                  
	display: inline-block;
	position: absolute;
	left: 30px;  
	bottom: 40px;        
	color: #fff;
	font-size: 16px;                                                             
	letter-spacing: -0.5px;                                         
	text-align: left;
	font-weight: 300;
	margin: 0;
}

div.docContentsWrapper{
	margin: 60px 0 70px 0;         
}

p.docContents{
	font-weight: lighter;
	color: #686868;
	letter-spacing: -0.5px;
	margin-bottom: 20px;
}

p.docHeadline{
	font-size: 30px;            
	letter-spacing: -0.8px;
	font-weight: lighter;
	margin: 30px 0;  
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
				<h2 class='text-center'>건축</h2>
			</div>
			
			<div class='bContentsWrapper'>
				<img src="${pageContext.request.contextPath }/resources/upload/facility101_img.png">
				<div class='bTextWrapper'>
					<p id='bHeadline'>대구오페라하우스는 <span style='font-weight: bold;'>국내 최초 단독 오페라 전용극장</span>입니다.</p>
					<p id='bContents'>총 2,620평의 부지에 지하2층, 지상4층으로 지어진 건물로 유려한 곡선미의 그랜드 피아노를 형상화하였습니다.<br>내부가 훤히 들여다보이도록 경쾌한 유리재질로 외관을 처리하여 공연장에 대한 시민들의 거리감을 대폭 줄임과 동시에 외적 아름다움을 배가시켰습니다.</p>
				</div>
			</div>
						
			<!-- 내용 -->  
			<div class='docContentsWrapper'>
				<p class='docContents'>대구오페라하우스 부지는 삼성그룹 발전의 모태가 된 제일모직 공장터로, 과거 삶의 애환이 담긴 대표적인 장소였습니다. 하지만 현재, 이곳은 삶을 누리며 즐기는 장소로, 시민들에게 휴식과 이벤트를 제공하는 공간으로 드라마틱하게 변화했습니다. 그렇기 때문에 대구오페라하우스 건축물 그 자체를 하나의 작품, 하나의 오브제로 삼고 자유롭게 건축으로 표현했습니다. 오페라를 담는 공간은 공연 예술이 빛을 발하도록 리듬과 운율을 느낄 수 있는 곳이며, 작가의 메시지를 관객이 보면서 이해할 수 있는 장소입니다. 대구오페하우스는 리듬과 운율, 내재질서를 오브제에 유입시키는 일련의 작업결과라고 할 수 있습니다.</p>                                
				<p class='docHeadline'>공연예술을 위한 공간은 관객과 공연자의 상호교감을 통한 최상의 연출이 가능하도록 음향적 요소와 시각적 디자인이 병행되어야 합니다.</p>
				<p class='docContents'>대구오페라하우스는 말발굽형(Horseshoe-shaped)의 평면과 1,490개의 객석규모, 프로시니엄(Proscenium/무대 전면)의 규모 및 시야확보를 위한 발코니의 구성이 정통 오페라 공연에 필요한 기능을 충족시키고 있습니다. 청각과 시각을 모두 동원해야 하는, 극예술 장르의 퀄리티를 극대화할 수 있는 공연장입니다. 뮤지컬, 발레, 무용, 라이브콘서트, 가극, 악극, 연극 공연 및 영화상영 등이 가능하도록 지어졌으며, 건축 공간 및 무대장치의 효울적 운영 관리를 통해 품질 높은 공연을 제공하고 있습니다.</p>
			</div>                         
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>