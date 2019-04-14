<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/doc.css?abc" rel="stylesheet" type="text/css">

<style>
div.bInfoWrapper h2 {
		margin-top: 60px;             
		margin-bottom: 40px;  
		letter-spacing: -0.8px;
	}
	
	div.docContentsWrapper{
		overflow: hidden;
		margin-bottom: 60px;
	}
	  
	div#map{
		widows: 100%;
		height: 450px;  
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
		margin-top: 50px;  
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
</style>

<div class="container-fluid mapContainer">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">대구오페라하우스</p>
				<p class="engHeadline">Daegu Opera House</p>
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
				<h2 class='text-center'>오시는 길</h2>
			</div>
					
			<!-- 내용 -->  
			<div class='docContentsWrapper'>  
		        <div id="map"></div>
		        <div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th width='50%' colspan="2">버스 이용 시</th>
									<th width='50%'>지하철 이용 시</th>        
								</tr> 
							</thead>
							<tbody>                
								<tr>
									<td>이마트 방면</td>
									<td>300, 칠곡2, 349, 836, 동구2, 북구4(건너)</td>
									<td>1호선 대구역 하차, 도보 15분, 택시 기본요금</td>
								</tr>
								<tr>
									<td id='2title'>홈플러스 방면</td>
									<td id='2bus'>503, 653, 706, 급행2, 410-1(앞), 북구4(앞), 410(건너)</td>
									<td rowspan="2">3호선 북구청역 하차, 도보 20분, 택시 기본요금</td>
								</tr>
								<tr>
									<td>오페라하우스</td>
									<td>523, 323-1(앞), 323(건너)</td>
								</tr>
							</tbody>
						</table>
					</div>
		        <h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">고속도로 이용 시</h3>
		        <p class='contentsBold'>경부고속도로(1번 고속국도) 이용 시</p> 
					<ul>
						<li>① 경부고속도로 16번 출구(북대구 톨게이트)로 나옴</li>
						<li>② 시내 방향으로 우회전</li>
						<li>③ 서변대교를 건너 좌회전(대구역 및 유통단지 방향)하여 신천대로 진입</li>
						<li>④ 3번(성북교) 지하차도 지난 후 4번 출구(대구역 방면)로 나옴</li>
						<li>⑤ 대구역 방면으로 우회전</li>
						<li>⑥ 두번째 신호등인 홈플러스 칠성점 삼거리에서 우회전</li>
						<li>⑦ 200m 정도 직진하여 홈플러스 야외 주차장을 지나 오페라 하우스 야외주차장에 주차</li>
					</ul>
				 <p class='contentsBold'>구마고속도로(45번 고속국도) 또는 88고속도로(12번 고속국도) 이용 시</p> 
					<ul>
						<li>① 화원 톨게이트에 요금 지불하고 서대구 톨게이트 방면으로 직진</li>
						<li>② 서대구 톨게이트 전에서 오른쪽 출구(팔달교 방면)로 나옴</li>
						<li>③ 신천대로로 진입하여 직진</li>
						<li>④ 3번(성북교) 지하차도 지난 후 4번 출구(대구역 방면)로 나옴</li>
						<li>⑤ 대구역 방면으로 우회전</li>
						<li>⑥ 두번째 신호등인 홈플러스 칠성점 삼거리에서 우회전</li>
						<li>⑦ 200m 정도 직진하여 홈플러스 야외 주차장을 지나 오페라 하우스 야외주차장에 주차</li>
					</ul>             
					<h3 class='contentsHeadline'><img src="${pageContext.request.contextPath }/resources/images/squre_icon.png">철도/지하철 이용 시</h3>
					<p class='contentsBold'>국철 대구역, 또는 지하철 대구역에서 하차하여 중앙로 버스정류장(교동시장 입구쪽)에서 349번 버스 <br> 또는 택시 이용(롯데백화점 정문에서 택시정거장 이용)</p> 
					<ul>
						<li>① 349번은 시민운동장 맞은 편 정거장에서 하차(오페라하우스까지 도보로 5~7분 정도 소요)</li>
						<li>② 택시를 이용할 경우 대구역에서 오페라하우스까지는 기본요금이 나오는 거리임</li>
					</ul>  
					<p class='contentsBold'>지하철 2호선 북구청역에서 하차, 1번 출구에서 도보 3분후 북구청 건너 버스정류장에서 323번 버스 또는 택시 이용</p> 
					<ul>
						<li>① 323번은 대구오페라하우스 맞은편 정거장에서 하차</li>
						<li>② 택시를 이용할 경우 기본요금</li>
						<li>③ 도보로 이동 시 대구도시공사 · 남침산네거리 방향 약 15~20분 소요</li>
					</ul>                         
			</div>                            
		</div>
	</div>
</div>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ae59beb75f99cde5bcff835bd333ad4&libraries=services,clusterer,drawing"></script>

<script> 
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('대구광역시 북구 호암로 15', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">(재)대구오페라하우스</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	       
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	

})
</script>


<%@ include file="../include/footer.jsp"%>