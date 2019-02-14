<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/css/common.css2?abc" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- 네비게이션 -->
<nav class="navbar navbar-expand-md fixed-top top-nav">
<div class="container-fluid">
<a class="navbar-brand" href="index.html"><strong>Grafreez</strong></a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"><img src="https://grafreez.com/wp-content/temp_demos/razor/img/icons/menu.png"></span>
</button>



<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav m-auto text-sm-center text-md-center">
<li class="nav-item">
<a class="nav-link" href="#services">Services</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#about">About</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#price">Prices</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#testimonial">Testimonials</a>
</li>
</ul>
</div>
<ul class="navbar-nav ml-auto search-box">
<li class="nav-item">
<a class="nav-link" href="#testimonial">Login</a>
<li class="nav-item">
<a class="nav-link" href="#testimonial">register</a>
</ul>
</div>
</nav>
	
		
	<!-- 스크립트 부분 -->
	<script>
		$(function(){
			$(window).scroll(function() {    
			    var scroll = $(window).scrollTop();

			    if (scroll >= 100) {
			        $(".top-nav").addClass("light-header");
			    } else {
			        $(".top-nav").removeClass("light-header");
			    }
			});		
		})
	</script>
		
