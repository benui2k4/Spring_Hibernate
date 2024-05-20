<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Product Page!</title>
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
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>
							</div>



							<!-- Search -->




							<form action="searchProductByName">
								<input type="text" name="productName" class="form-control"
									id="navbar-search-input" placeholder="Search Product Name..."
									aria-label="search" aria-describedby="search">
							</form>

						</div>

					</li>
				</ul>
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
					<div class="card-body">
						<h2 class="card-title">List Product</h2>

						<h3 style="color: green">${success}</h3>
						<h3 style="color: red">${error}</h3>
						<div class="btn-group" role="group" aria-label="Basic example">
							<form action="initInsertProduct">
								<button type="submit" class="btn btn-success mr-2">New
									Product</button>
							</form>
							<form action="listProduct">
								<button type="submit" class="btn btn-primary">Refresh</button>
							</form>
						</div>

						<div class="table-responsive pt-3">
							<table class="table table-bordered">
								<tr style="text-align: center;">
									<th>Id</th>
									<th>Name</th>
									<th>Producer</th>
									<th>Status</th>
									<th>Category Name</th>
									<th>Images</th>
									<th>Details</th>
									<th>Delete</th>
								</tr>
								<c:forEach items="${listPro}" var="p">
									<tr style="text-align: center;">
										<td>${p.productId}</td>
										<td>${p.productName}</td>
										<td>${p.producer}</td>
										<td>${p.status?"Còn Hàng":"Hết Hàng"}</td>
										<td>${p.cate.categoryName}</td>
										<td><img style="width: 40px; height: 40px;"
											src="<c:url value="resources"/>/Img/${p.proImg}" /></td>
										<td>
											<form action="detailProduct" method="GET">
												<input type="hidden" name="productId" value="${p.productId}">
												<button type="submit" class="btn btn-primary">Detail</button>
											</form>
										</td>
										<td>
											<form id="deleteForm_${p.productId}" action="deleteProduct"
												method="POST">
												<input type="hidden" name="productId" value="${p.productId}">
												<button type="button" class="btn btn-danger"
													onclick="confirmDelete(${p.productId}, '${p.productName}')">Delete</button>
											</form>
										</td>

									</tr>
								</c:forEach>
							</table>
							<hr />


							<div class="pagination">
								<c:forEach items="${listPage}" var="pageNumber">
									<a href="listProduct?page=${pageNumber}"
										style="display: inline-block; padding: 8px 12px; margin: 0 5px; border: 1px solid #ddd; border-radius: 4px; text-decoration: none; color: #333; transition: background-color 0.3s ease; background-color: #fff;"
										onmouseover="this.style.backgroundColor='#f4f4f4'"
										onmouseout="this.style.backgroundColor='#fff'">${pageNumber}</a>
								</c:forEach>
							</div>




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



	<script>
function confirmDelete(productId, productName) {
    if (confirm('Are you sure you want to delete product "' + productName + '"?')) {
        document.getElementById('deleteForm_' + productId).submit();
    }
}
</script>






	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
</body>

</html>