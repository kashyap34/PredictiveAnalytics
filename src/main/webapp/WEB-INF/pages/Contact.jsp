<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Contact Us</title>
<!-- The styles -->
<link id="bs-css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet">
<style type="text/css">
td {
	width: 400px;
	padding-left: 15px;
}
</style>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">

</head>

<body>
	<!-- topbar starts -->
	<div id="wrapper">

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><strong>Predictive
						Analytics</strong></a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            /input-group
                        </li> -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-dashboard fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="${pageContext.request.contextPath}/dashboard/">
								<i class="fa fa-globe fa-fw"> World</i>
						</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/dashboard/patient">
								<i class="fa fa-user fa-fw"> Patient</i>
						</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw">
							${user.fname}</i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="${pageContext.request.contextPath}/profile"><i
								class="fa fa-user-md fa-fw"></i> Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/data/who"><i
								class="fa fa-gear fa-fw"></i> Admin</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/"><i
								class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default navbar-static-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="#"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="${pageContext.request.contextPath}/dashboard/">
										<i class="fa fa-globe"> World</i>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/dashboard/patient">
										<i class="fa fa-user"> Patient</i>
								</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-archive fa-fw"></i> Data
								Management<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a
									href="${pageContext.request.contextPath}/admin/data/who"> <i
										class="fa fa-cloud-upload"> Upload</i>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/admin/data/who"> <i
										class="fa fa-cloud-download"> Download</i>
								</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/data/who"><i
								class="fa fa-folder-open fa-fw"></i> Browse WHO Data Repo</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/data/who"><i
								class="fa fa-tasks fa-fw"></i> Run EMR Job</a></li>
						<li><a href="#"><i class="fa fa-print fa-fw"></i>
								Generate Report<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="${pageContext.request.contextPath}/dashboard/">
										<i class="fa fa-globe"> World</i>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/dashboard/patient">
										<i class="fa fa-user"> Patient</i>
								</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="${pageContext.request.contextPath}/contact"><i
								class="fa fa-envelope fa-fw"></i> Contact Us</a></li>
					</ul>
					<!-- /#side-menu -->
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<noscript>
			<div class="alert alert-block span10">
				<h4 class="alert-heading">Warning!</h4>
				<p>
					You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
						target="_blank">JavaScript</a> enabled to use this site.
				</p>
			</div>
		</noscript>
		<!-- topbar ends -->

		<!-- content starts -->
		<div id="page-wrapper">
			<div class="row">
			<div class="col-lg-12">
                    <h1 class="page-header">Contact Us</h1>
            </div>
				<div class="col-md-8">
					<div class="well well-sm">
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="name"> Name</label> <input type="text" id="name" name="name"
											style="height: 35px;" placeholder="Enter name"
											required="required" class="form-control" />
									</div>
									<div class="form-group">
										<label for="email"> Email Address</label>
										<div class="input-group">
											<span class="input-group-addon"><span class="add-on"><i
													class="fa fa-envelope"></i></span> </span> <input type="email"
												class="form-control" id="email" style="height: 35px;"
												placeholder="Enter email" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="subject"> Subject</label> <select id="subject"
											name="subject" class="form-control" required="required">
											<option value="na" selected="">Choose One:</option>
											<option value="service">General Customer Service</option>
											<option value="suggestions">Suggestions</option>
											<option value="product">Product Support</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="name"> Message</label>
										<textarea name="message" id="message" class="form-control"
											rows="9" cols="25" required="required" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary pull-right"
										id="btnContactUs" style="height: 35px;"><i class="glyphicon glyphicon-send"> Send</i></button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-4">
						<legend>
							<span><i class="fa fa-globe"></i></span> Our office
						</legend>
						<address>
							<strong>Company, Inc.</strong><br> XXX Street Name, Suite #<br>
							City, State ZIP+4<br> <abbr title="Phone"> P:</abbr> (123)
							456-7890
						</address>
						<address>
							<strong>Full Name</strong><br> <a href="mailto:#">firstName.lastName@example.com</a>
						</address>
				</div>
			</div>
		</div>
	</div>
	<!--/row-->


	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- Core Scripts - Include with every page -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

	<!-- SB Admin Scripts - Include with every page -->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>
</body>
</html>
