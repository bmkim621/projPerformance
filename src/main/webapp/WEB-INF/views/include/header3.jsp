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
<!-- 부트스트랩 그래픽 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/css/common3.css?baddc" rel="stylesheet" type="text/css">
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
				<ul class="nav navbar-nav m-auto text-sm-center text-md-center">
					<li class="nav-item">
						<a class="nav-link" href="#">공연정보</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">시설대관</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">커뮤니티</a>
						
						<!-- 서브메뉴 -->
<!-- 						<div id="dropdownContainThird">
							<div class="dropOut">
								<div class="triangle"></div>
								<ul>
									<li><a href="#">사업소개</a></li>
									<li><a href="#">아카데미</a></li>
									<li><a href="#">오시는 길</a></li>
								</ul>
							</div>
						</div> -->	<!-- 서브메뉴 끝 -->
					</li>
					
					<li class="drop">
						<a href="#" class="nav-link">(재)대구오페라하우스</a>
						
						<!-- 서브메뉴 -->
						<div class="dropdownContain">
					<div class="dropOut">
						<div class="triangle"></div>
						<ul>
							<li><a href="#">Plan</a></li>
							<li><a href="#">Plan</a></li>
							<li><a href="#">Plan</a></li>
							<li><a href="#">Plan</a></li>
						</ul>
					</div>
				</div>	<!-- 서브메뉴 끝 -->
					</li> 
				</ul>	
				
				<!-- 오른쪽 메뉴 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item">
						<a href="#" class="rightMenu"><i class="fas fa-sign-in-alt"></i><span class="spanWrap">로그인</span></a>
					</li>
					
					<li class="nav-item">
						<a href="#" class="rightMenu"><i class="fas fa-heart"></i><span class="spanWrap">회원가입</span></a>
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
		
