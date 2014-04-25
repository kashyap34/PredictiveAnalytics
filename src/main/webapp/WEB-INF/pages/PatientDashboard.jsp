<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard</title>
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
 .row {
	//margin-top: 40px;
	padding: 0 10px;
} 

.clickable {
	cursor: pointer;
}

.panel-heading div {
	margin-top: -18px;
	font-size: 15px;
}

.panel-heading div span {
	margin-left: 5px;
}

.panel-body {
	display: none;
}

.panel-primary {
	border-color: #428bca
}

.centerText td {
	text-align: center;
	vertical-align: middle;
}

.chart-gauge {
	width: 400px;
	margin: auto;
}

.chart-color1 {
	fill: #008000;
}

.chart-color2 {
	fill: #FFFF00;
}

.chart-color3 {
	fill: #FF0000;
}

.needle,.needle-center {
	fill: #464a4f;
}

.twitter-typeahead .tt-query,.twitter-typeahead .tt-hint {
	margin-bottom: 0;
}

.twitter-typeahead .tt-hint {
	display: block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	border: 1px solid transparent;
	border-radius: 4px;
}

.twitter-typeahead .hint-small {
	height: 30px;
	padding: 5px 10px;
	font-size: 12px;
	border-radius: 3px;
	line-height: 1.5;
}

.twitter-typeahead .hint-large {
	height: 45px;
	padding: 10px 16px;
	font-size: 18px;
	border-radius: 6px;
	line-height: 1.33;
}

.tt-dropdown-menu {
	min-width: 160px;
	margin-top: 2px;
	padding: 5px 0;
	background-color: #fff;
	border: 1px solid #ccc;
	border: 1px solid rgba(0, 0, 0, .2);
	*border-right-width: 2px;
	*border-bottom-width: 2px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	-webkit-background-clip: padding-box;
	-moz-background-clip: padding;
	background-clip: padding-box;
	height: 120px;
	overflow-y: auto;
}

.tt-suggestion {
	display: block;
	padding: 3px 20px;
}

