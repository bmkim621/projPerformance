<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/manage.css" rel="stylesheet" type="text/css">

<style>            

       
/* ----------------- */



/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
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
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
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
		           
		<table class="table table-striped">
		
			<thead>
				<tr>
					<th><span class="custom-checkbox"><input type="checkbox" id="selectAll"><label for="selectAll"></label></span></th>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>주소</th>
					<th>등급</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="memberVO">
				<tr>
					<td>
						<span class="custom-checkbox">
							<input type="checkbox" id="checkbox1" name="options[]" value="1">
							<label for="checkbox1"></label>
						</span>
					</td>
					<td>${memberVO.memberCode }</td>
					<td>${memberVO.memberName }</td>
					<td>${memberVO.id }</td>
					<td>${memberVO.phone }</td>
					<td>${memberVO.address }</td>
					<c:if test="${memberVO.isMember == 0}"><td>회원</td></c:if>
					<c:if test="${memberVO.isMember == 1}"><td>관리자</td></c:if>
					<td>
						<a href="#editEmployeeModal" class="edit" data-toggle="modal">
							<i class="fas fa-pen" data-toggle="tooltip" data-placement="top" title="수정"></i>
						</a>
						<a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
							<i class="fas fa-trash" data-toggle="tooltip" data-placement="top" title="삭제"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div class="clearfix">	
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a href="#">Previous</a></li>
				<li class="page-item"><a href="#" class="page-link">1</a></li>
				<li class="page-item"><a href="#" class="page-link">2</a></li>
				<li class="page-item active"><a href="#" class="page-link">3</a></li>
				<li class="page-item"><a href="#" class="page-link">4</a></li>
				<li class="page-item"><a href="#" class="page-link">5</a></li>
				<li class="page-item"><a href="#" class="page-link">Next</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<h4 class="modal-title">Add Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label>Address</label>
						<textarea class="form-control" required></textarea>
					</div>
					<div class="form-group">
						<label>Phone</label> <input type="text" class="form-control"
							required>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
						value="Cancel"> <input type="submit"
						class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<h4 class="modal-title">Edit Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label>Address</label>
						<textarea class="form-control" required></textarea>
					</div>
					<div class="form-group">
						<label>Phone</label> <input type="text" class="form-control"
							required>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
						value="Cancel"> <input type="submit" class="btn btn-info"
						value="Save">
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
	})
</script>





<%@ include file="../include/footer.jsp"%>