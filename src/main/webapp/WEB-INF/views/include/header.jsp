<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 부트스트랩 js보다 먼저 선언되어 있을 것 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> 
<!-- Owl carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
<!-- Owl Carousel js -->
<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<!-- 부트스트랩 그래픽 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- css -->
<link href="${pageContext.request.contextPath }/resources/css/common.css?aa" rel="stylesheet" type="text/css">
<!-- mobile -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hc-offcanvas-nav.css">
<script src="${pageContext.request.contextPath }/resources/js/hc-offcanvas-nav.js"></script>
<title>재단법인 대구오페라하우스</title>
<script>
	var contextPath = "${pageContext.request.contextPath}";          
</script>
</head>
<body>       

	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-md fixed-top top-nav">
		<div class="container-fluid">
			<!-- 로고 -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}">
				<span><img src="${pageContext.request.contextPath }/resources/upload/logo_w.png"></span>
			</a>
			
			<!-- 메뉴 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="nav navbar-nav m-auto text-sm-center text-md-center">
					<li class="drop">
						<a class="nav-link">공연정보</a>
						
						<!-- 서브메뉴 -->
						<div id="dropdownContainFirst">
							<div id="dropOutFirst">
							<div id="triangleFirst"></div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/perf/perfList">공연안내</a></li>
									<li><a href="${pageContext.request.contextPath}/doc/info">예매안내</a></li>
									<li><a href="${pageContext.request.contextPath}/member/bookInfo">예매확인</a></li>
								</ul>
							</div>
						</div>	<!-- 서브메뉴 끝 -->
					</li>
					
					<li class="drop">
						<a class="nav-link">시설대관</a>
						
						<!-- 서브메뉴 -->
						<div id="dropdownContainSecond">
							<div id="dropOutSecond">
							<div id="triangleSecond"></div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/doc/facilities">시설안내</a></li>
									<li><a href="${pageContext.request.contextPath}/doc/rent">대관안내</a></li>
								</ul>
							</div>
						</div>	<!-- 서브메뉴 끝 -->
					</li>
					
					<li class="drop">
						<a class="nav-link">커뮤니티</a>
						
						<!-- 서브메뉴 -->
						<div id="dropdownContainThird">
							<div id="dropOutThird">
							<div id="triangleThird"></div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>  
									<li><a href="${pageContext.request.contextPath}/review/list">공연관람후기</a></li>
									<li><a href="${pageContext.request.contextPath}/doc/gallery">갤러리</a></li>
								</ul>
							</div>
						</div>	<!-- 서브메뉴 끝 -->
					</li>
					
					<li class="drop">
						<a class="nav-link">(재)대구오페라하우스</a>
						
						<!-- 서브메뉴 -->
						<div class="dropdownContain">
							<div class="dropOut">
							<div class="triangle"></div>
								<ul>
<!-- 								<li><a href="#">사업소개</a></li>
									<li><a href="#">홍보관</a></li> -->
									<li><a href="#">오시는 길</a></li>
								</ul>
							</div>
						</div>	<!-- 서브메뉴 끝 -->
					</li>
					
					<!-- 관리자로 로그인했을 경우 서브 메뉴 추가 -->
					<c:if test="${login != null && login.isMember == 1 }">
					<li class="drop">
						<a href="#" class="nav-link">관리자메뉴</a>
						
						<!-- 서브메뉴 -->
						<div class="dropdownContain">
							<div class="dropOut">
							<div class="triangle"></div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/notice/register">공지사항 작성</a></li>
									<li><a href="${pageContext.request.contextPath}/perf/addPerf">공연 추가</a></li>
									<li><a href="${pageContext.request.contextPath}/member/manage">회원 관리</a></li>             
								</ul>           
							</div>
						</div>	<!-- 서브메뉴 끝 -->
					</li>	
					</c:if>
				</ul>	
				
				<!-- 오른쪽 메뉴 -->               
				<ul class="nav navbar-nav navbar-right">
					<!-- 로그인 X -->
					<c:if test="${login == null }">
						<li class='nav-item'>
							<a href="${pageContext.request.contextPath }/member/login" class="rightMenu"><i class="fas fa-sign-in-alt"></i><span class="spanWrap">로그인</span></a>
						</li>
						<li class='nav-item'>
							<a href="${pageContext.request.contextPath}/member/joinTerms" class="rightMenu"><i class="fas fa-heart"></i><span class="spanWrap">회원가입</span></a>
						</li>
					</c:if>
							         
					<!-- 로그인 O -->
					<c:if test="${login != null }">
						<li class='nav-item memWelcome'>   
							<span class='welcomWrap'>${login.username }&#40;${login.userid }&#41;님, 환영합니다!</span>
						</li>
						<li class='nav-item'>
							<a href="${pageContext.request.contextPath }/member/logout" class="rightMenu"><i class="fas fa-sign-out-alt"></i><span class="spanWrap">로그아웃</span></a>	
						</li>
						<li class='nav-item'>   
							<a href="${pageContext.request.contextPath }/member/confirmMember" class="rightMenu"><i class="fas fa-user"></i><span class='spanWrap'>마이페이지</span></a>
						</li>
					</c:if>
					           
				</ul>
							
			</div>	<!-- navbarSupportedContent 끝 -->
		</div>	<!-- container-fluid 끝 -->
	</nav>
	
	
	<!-- 모바일 메뉴 -->
	<nav id='main-nav'>
		<ul class='first-nav'>
			<li class='performancieInfo'>
				<a href="#">공연정보</a>
				<ul>
					<li><a href="#">공연안내</a></li>
					<li><a href="#">예매안내</a></li>
					<li><a href="#">예매확인</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class='second-nav'>
			<li class='rentFacilities'>
				<a href="#">시설대관</a>
				<ul>
					<li><a href="#">시설안내</a></li>
					<li><a href="#">대관안내</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class='third-nav'>
			<li class='community'>
				<a href="#">커뮤니티</a>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">공연관람후기</a></li>
					<li><a href="#">갤러리</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class='fourth-nav'>
			<li class='dgoperahouse'>
				<a href="#">(재)대구오페라하우스</a>
				<ul>
					<li><a href="#">사업소개</a></li>
					<li><a href="#">홍보관</a></li>
					<li><a href="#">오시는 길</a></li>
				</ul>
			</li>
		</ul>
		
		<!-- 관리자메뉴 -->
		<ul class='fifth-nav'>
			<li class='managermenu'>
				<a href="#">관리자메뉴</a>
				<ul>
					<li><a href="#">공지사항 작성</a></li>
					<li><a href="#">공연추가</a></li>
					<li><a href="#">회원관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	
		
	<!-- 스크립트 부분 -->
	<script>
		

		$(function(){
			//모바일 메뉴
			$('#main-nav').hcOffcanvasNav({
				maxWidth: 1024.5 
			});
			
			//스크롤바 내렸을 때 보이는 메뉴
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
			
			//우클릭 못하게 막기
			$("body").contextmenu(function() {
				return false;
			});
		})
	</script>
		
