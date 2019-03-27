<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/manage.css?ab" rel="stylesheet" type="text/css">
<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>            
/* Modal styles */
.modal .modal-dialog {
	max-width: 500px;    
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
	color: #666;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
	height: 34px;
	font-size: 14px;
	letter-spacing: -0.5px;
	color: #575e96;
}

.modal .btn {
	border-radius: 2px;
	min-width: 80px;    
}

.modal form label {
	font-weight: normal;
	font-size: 15px;   
}

/* 모달 폼 */
.form-control:focus {
	border-color: #5cd3b4;
}

/* 연락처 */
.phoneNum{
	display: inline-block;
	padding: 5px 12px;   
	margin: 0 5px;
}

#phoneFirst{
	margin-left: 0;
}

/* 이메일 */
div.form-group select{
	height: 34px;
	width: 32%;        
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
	font-size: 14px;
	letter-spacing: -0.5px;
	color: #575e96;
	padding-left: 5px;
	margin-left: 2px;
	display: inline-block;     
}

/* 우편번호 찾기 */
div.form-group .btn-default{
	border: 1px solid #ddd;
	height: 34px;
	font-size: 14px;
	letter-spacing: -0.5px;
	color: #575e96;
	margin-left: 10px;
}
</style>

<div class="container-fluid manageContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">멤버십 안내</p>
				<p class="engHeadline">Membership</p>
			</div>
			<!-- headline end -->
		</div>
	</div>
	<!-- row end -->
</div>
<!-- container end -->


<div class="container member-container">
	<div class="table-wrapper">
		<div class='titleWrapper'>
			<h2 class='text-center'>회원 관리</h2><hr>
		</div>
	
		<div class="col-sm-12 filter-Wrapper">       
			<div class="filter-group">
				<select name="searchType">
					<option value="id" ${cri.searchType == 'id' ? 'selected' : '' }>아이디</option>
					<option value="name" ${cri.searchType == 'name' ? 'selected' : '' }>이름</option>
				</select>
						
				<input type="text" class="form-control" name="keyword" id="keywordInput" value="${cri.keyword }">
					<button type="button" class="btn btn-primary" id="btnSearch"><i class="fa fa-search"></i></button>
			</div>	<!-- filter-group end -->
		</div>
		
		<div class='col-sm-12 grade-wrapper'>
			<!-- 회원 등급 셀렉트 박스-->
			<p><span id='boldText'>선택한 회원</span>의 등급을
				<select name='memberGrade'>
					<option value='1'>관리자</option>
					<option value='0'>회원</option>
				</select>
				(으)로 <a href='#' id='btnChangeGrade'><i class="fas fa-exchange-alt"></i>변경</a><a href='#' id='btnWithdraw'><i class="fas fa-ban"></i>강제 탈퇴</a>
			</p>  
		</div>
		           
		<table class="table table-striped">
		
			<thead>
				<tr>
					<th></th>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>주소</th>
					<th>이메일</th>
					<th>등급</th>
					<!-- <th>회원 관리</th> -->
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="memberVO" varStatus="i" begin="0" end="${list.size() }" step="1">
				<tr>
					<td>   
						<span class="custom-checkbox">
							<input type="checkbox" id="checkbox${i.index }" value="${memberVO.memberCode }" name='myChkbox'>
							<label for="checkbox${i.index }"></label>
						</span>
					</td>
					<td>${memberVO.memberCode }</td>
					<td>${memberVO.memberName }</td>
					<td>${memberVO.id }</td>
					<td>${memberVO.phone }</td>
					<td>${memberVO.address }</td>
					<td>${memberVO.email }</td>
					<c:if test="${memberVO.isMember == 0}"><td>회원</td></c:if>
					<c:if test="${memberVO.isMember == 1}"><td>관리자</td></c:if>
					<%-- <td>
						<a href="#" data-target='#editMemberModal' class="edit" data-toggle="modal" data-userid='${memberVO.id }'id='btnModifyMember'>   
							<i class="fas fa-pen" data-toggle="tooltip" data-placement="top" title="수정"></i>
						</a>
						<a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
							<i class="fas fa-trash" data-toggle="tooltip" data-placement="top" title="삭제"></i>
						</a>
					</td> --%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div class="clearfix">	
			<ul class="pagination justify-content-center">
				<!-- prev 버튼 달릴 지 판단 -->
                <c:if test="${pageMaker.prev }">
                	<li class="page-item"><a href="${pageContext.request.contextPath }/member/manage?page=${pageMaker.startPage - 1 }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
                </c:if>
                <!-- 현재 선택한 페이지 -->
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                <li ${pageMaker.cri.page == idx ? 'class="page-item active"' : ''}>
	                	<a href="${pageContext.request.contextPath }/member/manage?page=${idx }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link">${idx }</a>
	                </li>
                </c:forEach>
                <!-- next 버튼 -->
                <c:if test="${pageMaker.next }">
                	<li class="page-item"><a href="${pageContext.request.contextPath }/member/manage?page=${pageMaker.endPage + 1 }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
                </c:if>
			</ul>
		</div>
	</div>
</div>

