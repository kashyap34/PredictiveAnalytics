<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WHO Data Manager</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-classic.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/charisma-app.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.8.21.custom.css"
	rel="stylesheet" type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/ladda-themeless.min.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/fullcalendar.print.css'
	rel='stylesheet' media='print' type="text/css" />
<link href='${pageContext.request.contextPath}/resources/css/chosen.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/uniform.default.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/colorbox.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/jquery.cleditor.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/jquery.noty.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/noty_theme_default.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/elfinder.min.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/elfinder.theme.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/jquery.iphone.toggle.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/opa-icons.css'
	rel='stylesheet' type="text/css" />
<link
	href='${pageContext.request.contextPath}/resources/css/uploadify.css'
	rel='stylesheet' type="text/css" />

<style type="text/css">
progress::-webkit-progress-bar { background: #fff; }
progress::-webkit-progress-value { background: #0063a6; }

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
    filter: alpha(opacity=0);
    font-size: 100%;
    height: 100%;
  }
}

.imgClass { 
    background-image: url('${pageContext.request.contextPath}/resources/img/Compute & Networking_Amazon EMR Cluster.svg');
    background-position:  0px 0px;
    background-repeat: no-repeat;
    width: 186px;
    height: 53px;
    border: 0px;
    background-color: none;
    cursor: pointer;
    outline: 0;
}

.modal {
    display:    none;
    position:   fixed;
    z-index:    1000;
    top:        0;
    left:       0;
    height:     100%;
    width:      100%;
    background: rgba( 255, 255, 255, .8 ) 
                url('${pageContext.request.contextPath}/resources/img/ajax-loaders/ajax-loader-1.gif') 
                50% 50% 
                no-repeat;
}

/* When the body has the loading class, we turn
   the scrollbar off with overflow:hidden */
body.loading {
    overflow: hidden;   
}

/* Anytime the body has the loading class, our
   modal element will be visible */
body.loading .modal {
    display: block;
}
</style>
</head>
<body>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="#"><span>Predictive Analytics</span></a>

				<!-- user dropdown starts -->
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> ${userName}</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
						<li class="divider"></li>
						<li><a href="login.html">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->

				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">Visit Site</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2"
									name="query" type="text">
							</form>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->

	<div class="container-fluid">
		<div class="row-fluid">

			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="index.html"><i
								class="icon-home"></i><span class="hidden-tablet">
									Dashboard</span></a></li>
						<li><a class="ajax-link" href="ui.html"><i
								class="icon-eye-open"></i><span class="hidden-tablet"> UI
									Features</span></a></li>
						<li><a class="ajax-link" href="form.html"><i
								class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
						<li><a class="ajax-link" href="chart.html"><i
								class="icon-list-alt"></i><span class="hidden-tablet">
									Charts</span></a></li>
						<li><a class="ajax-link" href="typography.html"><i
								class="icon-font"></i><span class="hidden-tablet">
									Typography</span></a></li>
						<li><a class="ajax-link" href="gallery.html"><i
								class="icon-picture"></i><span class="hidden-tablet">
									Gallery</span></a></li>
						<li class="nav-header hidden-tablet">Sample Section</li>
						<li><a class="ajax-link" href="table.html"><i
								class="icon-align-justify"></i><span class="hidden-tablet">
									Tables</span></a></li>
						<li><a class="ajax-link" href="calendar.html"><i
								class="icon-calendar"></i><span class="hidden-tablet">
									Calendar</span></a></li>
						<li><a class="ajax-link" href="grid.html"><i
								class="icon-th"></i><span class="hidden-tablet"> Grid</span></a></li>
						<li><a class="ajax-link" href="file-manager.html"><i
								class="icon-folder-open"></i><span class="hidden-tablet">
									File Manager</span></a></li>
						<li><a href="tour.html"><i class="icon-globe"></i><span
								class="hidden-tablet"> Tour</span></a></li>
						<li><a class="ajax-link" href="icon.html"><i
								class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
						<li><a href="error.html"><i class="icon-ban-circle"></i><span
								class="hidden-tablet"> Error Page</span></a></li>
						<li><a href="login.html"><i class="icon-lock"></i><span
								class="hidden-tablet"> Login Page</span></a></li>
					</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input
						id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<!-- left menu ends -->

			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="span10">
				<!-- content starts -->


				<div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div>

				<div class="row-fluid">
					<div class="box span12">
						<!-- WHO Data Download (Crawler) -->
						<div class="box-header well">
							<h2>
								<i class="icon-download"></i> WHO Data Download
							</h2>
						</div>
						<div class="box-content">
							<c:choose>
							<c:when test="${crawlerError != null}">
								<div class="alert alert-danger" id="crawlerError">
									${crawlerError}
								</div>
							</c:when>
							<c:otherwise>
									<p>Please use the button below to download the desired data
										from WHO database</p>
									<p class="center">
									
										<button type="button" class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">
											<span class="icon-folder-open"></span> WHO Links <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
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
									</p>
								</c:otherwise>
					</c:choose>
						<div class="clearfix"></div>
					</div>
				</div>
				<br/>
				<br/>
				<!-- Data Upload -->
				<!-- WHO Data Upload -->
				<form action="${pageContext.request.contextPath}/admin/data/who" method="post" id="fileUploadForm" enctype="multipart/form-data">
				<div class="box span12">
					<div class="box-header well">
							<h2>
								<i class="icon-upload"></i> WHO Data Upload
							</h2>
						</div>
						<div class="box-content">
							<p>Please use the File Uploader below to upload the desired WHO data in CSV format
								from your system</p>
							<p>
								<span class="btn btn-success fileinput-button">
									<i class="icon-plus-sign"></i>
									<span>Add File</span>
									<input id="file" name="file" type="file">
								</span>
								<button class="btn btn-primary" type="submit" id="uploadBtn">
									<i class="icon-upload"></i>
									<span>Upload</span>
								</button>
								<span class="badge" id="csvFileNameSpan"></span>
							  	<div class="alert alert-danger" id="formatError"></div>
								<!-- <progress value="0" max="100"></progress> -->
								<div class="progress progress-striped">
  									<div class="progress-bar" id="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
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
				<form action="${pageContext.request.contextPath}/admin/data/who/patient" method="post" id="patientUploadForm" enctype="multipart/form-data">
				<div class="box span12">
					<div class="box-header well">
							<h2>
								<i class="icon-upload"></i> Patient Data Upload
							</h2>
						</div>
						<div class="box-content">
							<p>Please use the File Uploader below to upload the desired Patient data in JSON format
								from your system</p>
							<p>
								<span class="btn btn-success fileinput-button">
									<i class="icon-plus-sign"></i>
									<span>Add File</span>
									<input id="patientFile" name="patientFile" type="file">
								</span>
								<button class="btn btn-primary" type="submit" id="uploadBtn">
									<i class="icon-upload"></i>
									<span>Upload</span>
								</button>
								<span class="badge" id="jsonFileNameSpan"></span>
							  	<div class="alert alert-danger" id="patientFormatError"></div>
								<!-- <progress value="0" max="100"></progress> -->
								<div class="progress progress-striped">
  									<div class="progress-bar" id="patientProgress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
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
				<div class="box span12">
					<div class="box-header well">
							<h2>
								<i class="icon-upload"></i> Run Amazon EMR Job
							</h2>
						</div>
						<div class="box-content">
							<p>Please use the button below to run the Elastic Map Reduce (EMR) job on Amazon cloud. Please note that this
							process takes around 10 minutes to complete. Please do not navigate to another page while the process is running.</p>
							<p>
								<button class="btn btn-primary ladda-button" data-style="expand-right" type="button" id="emr-job-btn">
									<i class="imgClass"></i>
									<span class="ladda-label" id="emr-span">Run EMR job</span>
								</button>
							  	<div class="alert alert-danger" id="patientFormatError"></div>
							</p>
						</div>
							<div class="clearfix"></div>
						</div>
				</div>
				<!-- End EMR job -->
				<div class="modal" id="emr-loader"></div>
			</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- notification plugin -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.noty.js"></script>

