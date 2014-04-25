<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WHO Data Manager</title>
<link id="bs-css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet">
<link
	href='${pageContext.request.contextPath}/resources/css/ladda-themeless.min.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/jquery.noty.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/noty_theme_default.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/jqwidgets/styles/jqx.base.css'
	rel='stylesheet' type="text/css" />

<style type="text/css">
progress::-webkit-progress-bar {
	background: #fff;
}

progress::-webkit-progress-value {
	background: #0063a6;
}

.fileinput-button {
	position: relative;
	overflow: hidden;
}

.fileinput-button input {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	opacity: 0;
	-ms-filter: 'alpha(opacity=0)';
	font-size: 200px;
	direction: ltr;
	cursor: pointer;
}

/* Fixes for IE < 8 */
@media screen\9 {
	.fileinput-button input {
		filter: alpha(opacity = 0);
		font-size: 100%;
		height: 100%;
	}
}
</style>
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><i class="fa fa-users"></i> <i class="fa fa-bar-chart-o"></i> Population Analytics</a>
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
					data-toggle="dropdown" href="#"> <i class="fa fa-user"> ${user.fname}</i>
						<i class="fa fa-caret-down"></i>
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


		<!-- Content starts -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Data Management</h1>
				</div>
			</div>
			<!-- content starts -->
			<!-- <div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div> -->


			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<!-- WHO Data Download (Crawler) -->
						<div class="panel-heading">
							<i class="fa fa-folder-open fa-fw"></i> Browse WHO Data
							Repository
						</div>
						<div class="panel-body" id="who-panel">
						<p>Browse the WHO Data Repository by following the links in the below boxes</p>
						<div id="list-box-group">
							<div id="who-list-box-1" style="display: inline-block;"></div>
							<div id="who-list-box-2" style="display: inline-block;"></div>
							<div id="who-list-box-3" style="display: inline-block;"></div>
							<div id="who-list-box-4" style="display: inline-block;"></div>
							<div id="who-list-box-5" style="display: inline-block;"></div>
							<div id="who-list-box-6" style="display: inline-block;"></div>
							<div id="who-list-box-7" style="display: inline-block;"></div>
							<div id="who-list-box-8" style="display: inline-block;"></div>
							<div id="who-list-box-9" style="display: inline-block;"></div>
							<div id="who-list-box-10" style="display: inline-block;"></div>
							<div id="who-list-box-11" style="display: inline-block;"></div>
							<div id="who-list-box-12" style="display: inline-block;"></div>
							<div id="who-list-box-13" style="display: inline-block;"></div>
							<div id="who-list-box-14" style="display: inline-block;"></div>
							<div id="who-list-box-15" style="display: inline-block;"></div>
							<div id="who-list-box-16" style="display: inline-block;"></div>
							<div id="who-list-box-17" style="display: inline-block;"></div>
							<div id="who-list-box-18" style="display: inline-block;"></div>
							<div id="who-list-box-19" style="display: inline-block;"></div>
							<div id="who-list-box-20" style="display: inline-block;"></div>
							<div id="who-list-box-21" style="display: inline-block;"></div>
							<div id="who-list-box-22" style="display: inline-block;"></div>
							<div id="who-list-box-23" style="display: inline-block;"></div>
							<div id="who-list-box-24" style="display: inline-block;"></div>
							<div id="who-list-box-25" style="display: inline-block;"></div>
							<div id="who-list-box-26" style="display: inline-block;"></div>
							<div id="who-list-box-27" style="display: inline-block;"></div>
							<div id="who-list-box-28" style="display: inline-block;"></div>
							<div id="who-list-box-29" style="display: inline-block;"></div>
							<div id="who-list-box-30" style="display: inline-block;"></div>
							<div id="who-list-box-31" style="display: inline-block;"></div>
							<div id="who-list-box-32" style="display: inline-block;"></div>
							<div id="who-list-box-33" style="display: inline-block;"></div>
							<div id="who-list-box-34" style="display: inline-block;"></div>
							<div id="who-list-box-35" style="display: inline-block;"></div>
							<div class="list-group" style="width: 200px; display: inline-block;">
							</div>
							<div class="alert alert-danger" id="crawlerError"></div>
						</div>
						<br />
							<button id="start-over" class="btn btn-success"><i class="fa fa-refresh fa-fw"></i> Start Over</button>
							<%-- <c:choose>
								<c:when test="${crawlerError != null}">
								</c:when>
								<c:otherwise>
									<p>Please use the button below to download the desired data
										from WHO database</p>
										<div class="dropdown">
										<button type="button"
											class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-folder-open"> WHO Links</i>
											<span class="caret"></span>
										</button>
									<ul class="dropdown-menu" role="menu">
										<c:forEach items="${link}" var="linkName">
											<li><a
												href="${pageContext.request.contextPath}/admin/data/who/${linkName}">
													${linkName} </a></li>
										</c:forEach>
										<c:if test="${linkMap != null}">
											<li class="divider"></li>
											<li><center>Download Links</center></li>
											<li class="divider"></li>
											<c:forEach items="${linkMap}" var="linkDetails">
												<li><a href="${linkDetails.value}">
														${linkDetails.key} </a></li>
											</c:forEach>
										</c:if>
									</ul>
									</div>
								</c:otherwise>
							</c:choose> --%>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<!-- <br/>
				<br/> -->
				<!-- Data Upload -->
				<!-- WHO Data Upload -->
				<form action="${pageContext.request.contextPath}/admin/data/who"
					method="post" id="fileUploadForm" enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-cloud-upload fa-fw"></i> WHO Data Upload
							</div>
							<div class="panel-body">
								<p>Please use the File Uploader below to upload the desired
									WHO data in CSV format from your system</p>
								<p>
									<span class="btn btn-success fileinput-button"> <i
										class="fa fa-plus"></i> <span> Add File</span> <input
										id="file" name="file" type="file">
									</span>
									<button class="btn btn-primary" type="submit" id="uploadBtn">
										<i class="fa fa-upload"></i> <span> Upload</span>
									</button>
									<span class="badge" id="csvFileNameSpan"></span>
								<div class="alert alert-danger" id="formatError"></div>
								<!-- <progress value="0" max="100"></progress> -->
								<div class="progress progress-striped">
									<div class="progress-bar" id="who-progress" role="progressbar"
										aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
										<span class="sr-only" id="percentageCompleted"></span>
									</div>
								</div>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</form>
				<!-- end WHO Data Upload -->
				<!-- Patient Data Upload -->
				<form
					action="${pageContext.request.contextPath}/admin/data/who/patient"
					method="post" id="patientUploadForm" enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-cloud-upload fa-fw"></i> Patient Data Upload
							</div>
							<div class="panel-body">
								<p>Please use the File Uploader below to upload the desired
									Patient data in JSON format from your system</p>
								<p>
									<span class="btn btn-success fileinput-button"> <i
										class="fa fa-plus"></i> <span> Add File</span> <input
										id="patientFile" name="patientFile" type="file">
									</span>
									<button class="btn btn-primary" type="submit" id="uploadBtn">
										<i class="fa fa-upload"></i> <span> Upload</span>
									</button>
									<span class="badge" id="jsonFileNameSpan"></span>
								<div class="alert alert-danger" id="patientFormatError"></div>
								<!-- <progress value="0" max="100"></progress> -->
								<div class="progress progress-striped">
									<div class="progress-bar" id="patient-progressbar"
										role="progressbar">
										<span class="sr-only" id="patientPercentageCompleted"></span>
									</div>
								</div>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</form>
				<!-- end Patient Data Upload -->
				<!-- end Data Upload -->
				<!-- Run EMR job -->
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-tasks fa-fw"></i> Run Amazon EMR Job
						</div>
						<div class="panel-body">
							<p>
								Please use the button below to run the Elastic Map Reduce (EMR)
								job on Amazon cloud. <strong>Please note that this
									process takes around 10 minutes to complete. Please do not
									navigate to another page while the process is running.</strong>
							</p>
							<p>
								<button class="btn btn-primary ladda-button"
									data-style="expand-right" type="button" id="emr-job-btn">
									<i class="fa fa-tasks"></i> <span class="ladda-label"
										id="emr-span"> Run EMR job</span>
								</button>
							<div class="alert alert-danger" id="emr-job-error"></div>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!-- End EMR job -->
		</div>
		<!-- end page wrapper -->
	</div>
	<!-- end wrapper -->

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

	<!-- notification plugin -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.noty.js"></script>

	<!-- Button Spinner plugin  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/spin.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ladda.min.js"></script>
	
	<!-- Listbox scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/scripts/demos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jqwidgets/jqxcore.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jqwidgets/jqxdata.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jqwidgets/jqxbuttons.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jqwidgets/jqxscrollbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jqwidgets/jqxlistbox.js"></script>