<!-- 수정 모달 -->
<div id="editMemberModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<h4 class="modal-title">회원정보 수정</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>이름</label><input type="text" class="form-control" required="required" id='modalUserId'>
					</div>
					<div class="form-group">
						<label>이메일</label><br>  
						<input type="text" class="form-control" style="width: 30%; display: inline-block; margin-right: 5px;">@
						<!-- 직접 입력 시  -->
						<input type="text" class="form-control" style="width: 30%; display: inline-block; margin-right: 5px;" disabled="disabled" id='emailAddr'>
						<select id="selectEmailAddr" name='selectEmailAddr'>
							<option value='hanmail.net'>hanmail.net</option>
							<option value='naver.com'>naver.com</option>   
							<option value='nate.com'>nate.com</option>
							<option value='gmail.com'>gmail.com</option>
							<option value='hotmail.com'>hotmail.com</option>
							<option value='paran.com'>paran.com</option>
							<option value='empal.com'>empal.com</option>
							<option value='korea.com'>korea.com</option>
							<option value='freechal.com'>freechal.com</option>
							<option value='0'>직접 입력</option>
						</select>
					</div>	
					<div class="form-group">  
						<label>연락처</label><br>
						<input type='text' class='form-control phoneNum' style="width: 15%;"id='phoneFirst' name='phoneFirst'> 
						-<input type='text' class='form-control phoneNum' style="width: 15%;" id="phoneMiddle" name='phoneMiddle'>
						-<input type='text' class='form-control phoneNum' style="width: 15%;" id="phoneLast" name='phoneLast'>
						
					</div>
					<div class="form-group">
						<label>주소</label><br>
						<input class="form-control" style="width: 30%; display: inline;"name="addr1" id="addr1" type="text" readonly="readonly">
						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
						<input class="form-control" style="top: 5px; margin-top: 10px;" name="addr2" id="addr2" type="text" />
						<input class="form-control" style='margin-top: 10px;' name="addr3" id="addr3" type="text" />
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-info" value="수정">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="취소">				
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<h4 class="modal-title">Delete Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning">
						<small>This action cannot be undone.</small>
					</p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	$(function(){
		//툴팁
		$('[data-toggle="tooltip"]').tooltip();
		
		//검색버튼
		$("#btnSearch").click(function(){
			//검색 시, 검색종류와 검색어의 값 가져오기
			var searchType = $("select[name='searchType']").val();
			var keyword = $("#keywordInput").val();
			
			location.href = "${pageContext.request.contextPath}/member/manage?searchType=" + searchType + "&keyword=" + keyword;
		})
	 
		//등급 변경
		$("#btnChangeGrade").click(function(){
			var isChk = $('input:checkbox[name="myChkbox"]').is(":checked");
			//셀렉트 박스
			var isMember = $("select[name='memberGrade']").val();

			if(isChk){
				$("input[name=myChkbox]:checked").each(function() { 
					var mCode = $(this).val();
//					console.log(mCode);
//					console.log(isMember);
					
					$.ajax({
						url: "${pageContext.request.contextPath}/member/updateMemberGrade",
						type: "GET",
						data : {isMember: isMember, mCode: mCode},
						success: function(data){
	//						console.log(data);  
							if(data == "success"){	
								swal("등급이 변경되었습니다.", {
								      icon: "success",
							    })
								.then((value) => {
									location.href = "${pageContext.request.contextPath}/member/manage";	//등급변경 후 새로고침
								});
							}
						}	                   
					})	//ajax end 	
	
				})
			} else{
				swal("회원을 선택해주세요.");
			}
		})
		
		//회원 탈퇴
		$("#btnWithdraw").click(function(){
			var isChk = $('input:checkbox[name="myChkbox"]').is(":checked");
			//셀렉트 박스
			var isMember = $("select[name='memberGrade']").val();

			if(isChk){			
				swal({
					  text: "선택한 회원을 강제 탈퇴시키겠습니까?",
					  icon: "warning",
					  buttons: ["취소", "확인"],
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {			
					    	$("input[name=myChkbox]:checked").each(function() { 
							var mCode = $(this).val();
//							console.log(mCode);
							
							$.ajax({
								url: "${pageContext.request.contextPath}/member/deleteMember",
								type: "GET",
								data : {mCode: mCode},
								success: function(data){
			//						console.log(data);  
									if(data == "success"){	
										swal("선택한 회원을 탈퇴시켰습니다.", {
										      icon: "success",
									    })
										.then((value) => {
											location.href = "${pageContext.request.contextPath}/member/manage";	//등급변경 후 새로고침
										});
									}
								}	                   
							})	//ajax end 	 */
						})
					  } else {
					    swal("취소되었습니다.");
					  }
					});
			} else{
				swal("회원을 선택해주세요.");
			}
		})
		
		/* //이메일 선택
		$("#selectEmailAddr").change(function(){
			$("#selectEmailAddr option:selected").each(function () { 
				if($(this).val() == '0'){	//직접 입력 선택할 경우
					$("#emailAddr").val(''); //값 초기화 
					$("#emailAddr").attr("disabled", false); //input창 입력할 수 있도록 활성화
				}else{ //직접입력이 아닐경우 
					$("#emailAddr").val($(this).text()); 
					//선택값 입력 
					$("#emailAddr").attr("disabled", true); //이메일 주소 입력하지 못하게 한다.
				} 
			});
		}) */
		

	})
</script>





<%@ include file="../include/footer.jsp"%>