<!-- Button Spinner plugin  -->
<script src="${pageContext.request.contextPath}/resources/js/spin.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ladda.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		$('#formatError').hide();
		$('#patientFormatError').hide();
		$('#csvFileNameSpan').hide();
		$('#jsonFileNameSpan').hide();
	});
	
	function progressHandlingFunction(e){
    	if(e.lengthComputable){
        	$('progress').attr({value:e.loaded,max:e.total});
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
		if(!(/json/i.name(type))) {
			$('#patientFormatError').text('Please upload JSON files only !');
			$('#patientFormatError').show();
		}
	});
	
	$('#fileUploadForm').submit(function(){
	    var formData = new FormData($('#fileUploadForm')[0]);
	    $.ajax({
	        url: $('#fileUploadForm').attr('action'),  //Server script to process data
	        type: 'POST',
	        xhr: function() {  // Custom XMLHttpRequest
	            var myXhr = $.ajaxSettings.xhr();
	            if(myXhr.upload){ // Check if upload property exists
	                myXhr.upload.addEventListener('progress',progressHandlingFunction, false); // For handling the progress of the upload
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
	        	}
	        	else {
	        		var error = noty({
	        			text: response.error, 
	        			layout: 'top',
	        			type: 'error'
	        		});
	        	}
	        },
	        error: function(data, status, er){
	        	var postError = noty({
        			text: er, 
        			layout: 'topCenter',
        			type: 'error'
        		});
	        }
	        
	  	});
	    
	    return false;
	});
	
	$('#patientUploadForm').submit(function(){
	    var formData = new FormData($('#patientUploadForm')[0]);
	    $.ajax({
	        url: $('#patientUploadForm').attr('action'),  //Server script to process data
	        type: 'POST',
	        xhr: function() {  // Custom XMLHttpRequest
	            var myXhr = $.ajaxSettings.xhr();
	            if(myXhr.upload){ // Check if upload property exists
	                myXhr.upload.addEventListener('patientProgress',progressHandlingFunction, false); // For handling the progress of the upload
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
	        	}
	        	else {
	        		var error = noty({
	        			text: response.error, 
	        			layout: 'top',
	        			type: 'error'
	        		});
	        	}
	        },
	        error: function(data, status, er){
	        	var postError = noty({
        			text: er, 
        			layout: 'topCenter',
        			type: 'error'
        		});
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
			            	if(data.status.indexOf("complete") == -1) {
			            		l.start();
				                $('#emr-span').html(data.status);
			            	}
			            	else {
			            		l.stop();
				                $('#emr-span').html(data.status);
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
