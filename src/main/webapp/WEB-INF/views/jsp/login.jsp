<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Admin</title>

<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="resources/css/vertical-layout-light/style.css">

<link rel="shortcut icon" href="resources/images/favicon.png" />
</head>
<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img src="resources/images/logo.svg" alt="logo">
							</div>
							<h2 style="color: red;">${mess}</h2>
							<h2 style="color: yellow;">${out}</h2>
							<br />
							<h4>Wellcome! let's get started</h4>
							<br />
							<h6 class="font-weight-light">Sign in to continue.</h6>
							<br />
							<form class="pt-3" name='loginForm'
								action="<c:url value='j_spring_security_login' />" method='POST'>
								<div class="form-group">
									<input type='text' class="form-control form-control-lg"
										name="username" placeholder="Username...">
								</div>
								<div class="form-group">
									<input type='password' name='password'
										class="form-control form-control-lg" placeholder="Password...">
								</div>
								<div class="mt-3">
									<input
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										name="submit" type="submit" value="login" />
								</div>
								<div
									class="my-2 d-flex justify-content-between align-items-center">
									<div class="form-check">
										<label class="form-check-label text-muted"> <input
											type="checkbox" name="savepass" value="save"
											class="form-check-input"> Save password
										</label>
									</div>
								</div>
								<div class="text-center mt-4 font-weight-light">
									Don't have an account? <a href="initInsertUser"
										class="text-primary">Create</a>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
</body>
</html>