<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/doc.css?a" rel="stylesheet" type="text/css">
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ae59beb75f99cde5bcff835bd333ad4"></script>
<!-- 지도 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

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
	        <div id="map" style="width:500px;height:400px;"></div>                         
			</div>                            
		</div>
	</div>
</div>

<script>
	$(function(){
		//좌표 알아내기
		var geocoder = new daum.maps.services.Geocoder();

		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log(result);
		    }
		};
		
		geocoder.addressSearch('대구오페라하우스', callback);
		
/* 		//지도
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴 */
	})
</script>


<%@ include file="../include/footer.jsp"%>