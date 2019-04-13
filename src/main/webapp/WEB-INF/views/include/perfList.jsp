<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/perfList.css?dd">

<p style="color:white" id='pWhite'>.</p>	<!-- 텍스트 넣지 않으면 carousel 안에 item이 보이지 않음(아직 해결X) -->    

<!-- 공연 리스트 이미지 -->
	<div class="carouselWrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="owl-carousel" id="myCarousel">
						<!-- 공연 리스트1 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>   
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">        
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1526.jpg" alt="버섯피자">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">렉처오페라&nbsp;&#60;&nbsp;버섯피자&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>   
								</div>
							</div>
															
							<div class="item-details">
								<p class="day">22</p>
								
								<div class="contents">  
									<span class="date">2019.02.22</span><br>
									<span class="title">렉처오페라&nbsp;&#60;&nbsp;버섯피자&nbsp;&#62;</span>
								</div>
							</div>						
						</div>	<!-- 1 Item end -->    
						
						<!-- 공연 리스트2 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1516.jpg" alt="마술피리">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">오페라 유니버시아드&nbsp;&#60;&nbsp;마술피리&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>  
								</div>
							</div>
														
							<div class="item-details">
								<p class="day">07</p>
								
								<div class="contents">
									<span class="date">2019.03.07</span><br>
									<span class="title">오페라 유니버시아드&nbsp;&#60;&nbsp;마술피리&nbsp;&#62;</span>       
								</div>
							</div>
						</div>	<!-- 2 Item end -->
						
						<!-- 공연 리스트3 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1525.jpg" alt="사랑의묘약">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">영아티스트 오페라&nbsp;&#60;&nbsp;사랑의 묘약&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>   
								</div>
							</div>
							
							
							<div class="item-details">
								<p class="day">29</p>
								
								<div class="contents">
									<span class="date">2019.03.29</span><br>
									<span class="title">영아티스트 오페라&nbsp;&#60;&nbsp;사랑의 묘약&nbsp;&#62;</span>
								</div>
							</div>				
						</div>	<!-- 3 Item end -->
						
						<!-- 공연 리스트4 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1518.jpg" alt="팔리아치">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">오페라&nbsp;&#60;&nbsp;팔리아치&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>   
								</div>
							</div>
							
							<div class="item-details">
								<p class="day">26</p>
								
								<div class="contents">
									<span class="date">2019.04.26</span><br>
									<span class="title">오페라&nbsp;&#60;&nbsp;팔리아치&nbsp;&#62;</span>
								</div>
							</div>				
						</div>	<!-- 4 Item end -->
						
						<!-- 공연 리스트5 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1519.jpg" alt="헨젤과그레텔">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">가족오페라&nbsp;&#60;&nbsp;헨젤과 그레텔&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>   
								</div>
							</div>
							
							<div class="item-details">
								<p class="day">24</p>
								
								<div class="contents">
									<span class="date">2019.05.24</span><br>
									<span class="title">가족오페라&nbsp;&#60;&nbsp;헨델과 그레텔&nbsp;&#62;</span>
								</div>
							</div>				
						</div>	<!-- 5 Item end -->
						
						<!-- 공연 리스트6 -->
						<div class="item">
							<!-- tag_blue -->
							<div class="tag-blue">
								<img src="${pageContext.request.contextPath }/resources/upload/tag_blue.png">
								<span class="category">기획<br>공연</span>     
							</div>
							
							<!-- 공연 이미지 리스트 -->
							<div class="img-box">
								<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/1520.jpg" alt="신데렐라">
								
								<!-- 공연 이미지 마우스 오버 시 나타나는 영역 -->
								<div class="img-hover">
									<p class="showTitle">모나코 몬테카를로 발레단&nbsp;&#60;&nbsp;신데렐라&nbsp;&#62;</p>
	          
									<a class="fa-stack fa-lg" href="#">
										<i class="fa fa-circle fa-stack-2x icon-background"></i>
										<i class="fas fa-search fa-stack-1x"></i>
									</a>   
								</div>
							</div>
							          
							<div class="item-details">
								<p class="day">08</p>
								
								<div class="contents">
									<span class="date">2019.06.08</span><br>
									<span class="title">모나코 몬테카를로 발레단&nbsp;&#60;&nbsp;신데렐라&nbsp;&#62;</span>
								</div>
							</div>				
						</div>	<!-- 6 Item end -->	
					</div>	<!-- myCarousel end -->      
				</div>	<!-- col-md-12 end -->
			</div>	<!-- row end -->
		</div>	<!-- container end -->
	</div>	<!-- wrapper end -->
	
	
	<!-- Owl carousel -->
	<script>
		$(function(){
			$('#myCarousel').owlCarousel({
				loop: true,	//무한 반복 여부
				items: 3,	//화면에 보여줄 항목 개수    
				margin: 10,	//항목의 오른쪽 마진 
		    	nav:true,	//내비게이션에 prev, next와 같은 버튼 표시
		  		navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],	//내비게이션 버튼의 텍스트
		/* 		responsive: {	//반응형(화면에서 따라 보여지는 항목 개수)
					0: {
						items: 1                
					},
					768: {
						items: 2                   
					},
					1024: {
						items: 3
					}
				} */
			});
			
			
			$(".img-box").hover(function(){
				$(this).find(".img-hover").fadeIn(300)
			}, function(){
				$(this).find(".img-hover").fadeOut(300)                                      
			});

		})
	</script>