<script type="text/javascript">
	var listboxCount = 1;
	var sourceList;
	var noOfClicks = 1;
	$(function(){
		$('#formatError').hide();
		$('#patientFormatError').hide();
		$('#csvFileNameSpan').hide();
		$('#jsonFileNameSpan').hide();
		$('#emr-job-error').hide();
		$('#crawlerError').hide();
		$('#start-over').hide();
		//var ladda = Ladda.create($('crawler-loading'));
		//ladda.start();
		
		$.get("${pageContext.request.contextPath}/admin/data/who/links", function(data) {
			var obj = jQuery.parseJSON(data);
			var source = obj.link;
			
			if(source != null) {
				//ladda.stop();
				$('#who-list-box-1').jqxListBox({
					source: source,
					width: '200px',
					height: '250px'
					//selectedIndex: 0
				});
				
				listboxCount ++;
			} 
			else {
				//ladda.stop();
				$('#crawlerError').text(obj.error);
				$('#crawlerError').show();
			}
		});
		
	});
	
	$('div[id*="who-list-box"]').on('change', function(event){
		var query = event.args.item.value;
		$.get('${pageContext.request.contextPath}/admin/data/who/' + query, function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.link != null) {
				sourceList = obj.link;
				console.log('added a new div with list box count: ' + listboxCount);
				
				if(listboxCount > 1) {
					$('#start-over').show();
					console.log('list box count is: ' + listboxCount);
						$('#who-list-box-' + listboxCount).jqxListBox({
						source: sourceList,
						width: '200px',
						height: '250px'
					});
					listboxCount ++;
				}
				else {
				}
			}
			else if(obj.linkMap != null) {
				if(listboxCount > 1) {
					console.log('list box count is: ' + listboxCount);
					$('.list-group').empty();
					$('.list-group').append('<a href="#" class="list-group-item active">Download Links</a>')
					$.each(obj.linkMap, function(key, value) {
						$('.list-group').append(
								'<a href="'+ value +'" class="list-group-item">'+ key +'</a>');
					});
				}
				else {
					//alert('hello');
				}
			}
			else {
				$('#crawlerError').text(obj.error);
				$('#crawlerError').show();
			}
		});
	});
	
	/* $('body').on('DOMNodeInserted', 'div[id*="who-list-box"]', function(){
		//alert('added');
		
	}); */
	
	$('div[id*="who-list-box-"]').on('select', function() {
		var divId = this.id;
		//alert(divId);
		var index = divId.lastIndexOf("-");
		var id = divId.substring(index+1);
		var currentDivIndex = parseInt(id);
		if(currentDivIndex > 1) {
			$('.list-group').empty();
			for(i = currentDivIndex+1; i < listboxCount; i++) {
				$('#who-list-box-' + i).remove();
			}
			//listboxCount = 2;
		}
		else {
			//noOfClicks ++;
			$('.list-group').empty();
			for(i = 2; i < listboxCount; i++) {
				$('#who-list-box-' + i).remove();
			}
			$('#start-over').hide();
		}
	});
	
	$('#start-over').click(function(){
		location.reload();
	}); 
	
	function progressHandlingFunction(e){
    	if(e.lengthComputable){
        	$('#progress').attr({'value':e.loaded, 'max':e.total});
        	$('#progress').css('width', Math.floor((e.loaded/e.total)*100) + '%').attr('aria-valuenow', Math.floor((e.loaded/e.total)*100));
        	//$('#percentageCompleted').text(Math.floor((e.loaded/e.total)*100) + ' complete');
    	}
	}

	$('#file').change(function() {
		$('#formatError').hide();
		$('#csvFileNameSpan').hide();
		var file = this.files[0];
		var name = file.name;
		var size = file.size;
		var type = file.type;
		
		$('#csvFileNameSpan').text(name);
		$('#csvFileNameSpan').show();
		
		//validation
		if(!(/csv/i.test(type))) {
			$('#formatError').text('Please upload CSV files only !');
			$('#formatError').show();
		}
	});
	
	$('#patientFile').change(function() {
		$('#patientFormatError').hide();
		$('#jsonFileNameSpan').hide();
		var file = this.files[0];
		var name = file.name;
		var size = file.size;
		var type = file.type;
		
		$('#jsonFileNameSpan').text(name);
		$('#jsonFileNameSpan').show();
		
		//validation
		if(!(/json/i.test(name))) {
			$('#patientFormatError').text('Please upload JSON files only !');
			$('#patientFormatError').show();
		}
	});
	
	$('#fileUploadForm').submit(function(){
		//var l = Ladda.create(this);
		//l.start();
	    var formData = new FormData($('#fileUploadForm')[0]);
	    $.ajax({
	        url: $('#fileUploadForm').attr('action'),  //Server script to process data
	        type: 'POST',
	        xhr: function() {  // Custom XMLHttpRequest
	            var myXhr = new window.XMLHttpRequest();
	            if(myXhr.upload){ // Check if upload property exists
	                myXhr.upload.addEventListener('progress',function(event){
	                	if(event.lenghtComputable) {
	                		var percentageCompleted = Math.floor((event.loaded/event.total)*100);
	                		$('#who-progressbar').css('width', percentageCompleted + '%');
	                		$('#who-progressbar').html(percentageCompleted + '%');
	                		console.log(percentageCompleted);
	                	}
	                }, false); // For handling the progress of the upload
	            }
	            return myXhr;
	        },
	        // Form data
	        data: formData,
	        //Options to tell jQuery not to process data or worry about content-type.
	        cache: false,
	        contentType: false,
	        dataType: 'json',
	        processData: false,
	        success: function(response) {
	        	if(response.success != null) {
	        		var success = noty({
	        			text: response.success, 
	        			layout: 'top',
	        			type: 'success'
	        		});
	        		//l.stop();
	        	}
	        	else {
	        		var error = noty({
	        			text: response.error, 
	        			layout: 'top',
	        			type: 'error'
	        		});
	        		//l.stop();
	        	}
	        },
	        error: function(data, status, er){
	        	var postError = noty({
        			text: er, 
        			layout: 'topCenter',
        			type: 'error'
        		});
	        	//l.stop();
	        }
	        
	  	});
	    
	    return false;
	});
	
	$('#patientUploadForm').submit(function(){
		//var l = Ladda.create(this);
		//l.start();
	    var formData = new FormData($('#patientUploadForm')[0]);
	    $.ajax({
	        url: $('#patientUploadForm').attr('action'),  //Server script to process data
	        type: 'POST',
	        xhr: function() {  // Custom XMLHttpRequest
	            var myXhr = new window.XMLHttpRequest();
	            if(myXhr.upload){ // Check if upload property exists
	                myXhr.upload.addEventListener('patientProgress',function(event) {
	                	if(event.lengthComputable) {
	                		var percentageCompleted = Math.floor((event.loaded/event.total)*100);
	                		$('#patient-progressbar').css('width', percentageCompleted + '%');
	                		$('#patient-progressbar').html(percentageCompleted + '%');
	                		console.log(percentageCompleted);
	                	}
	                }, false); // For handling the progress of the upload
	            }
	            return myXhr;
	        },
	        // Form data
	        data: formData,
	        //Options to tell jQuery not to process data or worry about content-type.
	        cache: false,
	        contentType: false,
	        dataType: 'json',
	        processData: false,
	        success: function(response) {
	        	if(response.success != null) {
	        		var success = noty({
	        			text: response.success, 
	        			layout: 'top',
	        			type: 'success'
	        		});
	        		//l.stop();
	        	}
	        	else {
	        		var error = noty({
	        			text: response.error, 
	        			layout: 'top',
	        			type: 'error'
	        		});
	        		//l.stop();
	        	}
	        },
	        error: function(data, status, er){
	        	var postError = noty({
        			text: er, 
        			layout: 'topCenter',
        			type: 'error'
        		});
	        	//l.stop();
	        }
	        
	  	});
	    
	    return false;
	});
	
	$('#emr-job-btn').click(function(){
		var l = Ladda.create(this);
		(function poll() {
			setTimeout(function(){
				console.log('Retrieving the status of the EMR job');
				 $.ajax({
			            url: "${pageContext.request.contextPath}/admin/data/emr/status",
			            type: "GET",
			            success: function(data) {
			            	if(data.status.indexOf("Complete") == -1) {
			            		l.start();
				                $('#emr-span').html(data.status);
			            	}
			            	else {
			            		l.stop();
				                $('#emr-span').html(data.status);
				                //clearTimeout(this);
			            	}
			            },
			            dataType: "json",
			            complete: poll,
			            timeout: 5000
			        });
			}, 5000);
		})();
	});

</script>
</body>
</html>
