<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link href="/resources/vendor/font-awesome/css/signin.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="container">

		<div class="row">

			<div class="col-md-4 col-md-offset-4">

				<div class="login-panel panel panel-default">

					<div class="panel-body">
						<form role="form" class="form-signin" action="/login"
							method="post">
							<img src="/resources/img/logo.jpeg" alt="" width="200"
								height="200">
							<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
							<label for="inputEmail" class="sr-only">ID</label> <input
								type="text" name="username" id="inputEmail" class="form-control"
								placeholder="ID" required autofocus> <label
								for="inputPassword" class="sr-only">Password</label> <input
								type="password" name="password" id="inputPassword"
								class="form-control" placeholder="Password" required>
							<div class="checkbox mb-3">
								<label> <input type="checkbox" name="remember-me"
									value="remember-me"> 로그인 상태 유지
								</label>
							</div>
							<button class="btn btn-lg btn-primary btn-success btn-block"
								type="submit">로그인</button>
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }">
						</form>
						
						<br>
						<button type="button" class="btn btn-light">회원가입</button>
						<button type="button" class="btn btn-light">아이디 찾기</button>
						<button type="button" class="btn btn-light">비밀번호 찾기</button>
						<br> 
						<a href="/">
							<button type="button" class="btn btn-light">락 & 학</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<script type="text/javascript">
		$(".btn-success").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});
	</script>
</body>

</html>