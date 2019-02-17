<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bs -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> 
<!-- owl -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<!-- 부트스트랩 그래픽 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<title>Insert title here</title>

<style>
div#carouselWrapper{
	border: 2px solid black;
	background-color: gray;
	position: relative;
}

div.container{
	border: 2px solid green;
	padding-left: 30px;   
	padding-right: 30px; 
}


div#myCarousel div.item{
	text-align: center;
	border: 2px solid red;
	margin: 20px 0;

}

div#myCarousel div.item > div.shahpe{
	width: 50px;
	height: 50px;
	background-color: purple;
	position: absolute;
	top: 20px;  
	left: 0px;   
}

div#myCarousel div.item div.img-box{
	border: 2px solid yellow;
	width: 250px;  
}

div#myCarousel div.item-details{
	background: salmon;
	color: blue;
	padding: 10px;
}

.owl-carousel .owl-next,
.owl-carousel .owl-prev {
  position: absolute;
  top: 35%;
}

.owl-carousel .owl-nav button.owl-prev, .owl-carousel .owl-nav button.owl-next{ 
	font-size: 50px;
	color: white;  
}

/* 위치 */
.owl-carousel .owl-prev {
  left: -90px;
}
.owl-carousel .owl-next {
  right: -90px;   
}

div.owl-dots{
	width: 0;
	height: 0;
}
</style>

</head>
<body>
	
	<div id="carouselWrapper">
	
		<div class="container">
			
			<div class="row">
			
				<div class="col-md-12">
					
					<div class="owl-carousel" id="myCarousel">
					
						<!-- 아이템1 -->
						<div class="item">
								<div class="shahpe"></div>
								
								<div class="img-box">
									<img class="img-responsive" src="https://image.freepik.com/free-photo/spaghetti-with-carbonara-sauce_1216-324.jpg" alt="">
								</div>
								
								<div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>	
						</div>
						
						<!-- 아이템2 -->
												<div class="item">
							<div class="carousel-inner">
								
								<div class="img-box">
									<img class="img-responsive" src="https://image.freepik.com/free-photo/dishes-with-healthy-waffles_1220-367.jpg" alt="">
								</div>
								
								<div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>	
							</div>
						</div>
						
						<!-- 아이템3 -->
						<div class="item">
							<div class="carousel-inner">
								
								<div class="img-box">
									                <img class="img-responsive" src="https://image.freepik.com/free-photo/top-view-of-tasty-noodles-with-prawns_1203-1769.jpg" alt="">

								</div>
								
								<div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>	
							</div>
						</div>
						
						<!-- 아이템4 -->						
						<div class="item">
							<div class="carousel-inner">
								
								<div class="img-box">
									                <img class="img-responsive" src="https://image.freepik.com/free-photo/burguer-with-garnish_1088-72.jpg" alt="">

								</div>
								
								<div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>	
							</div>
						</div>
						
						<!-- 아이템5 -->
						<div class="item">
							<div class="carousel-inner">
								
								<div class="img-box">
									               <img class="img-responsive" src="https://image.freepik.com/free-photo/delicious-pastry-with-chicken_1203-1616.jpg" alt="">

								</div>
								
								<div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>	
							</div>
						</div>
						
						
					
					</div>
				
				
				</div>
				
			</div>
		   
		
		</div>
	
	</div>
	
	

	
	<script>
	$(function(){
		$('#myCarousel').owlCarousel( {
			loop: true,
			items: 3,
			margin: 30,
	    nav:true,
	  	navText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],  
			responsive: {
				0: {
					items: 1
				},
				768: {
					items: 2
				},
				1170: {
					items: 3
				}
			}
		}); 
	})
</script>
	
</body>
</html>