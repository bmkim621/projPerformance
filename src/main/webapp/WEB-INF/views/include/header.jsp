<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/common.css?a" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- 이미지 슬라이더 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
		
		<div class="carousel-inner">
			<!-- 첫번째 사진(맨 먼저 보여지는 사진) -->
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath }/resources/upload/20190108161143.jpg" alt="마술피리" width="1920px" height="950px">
			</div>
			
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath }/resources/upload/20190108161235.jpg" alt="사랑의묘약" width="1920px" height="950px">
			</div>
			
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath }/resources/upload/20190108161430.jpg" alt="헨젤과그레텔" width="1920px" height="950px">
			</div>
			
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath }/resources/upload/20190108163201.jpg" alt="팔리아치" width="1920px" height="950px">
			</div>
			
			<!-- 마지막 사진 -->
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath }/resources/upload/20190114104538.jpg" alt="신데렐라" width="1920px" height="950px">
			</div>
			
			<!-- 이미지 방향 조절 -->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span><img src="${pageContext.request.contextPath }/resources/upload/ico_l_big.png" width="50" height="96"></span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" data-slide="next">
				<span><img src="${pageContext.request.contextPath }/resources/upload/ico_r_big.png" width="50" height="96"></span>
			</a>
		</div>
	</div>
		
</body>
</html>