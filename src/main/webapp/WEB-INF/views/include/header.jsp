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
<link href="${pageContext.request.contextPath }/resources/css/common.css?bc" rel="stylesheet" type="text/css">
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
				<ul class="nav navbar-nav">
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
						<a href="#" class="nav-link">(재)대구오페라하우스</a>
						
					          <div class="dropdownContain">
					<div class="dropOut">
						<div class="triangle"></div>
						<ul>
							<li><a href="#">Plan</a></li>
							<li><a href="#">Account Settings</a></li>
							<li><a href="#">Switch Account</a></li>
							<li><a href="#">Sign Out</a></li>
						</ul>
					</div>
				</div>
					</li> 
				</ul>		
			</div>	<!-- navbarSupportedContent 끝 -->
		</div>	<!-- container-fluid 끝 -->
	
	</nav>
	
		
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
		
