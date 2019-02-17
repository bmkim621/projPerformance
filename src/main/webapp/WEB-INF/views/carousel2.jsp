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
	.testimonials{
	background-color: #f33f02;
	position: relative;
	padding-top: 80px;
	&:after{
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		width: 100%;
		height: 30%;
		background-color: #ddd;
	}
}
#customers-testimonials {
	.item-details{
		background-color: #333333;
		color: #fff;
		padding: 20px 10px;
		text-align: left;
		h5{
			margin: 0 0 15px;
			font-size: 18px;
			line-height: 18px;
			span{
				color: red;
				float:right;
				padding-right: 20px;
			}
		}
		p{
			font-size: 14px;
		}
	}
	.item {
			text-align: center;
			// padding: 20px;
			margin-bottom:80px;
	}
}
.owl-carousel .owl-nav [class*='owl-'] {
  -webkit-transition: all .3s ease;
  transition: all .3s ease;
}
.owl-carousel .owl-nav [class*='owl-'].disabled:hover {
  background-color: #D6D6D6;
}
.owl-carousel {
  position: relative;
}
.owl-carousel .owl-next,
.owl-carousel .owl-prev {
  width: 50px;
  height: 50px;
	line-height: 50px;
	border-radius: 50%;
  position: absolute;
  top: 30%;
	font-size: 20px;
  color: #fff;
	border: 1px solid #ddd;
	text-align: center;
}
.owl-carousel .owl-prev {
  left: -70px;
}
.owl-carousel .owl-next {
  right: -70px;
}
	
</style>

</head>
<body>
	
<!-- TESTIMONIALS -->
<section class="testimonials">
	<div class="container">

      <div class="row">
        <div class="col-md-12">
          <div id="customers-testimonials" class="owl-carousel">

            <!--TESTIMONIAL 1 -->
            <div class="item">
              <div class="shadow-effect">
                <img class="img-responsive" src="https://image.freepik.com/free-photo/spaghetti-with-carbonara-sauce_1216-324.jpg" alt="">
                <div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>
              </div>
            </div>
            <!--END OF TESTIMONIAL 1 -->
            <!--TESTIMONIAL 2 -->
            <div class="item">
              <div class="shadow-effect">
                <img class="img-responsive" src="https://image.freepik.com/free-photo/dishes-with-healthy-waffles_1220-367.jpg" alt="">
                <div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>
              </div>
            </div>
            <!--END OF TESTIMONIAL 2 -->
            <!--TESTIMONIAL 3 -->
            <div class="item">
              <div class="shadow-effect">
                <img class="img-responsive" src="https://image.freepik.com/free-photo/top-view-of-tasty-noodles-with-prawns_1203-1769.jpg" alt="">
                <div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>
              </div>
            </div>
            <!--END OF TESTIMONIAL 3 -->
            <!--TESTIMONIAL 4 -->
            <div class="item">
              <div class="shadow-effect">
                <img class="img-responsive" src="https://image.freepik.com/free-photo/burguer-with-garnish_1088-72.jpg" alt="">
                <div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>
              </div>
            </div>
            <!--END OF TESTIMONIAL 4 -->
            <!--TESTIMONIAL 5 -->
            <div class="item">
              <div class="shadow-effect">
                <img class="img-responsive" src="https://image.freepik.com/free-photo/delicious-pastry-with-chicken_1203-1616.jpg" alt="">
                <div class="item-details">
									<h5>Chicken for two Roasted <span>$21</span></h5>
									<p>There was a time when Chinese food in this country meant (Americanized) Cantonese food.</p>
								</div>
              </div>
            </div>
            <!--END OF TESTIMONIAL 5 -->
          </div>
        </div>
      </div>
      </div>
    </section>
    <!-- END OF TESTIMONIALS -->
	
	<script>
	jQuery(document).ready(function($) {
		"use strict";
		$('#customers-testimonials').owlCarousel( {
				loop: true,
				center: true,
				items: 3,
				margin: 30,
				autoplay: true,
				dots:true,
		    nav:true,
				autoplayTimeout: 8500,
				smartSpeed: 450,
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
		});
</script>
	
</body>
</html>