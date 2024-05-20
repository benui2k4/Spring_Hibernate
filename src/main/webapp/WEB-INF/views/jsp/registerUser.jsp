<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Register Admin</title>
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
							<h4>Don't Account?</h4>
							<h6 class="font-weight-light">Signing up is easy. It only
								takes a few steps</h6>
							<form:form class="pt-3" action="registerUser" modelAttribute="u"
								method="post">

								<div class="form-group">
									<label for="Username">User Name : </label>
									<form:input path="userName" type="text"
										class="form-control form-control-lg" id="userName"
										name="userName" placeholder="Username..." /><br/>
									<form:errors path="userName" cssClass="text-danger" />
								</div>
								<div class="form-group">
									<label for="password">Password : </label>
									<form:input path="passWord" type="password"
										class="form-control form-control-lg" id="passWord"
										name="passWord" placeholder="Password..." /><br/>
									<form:errors path="passWord" cssClass="text-danger" />
								</div>
								<div class="form-group">
									<label for="roleId">Role enable:</label> <select
										class="form-control" id="roleId" name="roleId">
										<option value="1">Admin</option>
									</select>
								</div>

								<div class="form-group">
									<label for="fullname">Full Name : </label>
									<form:input path="fullName" type="text"
										class="form-control form-control-lg" name="fullName"
										id="fullName" placeholder="FullName..." /><br/>
									<form:errors path="fullName" cssClass="text-danger" />
								</div>
								<div class="form-group">
									<label for="gender">Gender:</label><br />
									<form:radiobutton path="gender" id="male" value="true" />
									<label for="male">Nam</label>
									<form:radiobutton path="gender" id="female" value="false" />
									<label for="female">Nữ</label><br/>
									<form:errors path="gender" cssClass="text-danger" />
								</div>

								<div class="form-group">
									<label for="birthday">Birthday:</label>
									<form:input path="birthday" id="birthday" type="date"
										class="form-control form-control-lg" /><br/>
									<form:errors path="birthday" cssClass="text-danger" />
								</div>

								<div class="form-group">
									<label for="address">Address:</label>
									<form:input path="address" id="address" type="text"
										class="form-control form-control-lg" placeholder="Address..." /><br/>
									<form:errors path="address" cssClass="text-danger" />
								</div>
								<div class="form-group">
									<label for="email">Email:</label>
									<form:input path="email" id="email" type="email"
										class="form-control form-control-lg" placeholder="Email..." /><br/>
									<form:errors path="email" cssClass="text-danger" />
								</div>

								<div class="form-group">
									<label for="telephone">Telephone:</label>
									<form:input path="telephone" id="telephone" type="text"
										class="form-control form-control-lg"
										placeholder="Telephone..." /><br/>
									<form:errors path="telephone" cssClass="text-danger" />
								</div>

								<div class="mb-4">
									<div class="form-check">
										<label class="form-check-label text-muted"> <input
											type="checkbox" class="form-check-input"> I agree to
											all Terms - Conditions
										</label>
									</div>
								</div>
								<div class="mt-3">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
										SIGN UP</button>
								</div>
								<div class="text-center mt-4 font-weight-light">
									Already have an account? <a href="login" class="text-primary">Login</a>
								</div>
							</form:form>
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