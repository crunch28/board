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
								<h1 class="h4 text-gray-900 mb-4">Board Register</h1>
							</div>
							<form role="form" action="/board/register" method="post">
								<div class="form-group">
									<label>Title</label> <input type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										name="title" placeholder="Title">
								</div>
								<div class="form-group">
									<label>Text area</label>
									<textarea class="form-control form-control-user"
										id="exampleInputEmail" name="content" placeholder="Text area">
										</textarea>
								</div>
								<div class="form-group">
									<label>Writer</label> <input type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										name="writer" placeholder="Writer">
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">Submit</button>
								<hr>
								<button type="reset" class="btn btn-danger btn-user btn-block">Reset</button>
								<hr>
								<a href="/board/list" class="btn btn-warning btn-user btn-block">List</a>
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
