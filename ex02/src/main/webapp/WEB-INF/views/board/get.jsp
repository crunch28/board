<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>Register</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Board Read Page</h1>
							</div>
							<div class="form-group">
								<label>Bno</label> <input class="form-control form-control-user"
									id="exampleInputEmail" name="bno"
									value='<c:out value="${board.bno }"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<label>Title</label> <input
									class="form-control form-control-user" id="exampleInputEmail"
									name="title" value='<c:out value="${board.title }"/>'
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control form-control-user"
									id="exampleInputEmail" name="content" readonly="readonly">
										<c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> <input
									class="form-control form-control-user" id="exampleInputEmail"
									name="writer" value='<c:out value="${board.writer }"/>'
									readonly="readonly">
							</div>
							<button data-oper="modify"
								class="btn btn-primary btn-user btn-block">Modify</button>
							<hr>
							<button data-oper="list"
								class="btn btn-warning btn-user btn-block">List</button>

							<form action="/board/modify" id="operForm" method="get">
								<input type="hidden" id="bno" name="bno"value="<c:out value='${board.bno }' />"> 
								<input type="hidden" id="pageNum" name="pageNum" value="<c:out value='${cri.pageNum }' />"> 
								<input type="hidden" id="amount" name="amount" value="<c:out value='${cri.amount }' />">
								<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
								<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});
	});
</script>