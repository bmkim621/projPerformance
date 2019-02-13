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
<link href="${pageContext.request.contextPath }/resources/css/common.css?bcd" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-md fixed-top top-nav">
		<div class="container-fluid">
			<!-- 로고 -->
			<a class="navbar-brand" href="#">
				<span><img src="${pageContext.request.contextPath }/resources/upload/logo_w.png"></span>
			</a>
			
			<!-- 모바일 화면일 때 나타나는 메뉴 이미지 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span><img src="${pageContext.request.contextPath }/resources/upload/ico_menu.png"></span>
			</button>
			
			<!-- 메뉴 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="#">공연정보</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">시설대관</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">커뮤니티</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">(재)대구오페라하우스</a>
					</li>
				</ul>
			</div>	<!-- navbarSupportedContent 끝 -->
		</div>	<!-- container-fluid 끝 -->
	
	</nav>
	
	
	<!-- 이미지 슬라이더 -->
	<div class="intro carousel slide bg-overlay-light h-auto" data-ride="carousel" data-interval="4000" id="carouselExampleCaptions">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img class="d-block img-fluid" alt="마술피리" src="${pageContext.request.contextPath }/resources/upload/20190108161143.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="사랑의묘약" src="${pageContext.request.contextPath }/resources/upload/20190108161235.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="헨젤과그레텔" src="${pageContext.request.contextPath }/resources/upload/20190108161430.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="팔리아치" src="${pageContext.request.contextPath }/resources/upload/20190108163201.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="신데렐라" src="${pageContext.request.contextPath }/resources/upload/20190114104538.jpg">
			</div>
		</div>
	
		<!-- button -->
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			<span><img src="${pageContext.request.contextPath }/resources/upload/ico_l_big.png" width="50" height="96"></span>
		</a>
		
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			<span><img src="${pageContext.request.contextPath }/resources/upload/ico_r_big.png" width="50" height="96"></span>
		</a>
		
	</div>	<!-- 슬라이더 끝 -->
	
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	<h2>테스트</h2>
	
	<!-- 스크립트 부분 -->
	<script>
		$(function(){
			$(window).scroll(function() {    
			    var scroll = $(window).scrollTop();

			    if (scroll >= 100) {
			        $(".top-nav").addClass("light-header");
			        $(".navbar-brand").html("<span><img src='${pageContext.request.contextPath }/resources/upload/logo_b.png'></span>");
			    } else {
			        $(".top-nav").removeClass("light-header");
			        $(".navbar-brand").html("<span><img src='${pageContext.request.contextPath }/resources/upload/logo_w.png'></span>");
			    }
			});
		})
	</script>
		
</body>
</html>