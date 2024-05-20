<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="resources/js/select.dataTables.min.css">
<link rel="stylesheet"
	href="resources/css/vertical-layout-light/style.css">
<link rel="shortcut icon" href="resources/images/favicon.png" />
</head>

<body>



	<div class="container-scroller">

		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="home"><img
					src="resources/images/logo.svg" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="home"><img
					src="resources/images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav navbar-nav-right">

					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img
							src="resources/images/faces/nui.jpg" alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item" href="#"><i
								class="ti-settings text-primary"></i>Settings</a>
							<form action="<c:url value="/j_spring_security_logout" />"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="dropdown-item">
									<i class="ti-power-off text-primary"></i>Logout
								</button>
							</form>
						</div>
					</li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="home"> <i
							class="icon-grid menu-icon"></i> <span class="menu-title">Home</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Category</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="listCategory">List Category</a></li>
							</ul>
						</div></li>

					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#form-elements" aria-expanded="false"
						aria-controls="form-elements"> <i
							class="icon-grid-2 menu-icon"></i> <span class="menu-title">Product</span>
							<i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="form-elements">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="listProduct">List
										Product</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h1 class="card-title">Insert Category</h1>
								<form:form class="forms-sample" action="insertCategory"
									modelAttribute="c" method="post">
									<!-- <table> -->
									<div class="form-group">
										<label for="categoryId">Category Id :</label>
										<form:input path="categoryId" type="text" class="form-control"
											id="categoryId" placeholder="categoryId" />
										<form:errors path="categoryId" cssClass="text-danger" />
									</div>
									<div class="form-group">
										<label for="categoryName">Category Name : </label>
										<form:input path="categoryName" type="text"
											class="form-control" id="categoryName"
											placeholder="categoryName" />
										<form:errors path="categoryName" cssClass="text-danger" />

									</div>
									<div class="form-group">
										<label>Status : </label> <br />
										<form:radiobutton path="status" value="true" id="status" />
										còn hàng
										<form:radiobutton path="status" value="false" id="status" />
										hết hàng <br />
										<form:errors path="status" cssClass="text-danger" />

									</div>
									<td><input type="submit" class="btn btn-primary mr-2"
										value="Insert" /> <input type="reset" class="btn btn-light"
										value="Clear" /></td>
									<!-- </table> -->
								</form:form>

							</div>
						</div>
					</div>
					<footer class="footer">
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
								© 2024. Premium <a href="https://www.bootstrapdash.com/"
								target="_blank">Bootstrap admin template</a> from Sơn Phạm. All
								rights reserved.
							</span>
						</div>
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed
								by <a href="https://www.facebook.com/gom.ghe.9279"
								target="_blank">Sơn Phạm</a>
							</span>
						</div>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<script src="resources/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/vendors/datatables.net/jquery.dataTables.js"></script>
	<script
		src="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="resources/js/dataTables.select.min.js"></script>
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/Chart.roundedBarCharts.js"></script>
</body>

</html>