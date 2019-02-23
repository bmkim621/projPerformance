<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/performance.css?b" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myDatepicker.css" rel="stylesheet" type="text/css">
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/performance.js"></script>  
<!-- handlebars -> 제이쿼리 먼저 있어야 함. -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- MDTimePicker -->
<link href="${pageContext.request.contextPath }/resources/css/mdtimepicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/mdtimepicker.js"></script>


<div class="container-fluid perfContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">공연정보</p>
				<p class="engHeadline">Performance Guide</p>
			</div>
			<!-- headline end -->
		</div>
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->

<!-- 공연정보 등록하는 폼 -->
<div class="container-fluid contentsWrapper">
	<div class="formWrapper">

		<form class="f1" action="addPerf" method="post" enctype="multipart/form-data">
			<div class="container">
				<h4>공연 등록하기</h4>
				<hr>  

				<!-- 폼에 들어갈 내용들 -->
				<!-- 1. 공연제목 -->
				<div class="form-group formLabelWrap">          
					<label for="showName">공연제목</label>            
					<input type="text" class="form-control" id="showName" name="showName">
				</div>
				
				<!-- 2. 공연종류 -->
				<div class="form-group" id="showCategory">
					<label for="category">공연종류</label>
					<!-- 콤보박스 -->
					<div class="select select--white form-group">
						<span class="placeholder">공연종류를 선택하세요.</span>
						<ul>
							<li data-value="A">기획공연</li>
							<li data-value="B">대관공연</li>
							<li data-value="C">오페라축제</li>
							<li data-value="D">살롱콘서트</li>
							<li data-value="E">기타</li>
						</ul>
						<!-- 선택한 값 들어가는 부분 -->
						<input type="hidden" name="showType">
					</div>	<!-- select end -->
				</div>
				
				<!-- 3. 공연 총 시간 -->
				<div class="form-group">
					<!-- Alert -->
					<div class="alert alert-warning">
						공연시간은 <strong>정수</strong>로만 입력해주세요. (단위 : 분)
					</div>
					<label for="totalTime">공연시간</label>
					<input type="text" class="form-control" id="totalTime" name="totalTime">
				</div>
				
				<!-- 4. 공연 시작일 -->
				<div class="form-group" id="dateStartWrapper">
					<label for="date">공연시작일</label>
					<div class="pickDateWrapper">
						<input type="text" placeholder="공연시작일을 선택해주세요." name="showStartdate" class="form-control datepicker" id="pickStartDate">
					</div>
				</div>
				
				<!-- 5. 공연 종료일 -->
				<div class="form-group" id="dateEndWrapper">
					<label for="date">공연종료일</label>
					<div class="pickDateWrapper">
						<input type="text" placeholder="공연종료일을 선택해주세요." name="showEnddate" class="form-control datepicker" id="pickEndDate">
					</div>
				</div>
				
				<!-- 6. 공연시작시간 -->
				<div class="form-group">
					<label for="time">공연시간<input type="button" value="초기화" style="margin-left: 10px" id="btnReset"></label>   
					<input type="text" class="form-control" id="timepicker" placeholder="공연시간을 선택해주세요." name="startTime">  
				</div>        
 
				<!-- 7. 공연장소 선택하기 -->
				<div class="form-group" id="Chkfacilities">
					<input type='hidden' name='facilitiesNo' id="fno">
				</div>     


				<!-- 8. 사진 업로드 이미지 --> 
				<div class="form-group">
					<label for="showImage">공연 이미지 업로드</label>    
					<!-- image-preview-filename input [CUT FROM HERE]-->
					<div class="input-group image-preview">
						<input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
						<span class="input-group-btn">
							<!-- image-preview-clear button -->
							<button type="button" class="btn btn-default image-preview-clear" style="display:none;">
								<span class="glyphicon glyphicon-remove"></span>초기화
							</button>
							<!-- image-preview-input -->
							<div class="btn btn-default image-preview-input">
								<span><i class="fas fa-folder-open"></i></span>
								<span class="image-preview-input-title">파일선택</span>   
								<input type="file" accept="image/png, image/jpeg, image/gif" name="uploadFile"/> <!-- rename it -->
							</div>
						</span>
					</div>	<!-- image-preview-filename input end -->
				</div>
			
				<hr>
				<!-- 등록하기 버튼 -->
				<div class="form-group" id="btnWrap">
					<input type="button" class="btn btn-danger" value="등록하기" id="btnAddPerf">      	
				</div>

			</div>	<!-- container end -->
			
		</form>
	</div>
</div>


<!-- test -->
<script>
	//시설 가지고 오는 함수
	function getFacilites(){
		$.ajax({
			url: "${pageContext.request.contextPath}/facilities/list",
			type: "GET",
			dataType: "json",
			success: function(json){
				console.log(json);
				
				$("#Chkfacilities").empty();
				
				var source = $("#template").html();
				var f = Handlebars.compile(source);
				var result = f(json);
				$("#Chkfacilities").append(result);
				$("#Chkfacilities input[type='radio'][value='2']").attr("disabled", true);	//별관 선택못하도록 하기
			}
		})
	}
	
	$(function(){
		getFacilites(); //내가 만든 함수 호출하기 
		
		$("#btnAddPerf").click(function(){
			var item = $("input[name='place']:checked").val();
			$("#fno").val(item);
			
			
			//공연 총 시간 
			
			$('.f1').submit();
			
		})
		
	})
</script>

<!-- 템플릿 -->  
<script id="template" type="text/x-handlebars-template">
<label for="facilitiesNo">공연장소</label>  					
{{#each.}} 
	<div class="radio">      
		<label><input type="radio" value="{{facilitiesNo}}" name="place">
		<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>{{facilitiesName}}</label>
		
	</div>			   	
{{/each}}				
</script>   

<%@ include file="../include/footer.jsp"%>