.tt-suggestion.tt-is-under-cursor {
	color: #fff;
	background-color: #0081c2;
	background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc),
		to(#0077b3));
	background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
	background-image: -o-linear-gradient(top, #0088cc, #0077b3);
	background-image: linear-gradient(to bottom, #0088cc, #0077b3);
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc',
		endColorstr='#ff0077b3', GradientType=0)
}

.tt-suggestion.tt-is-under-cursor a {
	color: #fff;
}

.tt-suggestion p {
	margin: 0;
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
					data-toggle="dropdown" href="#"> <i class="fa fa-user">
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

		<!-- content starts -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Patient Dashboard</h1>
				</div>
				<div id="content" class="row">
					<!-- <div>
						<ul class="breadcrumb">
							<li><a href="#">Home</a> <span class="divider">/</span></li>
							<li><a href="#">Dashboard</a></li>
						</ul>
					</div> -->
					<!-- Patient data grid starts -->
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Patients</h3>
								<div class="pull-right">
									<span class="clickable filter" data-toggle="tooltip"
										title="Filter patients" data-container="body"> <i
										class="fa fa-filter"></i>
									</span>
								</div>
							</div>
							<div class="panel-body">
								<input type="text" style="height: 35px; width: 500px"
									id="patient-table-filter" data-action="filter"
									data-filters="#patient-table" placeholder="Filter Patients"
									class="form-control" />
							</div>
							<c:choose>
								<c:when test="${error != null}">
									<div class="alert alert-danger">${error}</div>
								</c:when>
								<c:otherwise>
									<div
										style="height: 300px; overflow-y: auto; text-align: center;">
										<table
											class="table table-bordered table-hover table-condensed centerText"
											id="patient-table">
											<thead>
												<tr class="info">
													<th style="display: none">Record #</th>
													<th>Name</th>
													<th>Age</th>
													<th>Gender</th>
													<th>Ethnicity</th>
													<th>Race</th>
													<th>Disease</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${patientList}" var="patient">
													<tr>
														<td style="display: none;">${patient.medical_record_no}</td>
														<td>${patient.name}</td>
														<td>${patient.age}</td>
														<td>${patient.gender}</td>
														<td>${patient.ethnicity}</td>
														<td>${patient.race}</td>
														<td style="width: 300px"><c:forEach
																items="${patient.disease}" var="diseaseList"
																varStatus="item">
														${diseaseList}
														<c:if test="${!item.last}">,</c:if>
															</c:forEach></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="error" class="alert alert-danger"></div>
					</div>
					<!-- Patient data grid ends -->
					<div class="row">
						<div class="col-md-12">
							<hr id="data-grid-column-chart-separator">
						</div>
					</div>
					<div id="column-chart-container" style="display: inline-block;"></div>
					<!-- <hr id="column-tag-cloud-separator"> -->
					<div style="display: inline-block;">
						<div id="tag-cloud-label"></div>
						<div id="tag-cloud-container"></div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<hr id="column-family-history-separator">
						</div>
					</div>

					<!-- <div id="family-history-container" class="form-group col-md-12">
						<h4>Enter family history conditions</h4> <br />
						<div id="family-history-group" style="padding-left: 10px" class="form-group">
							<div id="family-history-group-1" class="form-group">
								<input type="text" id="family-history-text-1" placeholder="Condition (For e.g. Diabetes)" data-provide="typeahead" data-items="8" style="height: 35px; width: 300px; display: inline-block;" class="typeahead form-control" required>
								<input type="text" id="start-age-1" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<input type="text" id="end-age-1" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<span class="fa fa-times" id="remove-group-1" style="margin-left: 10px"></span></td>
							</div>
							<div id="family-history-group-2" class="form-group">
								<input type="text" id="family-history-text-2" placeholder="Condition (For e.g. Diabetes)" data-provide="typeahead" data-items="8" style="height: 35px; width: 300px; display: inline-block;" class="typeahead form-control" required>
								<input type="text" id="start-age-2" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<input type="text" id="end-age-2" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<span class="fa fa-times" id="remove-group-2" style="margin-left: 10px"></span></td>
							</div>
							<div id="family-history-group-3" class="form-group">
								<input type="text" id="family-history-text-3" placeholder="Condition (For e.g. Diabetes)" data-provide="typeahead" data-items="8" style="height: 35px; width: 300px; display: inline-block;" class="typeahead form-control" required>
								<input type="text" id="start-age-3" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<input type="text" id="end-age-3" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<span class="fa fa-times" id="remove-group-3" style="margin-left: 10px"></span></td>
							</div>
							<div id="family-history-group-4" class="form-group">
								<input type="text" id="family-history-text-4" placeholder="Condition (For e.g. Diabetes)" data-provide="typeahead" data-items="8" style="height: 35px; width: 300px; display: inline-block;" class="typeahead form-control" required>
								<input type="text" id="start-age-4" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<input type="text" id="end-age-4" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<span class="fa fa-times" id="remove-group-4" style="margin-left: 10px"></span></td>
							</div>
							<div id="family-history-group-5" class="form-group">
								<input type="text" id="family-history-text-5" placeholder="Condition (For e.g. Diabetes)" data-provide="typeahead" data-items="8" style="height: 35px; width: 300px; display: inline-block;" class="typeahead form-control" required>
								<input type="text" id="start-age-5" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<input type="text" id="end-age-5" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>
								<span class="fa fa-times" id="remove-group-5" style="margin-left: 10px"></span></td>
							</div>
						</div>
						<br /><button class="btn btn-success" type="button"
							id="family-history-btn">
							<i class="fa fa-plus"></i> Add family history
						</button>
					</div> -->
					
					<div id="family-history-container" class="form-group col-md-12">
 					<h4>Enter family history conditions</h4>
 						<div id="family-history-group" class="form-group" style="padding-left: 10px">
 						</div>
 					<button class="btn btn-success" type="button" id="family-history-btn">
 						<i class="fa fa-plus"></i>
 						Add family history
 					</button>
  				</div>
										
					<div id="occupation-data-container">
									<h4>Please enter patient's occupation</h4>
								<input type="text"
									id="search-occupation" style="height: 35px; width: 500px"
									placeholder="For e.g. Engineer" class="form-control typeahead"
									data-provide="typeahead" data-items="8" />
						<!-- <button type="button" class="btn btn-success" id="update-btn">Update</button> -->
					</div>
					<br />
					<table style="width: auto">
						<tr>
							<button type="button" class="btn btn-success" id="update-btn">
								<i class="fa fa-save"></i> Save
							</button>
						</tr>
					</table>

					<div id="diabetes-questionnaire">
						<p>
						<h4><strong>Please check all the boxes that closely relates to the
							patient family's historical conditions</strong></h4>
						</p>
						<table class="table table-condensed">
							<tr>
								<td>Does anyone in the family have type 2 diabetes?</td>
								<td><input type="checkbox" id="q1"></td>
							</tr>
							<tr>
								<td>Has anyone in the family been told they might get
									diabetes?</td>
								<td><input type="checkbox" id="q2"></td>
							</tr>
							<tr>
								<td>Has anyone in the family been told they need to lower
									their weight or increase their physical activity to prevent
									type 2 diabetes?</td>
								<td><input type="checkbox" id="q3"></td>
							</tr>
							<tr>
								<td>Did your mother get diabetes when she was pregnant?
									[This is also known as gestational diabetes (GDM)].</td>
								<td><input type="checkbox" id="q4"></td>
							</tr>
						</table>
						<table style="width: auto">
							<tr>
								<button type="button" class="btn btn-success"
									id="generate-predictions">
									<i class="fa fa-bar-chart-o"></i> Predict Diabetes
								</button>
							</tr>
						</table>
					</div>

					<!-- </div>
						</div>
					</div> -->

					<!-- <div class="col-md-8">
						<div class="panel panel-default"
							id="diabetes-prediction-explanation-panel">
							<div class="panel-heading">
								<i class="fa fa-sitemap"></i> Diabetes Prediction Explanation
							</div>
							<div class="panel-body"> -->
					<div id="diabetes-prediction-gauge" class="chart-gauge"
						style="width: 300px; height: 150px"></div>

					<div id="diabetes-gauge-label" align="center"
						style="font-family: sans-serif; font-size: 12px; color: #3E576F"></div>
					<div id="diabetes-prediction-container"></div>
					<!-- </div>
						</div>
					</div> -->

					<div class="row"> 
						<div class="col-md-12" style="text-align: center;">
							<button class="btn btn-success" id="generate-report" type="button"><i class="fa fa-print"></i> Generate Report</button>
							<!-- <button class="btn btn-success" id="generate-all-report" type="button"><i class="fa fa-print"></i> Generate All Report</button> -->
						</div>
					</div>
				</div>
				<!--/row-->
			</div>

			<!-- external javascript
	================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->

			<%-- <!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.21.custom.min.js"></script> --%>

			<!-- Core Scripts - Include with every page -->
			<%-- <script
				src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script> --%>
				<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

			<!-- SB Admin Scripts - Include with every page -->
			<script
				src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>
			<!-- autocomplete library -->
			<script
				src="${pageContext.request.contextPath}/resources/js/bootstrap-typeahead_1.js"></script>
			<script
				src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>

			<!-- High Charts -->
			<script src="http://code.highcharts.com/highcharts.js"></script>
			<script src="http://code.highcharts.com/modules/exporting.js"></script>

			<!-- D3.js -->
			<script src="http://www.jasondavies.com/d3.min.js" charset="utf-8"></script>
			<script src="http://www.jasondavies.com/wordcloud/d3.layout.cloud.js"></script>

			<!-- Word Cloud -->
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/resources/js/wordcloud2.js"></script>

			<!-- Noty plugin -->
			<script
				src="${pageContext.request.contextPath}/resources/js/jquery.noty.js"></script>
				
			<!-- CanvG -->
			<script src="http://canvg.googlecode.com/svn/trunk/rgbcolor.js"></script> 
			<script src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script> 
		
			<!-- jsPDF -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.debug.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.plugin.addimage.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.plugin.standard_fonts_metrics.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.plugin.autoprint.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.plugin.from_html.js"></script>


<!-- Filter table results script -->
<script type="text/javascript">
	(function(){
	    'use strict';
		var $ = jQuery;
		$.fn.extend({
			filterTable: function(){
				return this.each(function(){
					$(this).on('keyup', function(e){
						$('.filterTable_no_results').remove();
						var $this = $(this), search = $this.val().toLowerCase(), target = $this.attr('data-filters'), $target = $(target), $rows = $target.find('tbody tr');
						if(search == '') {
							$rows.show(); 
						} else {
							$rows.each(function(){
								var $this = $(this);
								$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
							})
							if($target.find('tbody tr:visible').size() === 0) {
								var col_count = $target.find('tr').first().find('td').size();
								var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
								$target.find('tbody').append(no_results);
							}
						}
					});
				});
			}
		});
		$('[data-action="filter"]').filterTable();
	})(jQuery);

	$(function(){
		$('#error').hide();
		$('#family-history-container').hide();
		$('#occupation-data-container').hide();
		$('#update-btn').hide();
		$('#diabetes-questionnaire').hide();
		$('#generate-report').hide();
	    // attach table filter plugin to inputs
		$('[data-action="filter"]').filterTable();
		
		$('#content').on('click', '.panel-heading span.filter', function(e){
			var $this = $(this), 
					$panel = $this.parents('.panel');
			
			$panel.find('.panel-body').slideToggle();
			if($this.css('display') != 'none') {
				$panel.find('.panel-body input').focus();
			}
		});
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
			<!-- end filter results script -->

			<!-- Script to get the clicked row from the table and retrieve its data -->
<script type="text/javascript">
		var medical_record_no;
		var patientName;
		var familyHistoryGroupCount = 1;
		var diseaseList;
		var columnChart;
		var tagCloud;
		var diabetesPredictionGauge;
		var el;
		var tagList;
		var displayText;
		
		var substringMatcher = function(strs) {
			  return function findMatches(q, cb) {
			    var matches, substringRegex;
			 
			    // an array that will be populated with substring matches
			    matches = [];
			 
			    // regex used to determine if a string contains the substring `q`
			    substrRegex = new RegExp(q, 'i');
			 
			    // iterate through the pool of strings and for any string that
			    // contains the substring `q`, add it to the `matches` array
			    $.each(strs, function(i, str) {
			      if (substrRegex.test(str)) {
			        // the typeahead jQuery plugin expects suggestions to a
			        // JavaScript object, refer to typeahead docs for more info
			        matches.push({ value: str });
			      }
			    });
			 
			    cb(matches);
			  };
			};
		
		$('#patient-table tr').click(function(){
			medical_record_no = $(this).closest('tr').find('td').first().text();
			patientName = $(this).closest('tr').find('td').eq(1).text();
			$.get("${pageContext.request.contextPath}/dashboard/patient?medical_record_no=" + medical_record_no, function(data){
			$('#tag-cloud-container').empty();
			$('input:checkbox').removeAttr('checked');
			//$('#diabetes-questionnaire').hide();
			$('#diabetes-prediction-container').empty();
			$('#diabetes-prediction-gauge').empty();
			$('#diabetes-gauge-label').empty();
			//$('#family-history-container').hide();
			//$('#occupation-data-container').hide();
			
				var encounters = [];
				var obj = jQuery.parseJSON(data);
				var yearVsEncounterMap = obj.yearVsEncounterMap;
				var sinceYear = obj.sinceYear;
				var years = Object.keys(yearVsEncounterMap);
				tagList = obj.tagList;
				var familyHistory = obj.familyHistory;
				var jobTitle = obj.title;
				
				$.each(yearVsEncounterMap, function(key, value) {
					encounters.push(parseInt(value));
				});
				
				//alert(encounters);
				 columnChart  = new Highcharts.Chart({
			            chart: {
			                type: 'column',
			                width: 250,
			                height: 400,
			                spacingTop: 0,
			                renderTo: 'column-chart-container'
			            },
			            title: {
			                text: patientName + "'s number of encounters since " + sinceYear
			            },
			            xAxis: {
			                categories: years
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: 'Office visits'
			                }
			            },
			            tooltip: {
			                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                    '<td style="padding:0"><b>{point.y}</b></td></tr>',
			                footerFormat: '</table>',
			                shared: true,
			                useHTML: true
			            },
			            plotOptions: {
			                column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			            series: [{
			                name: '# of Encounters',
			                data: encounters
			            }]
			        });
				 
				 
				 
				 //$('#tagCloudLabel').html("Summary of " + patientName + "'s medical encounters");
				 
				 var fill = d3.scale.category20();

				 tagCloud =  d3.layout.cloud().size([700, 400])
				      .words(tagList.map(function(d) {
				        return {text: d, size: 20};
				      }))
				      .padding(1)
				      .rotate(function() { return ~~(Math.random() * 2) * 0; })
				      .font("Times New Roman")
				      .fontSize(function(d) { return d.size; })
				      .on("end", draw)
				      .start();
				//layout.stop();
				  
				function draw(words) {
				   d3.select("#tag-cloud-container").append("svg")
				        .attr("width", 700)
				        .attr("height", 400)
				        .attr("text-anchor", "middle")
				        .style("font-size", "16px")
				        .style("font-family", "sans-seriff")
				      .append("g")
				        .attr("transform", "translate(400,200)")
				      .selectAll("text")
				        .data(words)
				      .enter().append("text")
				        .style("font-size", function(d) { return d.size + "px"; })
				        .style("font-family", "Times New Roman")
				        .style("fill", function(d, i) { return fill(i); })
				        .attr("text-anchor", "middle")
				        .attr("transform", function(d) {
				          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
				        })
				        .text(function(d) { return d.text; });
				 
				  }
				   
				   d3.select('#tag-cloud-container svg')
				   .append("text")
				   .attr("x", 700/2)             
				   .attr("y", 20)
				   .attr("text-anchor", "middle")
				   .style("font-size", "20px")
				   .style("font-family", "Helvetica")
				   .style("text-decoration", "underline")
				   .text("Summary of " + patientName + "'s medical encounters");
				
			if(!familyHistory.length) {
				$('#family-history-container').show();
				//$('#update-btn').show();
			}
			else {
				$('#family-history-container').hide();
				//$('#update-btn').hide();
			}
			
			if(jobTitle == null || jobTitle.length == 0) {
				$.get("${pageContext.request.contextPath}/dashboard/patient/occupationsList", function(data){
        			var obj = jQuery.parseJSON(data);
        			var occupationsList = obj.occupationsList;
        			var autoComplete = $('#search-occupation').typeahead();
        			autoComplete.data('typeahead').source = occupationsList;
        			/* $('#search-occupation').typeahead({
        				hint: true,
        				highlight: true,
        				minLength: 1
        			},
        			{
        				name: 'occupations',
        				displayKey: 'value',
        				source: substringMatcher(occupationsList)
        			}); */
        			$('#occupation-data-container').show();
        			//$('#update-btn').show();
        		});
			}
			else {
				$('#occupation-data-container').hide();
				//$('#update-btn').hide();
			}
			
			if(!familyHistory.length || jobTitle == null || jobTitle.length == 0) {
				$('#update-btn').show();
			}
			else {
				$('#update-btn').hide();
			}
				 
			});
			
			$.get("${pageContext.request.contextPath}/dashboard/patient/diseaseList", function(data){
				var obj = jQuery.parseJSON(data);
				diseaseList = obj.diseaseList;
			}); 
			
			$('#diabetes-questionnaire').show();
			
		});
		
		$('.typeahead').typeahead({
			hint: true,
			highlight: true,
			minLength: 1
		},
		{
			name: 'diseases',
			displayKey: 'value',
			source: substringMatcher(diseaseList)
		});
		
		$('#update-btn').click(function(){
			var json;
			var familyHistory = [];
			for(i = 1; i < familyHistoryGroupCount; i++) {
					var familyCondition = {"disease": $('#family-history-text-'+ i).val(), 
											"startAge": parseInt($('#start-age-'+ i).val()),
											"endAge": parseInt($('#end-age-'+ i).val())};
					familyHistory.push(familyCondition);
			}
			var occupation = $('#search-occupation').val();
			if(familyHistory.length == 0) 
				json = {"title": occupation};
			else if(occupation.length == 0)
				json = {"familyHistory": familyHistory};
			else
				json = {"familyHistory": familyHistory, "title": occupation};
			
			$.ajax({
                url: '${pageContext.request.contextPath}/dashboard/patient/update?medical_record_no=' + medical_record_no,
                type: 'POST',
                data: JSON.stringify(json),
                contentType: 'application/json',
                dataType: 'json',
                success: function(response) {
                    //alert("Success");
                    if(response.success != null) {
                    	var success = noty({
    	        			text: response.success, 
    	        			layout: 'top',
    	        			type: 'success'
    	        		});
                    }
                    else
                    {
                    	var error = noty({
    	        			text: response.error, 
    	        			layout: 'top',
    	        			type: 'error'
    	        		});
                    }
                },
           		error: function(data, status, er) {
					//alert("Status: " + status + " er: " + er);
           			var postError = noty({
            			text: er, 
            			layout: 'topCenter',
            			type: 'error'
            		});
              	}
            });
		});
		

		/* $('#family-history-btn').click(function(){
			
			if(familyHistoryGroupCount > 10) {
				alert('Only 10 historical events allowed');
				return false;
			}
			
			$('#family-history-group-' + familyHistoryGroupCount).show();
			
			$('.typeahead').trigger('added');
			
			familyHistoryGroupCount ++;
			console.log('FamilyHistory count is: ' + familyHistoryGroupCount);
		}); */
		
		/* $('.typeahead').on('added', function(){
			console.log('FamilyHistory count is: ' + familyHistoryGroupCount);
			$('.typeahead').typeahead({
				hint: true,
				highlight: true,
				minLength: 1
			},
			{
				name: 'diseases',
				displayKey: 'value',
				source: substringMatcher(diseaseList)
			});
		}); */

		/* $('body').on('click', 'span[id*="remove-group-"]', function(){
			
			if(familyHistoryGroupCount == 1) {
				alert('No more data to delete');
				return false;
			}
			
			familyHistoryGroupCount--;
			var divId = this.id;
			alert(divId);
			var index = divId.lastIndexOf("-");
			var id = divId.substring(index+1);
			var currentDivIndex = parseInt(id);
			alert(currentDivIndex);
			
			$('#family-history-group-' + currentDivIndex).fadeOut("slow");
			$('#family-history-group-' + currentDivIndex).remove();
		}); */
		
		
		$('#family-history-btn').click(function(){
			 			
			 			/* if(familyHistoryGroupCount > 10) {
			 				alert('Only 10 historical events allowed');
			 				return false;
			 			} */
			 			
			 			$('#family-history-group').append(
			 					  '<div id="family-history-group-' + familyHistoryGroupCount + '" class="form-group">'
			 					+ '<input type="text" id="family-history-text-' + familyHistoryGroupCount + '" placeholder="Condition (For e.g. Diabetes)" style="height: 35px; width: 300px; display: inline-block;" data-provide="typeahead" data-items="8" class="form-control typeahead" required>'
			 					+ '<input type="text" id="start-age-' + familyHistoryGroupCount + '" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>'
			 					+ '<input type="text" id="end-age-' + familyHistoryGroupCount + '" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px; display: inline-block;" class="form-control" required>'
			 					+ '<span class="fa fa-times" id="remove-group-"' + familyHistoryGroupCount + 'style="margin-left: 10px; display: inline-block;"></span>'
			 					+ '</div>'
			 				);
			 			
			 			
			 			familyHistoryGroupCount ++;
			 			
			 		});
			 		
			 		$('body').on('DOMNodeInserted', 'div[id*="family-history-group"]', function(){
			 			var autoComplete = $(this).find('.typeahead').typeahead();
			 			autoComplete.data('typeahead').source = diseaseList;
			 		});
			 
			 		$('body').on('click', 'span[id*="remove-group-"]', function(){
			 			
			 			if(familyHistoryGroupCount == 1) {
			 				alert('No more data to delete');
			 				return false;
			 			}
			 			
			 			familyHistoryGroupCount--;
			 			
			 			$('#family-history-group-' + familyHistoryGroupCount).fadeOut("slow");
			 			$('#family-history-group-' + familyHistoryGroupCount).remove();
			 		});
				
		$('#generate-predictions').click(function(){
		 $('input:checkbox:checked').attr('value', 'off');
			    var vals = $('input:checkbox').map(
			        function(){
			            return this.id + "=" +$(this).val();
			        }).get().join('&');
			    
			   var queryParams = "medical_record_no=" + medical_record_no + "&" + vals;
			   
			   $('#diabetes-prediction-gauge').empty();
			   
			   $.get('${pageContext.request.contextPath}/dashboard/patient/diabetes/predict?' + queryParams, function(data) {
				  var obj = jQuery.parseJSON(data);
				  if(obj.error == null) {
					  var Needle, arc, arcEndRad, arcStartRad, barWidth, chartInset, degToRad, endPadRad, height, margin, needle, numSections, padRad, percToDeg, percToRad, percent, radius, sectionIndx, sectionPerc, startPadRad, svg, totalPercent, width, _i;
					  var predictionText = obj.diabetes_prediction;
					  
					  if(/Critical/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>Critical</h3>');
						  percent = .95;
					  }
					  else if(/Very High/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>Very High</h3>');
						  percent = .8;
					  }
					  else if(/High/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>High</h3>');
						  percent = .7;
					  }
					  else if(/Moderate/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>Moderate</h3>');
						  percent = .5;
					  }
					  else if(/Normal/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>Normal</h3>');
						  percent = .25;
					  }
					  else if(/Low/i.test(predictionText)) {
						  $('#diabetes-gauge-label').html('<h3>Low</h3>');
						  percent = .1;
					  }
					  else {
						  percent = 0;
					  }
					  //percent = .9;

					  barWidth = 40;

					  numSections = 3;

					  sectionPerc = 1 / numSections / 2;

					  padRad = 0.05;

					  chartInset = 10;

					  totalPercent = .75;

					  el = d3.select('#diabetes-prediction-gauge');

					  margin = {
					    top: 20,
					    right: 20,
					    bottom: 30,
					    left: 20
					  };

					  width = el[0][0].offsetWidth - margin.left - margin.right;

					  height = width;

					  radius = Math.min(width, height) / 2;

					  percToDeg = function(perc) {
					    return perc * 360;
					  };

					  percToRad = function(perc) {
					    return degToRad(percToDeg(perc));
					  };

					  degToRad = function(deg) {
					    return deg * Math.PI / 180;
					  };

					  svg = el.append('svg').attr('width', width + margin.left + margin.right).attr('height', height + margin.top + margin.bottom);

					  chart = svg.append('g').attr('transform', "translate(" + ((width + margin.left) / 2) + ", " + ((height + margin.top) / 2) + ")");

					  for (sectionIndx = _i = 1; 1 <= numSections ? _i <= numSections : _i >= numSections; sectionIndx = 1 <= numSections ? ++_i : --_i) {
					    arcStartRad = percToRad(totalPercent);
					    arcEndRad = arcStartRad + percToRad(sectionPerc);
					    totalPercent += sectionPerc;
					    startPadRad = sectionIndx === 0 ? 0 : padRad / 2;
					    endPadRad = sectionIndx === numSections ? 0 : padRad / 2;
					    arc = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth).startAngle(arcStartRad + startPadRad).endAngle(arcEndRad - endPadRad);
					    chart.append('path').attr('class', "arc chart-color" + sectionIndx).attr('d', arc);
					  }

					  Needle = (function() {
					    function Needle(len, radius) {
					      this.len = len;
					      this.radius = radius;
					    }

					    Needle.prototype.drawOn = function(el, perc) {
					      el.append('circle').attr('class', 'needle-center').attr('cx', 0).attr('cy', 0).attr('r', this.radius);
					      return el.append('path').attr('class', 'needle').attr('d', this.mkCmd(perc));
					    };

					    Needle.prototype.animateOn = function(el, perc) {
					      var self;
					      self = this;
					      return el.transition().delay(500).ease('elastic').duration(3000).selectAll('.needle').tween('progress', function() {
					        return function(percentOfPercent) {
					          var progress;
					          progress = percentOfPercent * perc;
					          return d3.select(this).attr('d', self.mkCmd(progress));
					        };
					      });
					    };

					    Needle.prototype.mkCmd = function(perc) {
					      var centerX, centerY, leftX, leftY, rightX, rightY, thetaRad, topX, topY;
					      thetaRad = percToRad(perc / 2);
					      centerX = 0;
					      centerY = 0;
					      topX = centerX - this.len * Math.cos(thetaRad);
					      topY = centerY - this.len * Math.sin(thetaRad);
					      leftX = centerX - this.radius * Math.cos(thetaRad - Math.PI / 2);
					      leftY = centerY - this.radius * Math.sin(thetaRad - Math.PI / 2);
					      rightX = centerX - this.radius * Math.cos(thetaRad + Math.PI / 2);
					      rightY = centerY - this.radius * Math.sin(thetaRad + Math.PI / 2);
					      return "M " + leftX + " " + leftY + " L " + topX + " " + topY + " L " + rightX + " " + rightY;
					    };

					    return Needle;

					  })();

					  needle = new Needle(90, 15);

					  needle.drawOn(chart, 0);

					  needle.animateOn(chart, percent);
					  
					  displayText = (obj.diabetes_prediction);//.replace(/\n/g, "<br />")).replace(/\t/, "&#9;");
					  //alert(displayText);
					  $('#diabetes-prediction-container').html(displayText);
				  }
				  else {
					  $('#diabetes-prediction-container').html('<div class="alert alert-danger">' + obj.error + '</div>');
				  }
			   });
			   
			   $('#diabetes-prediction-explanation-panel').show();
			   $('#generate-report').show();
		});
		
		$('#generate-report').click(function(){
			var labelX = 30, labelY = 10;
			var graphX = 10, graphY = 20;
			var graphWidth = 80, graphHeight = 80;
			var doc = new jsPDF();
			
			var columnChartCanvas = document.createElement('canvas');
			columnChartCanvas.setAttribute('width', 600);
			columnChartCanvas.setAttribute('height', 300);
			
			if(columnChartCanvas.getContext && columnChartCanvas.getContext('2d')){ 
				console.log('generating canvas');
				canvg(columnChartCanvas, columnChart.getSVG());
				var columnImage = columnChartCanvas.toDataURL("image/jpeg");
				
				doc.setFontSize(20);
				doc.text(labelX, labelY, "Summary of " + patientName + "'s medical conditions");
				doc.addImage(columnImage, 'JPEG', graphX, graphY, graphWidth, graphHeight);
				
				graphX = graphX + graphWidth + 15;
				graphY = graphY + 10;
				doc.setFontSize(15);
				doc.text(graphX, graphY, "" + patientName + "'s current conditions:");
				graphY = graphY + 8;
				doc.setFontSize(12);
				$.each(tagList, function(index, value){
					doc.text(graphX, graphY, "\t- " + value);
					graphY = graphY + 5;
				});
				
				graphX = 10;
				graphY = 20 + graphHeight + 15;
				doc.setFontSize(15);
				doc.text(graphX, graphY, "Diabetes prediction for "+ patientName);
				graphY = graphY + 8;
				doc.setFontSize(12);
				formattedText = displayText.replace(/<h3>/g,"").replace(/<\/h3>/g,"").replace(/<h4>/g,"").replace(/<\/h4>/g,"");
				formattedText = formattedText.split('.');
				
				for(var i = 0; i < formattedText.length; i++) {
					doc.text(graphX, graphY, formattedText[i]);
					graphY = graphY + 5;
				}
				
				doc.autoPrint();
				doc.output('dataurlnewwindow');
			}	
			else {
				console.log('cannot create canvas');
			}
		});
		
	</script>
</body>
</html>
