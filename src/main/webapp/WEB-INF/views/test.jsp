<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<style>
	#header_slider .owl-prev{
    position: absolute !important;
    left: 2% !important;
    top: 50% !important;
}
#header_slider .owl-next{
    position: absolute !important;
    right: 2% !important;
    top: 50% !important;
}

	div.owl-carousel{
		width: 1200px;
		margin: 0 auto;
	}
	
	div.owl-carousel .item{
		height: 10rem;
		text-align: center;
		background-color: lightblue;
		padding: 1rem;
	}
</style>
</head>
<body>
<h1>test</h1>
<!-- owl-theme: 슬라이드를 컨트롤 할 수 있는 dot 버튼 생성 -->
<div class="owl-carousel owl-theme">
    <div class="item"><h4>1</h4></div>
    <div class="item"><h4>2</h4></div>
    <div class="item"><h4>3</h4></div>
    <div class="item"><h4>4</h4></div>
    <div class="item"><h4>5</h4></div>
    <div class="item"><h4>6</h4></div>
    <div class="item"><h4>7</h4></div>
    <div class="item"><h4>8</h4></div>
    <div class="item"><h4>9</h4></div>
    <div class="item"><h4>10</h4></div>
    <div class="item"><h4>11</h4></div>
    <div class="item"><h4>12</h4></div>
</div>

<script>
$(function(){
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	})
})
</script>
</body>
</html>