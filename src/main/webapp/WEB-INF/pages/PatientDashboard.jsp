<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Dashboard</title>
	<!-- The styles -->
	<%-- <link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap-cerulean.css" rel="stylesheet"> --%>
	<style type="text/css">
		.row{
		    margin-top:40px;
		    padding: 0 10px;
		}
		.clickable{
		    cursor: pointer;   
		}

		.panel-heading div {
			margin-top: -18px;
			font-size: 15px;
		}
		.panel-heading div span{
			margin-left:5px;
		}
		.panel-body{
			display: none;
		}
		.panel-primary{
		border-color:#428bca
		}
	</style>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap-classic.css" rel="stylesheet">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.11/themes/flick/jquery-ui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/charisma-app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='${pageContext.request.contextPath}/resources/css/chosen.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/uniform.default.css' rel='stylesheet'>
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
		
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
						<li><a href="#">Profile</a></li>
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
						<li><a class="ajax-link" href="${pageContext.request.contextPath}/dashboard"><i
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
				<!-- Patient data grid starts -->
				<div class="span11">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Patients</h3>
								<div class="pull-right">
									<span class="clickable filter" data-toggle="tooltip" title="Filter patients" data-container="body">
										<i class="icon-filter"></i>
									</span>
								</div>
						</div>
						<div class="panel-body">
							<input type="text" style="height: 35px; width: 500px" id="patient-table-filter" data-action="filter" data-filters="#patient-table" placeholder="Filter Patients" />
						</div>
						<c:choose>
							<c:when test="${error != null}">
								<div class="alert alert-danger">
									${error}
								</div>
							</c:when>
							<c:otherwise>
								<table class="table table-bordered table-hover table-condensed" id="patient-table">
									<thead>
										<tr class="info">
											<th>Record #</th>
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
												<td>${patient.medical_record_no}</td>
												<td>${patient.name}</td>
												<td>${patient.age}</td>
												<td>${patient.gender}</td>
												<td>${patient.ethnicity}</td>
												<td>${patient.race}</td>
												<td style="width: 300px">
													<c:forEach items="${patient.disease}" var="diseaseList" varStatus="item">
														${diseaseList}
														<c:if test="${!item.last}">,</c:if>
													</c:forEach>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</div> <!-- Patient data grid ends -->
				<div id="error" class="alert alert-danger"></div>
				<hr id="data-grid-column-chart-separator">
				<div id="column-chart-container"></div>
				<hr id="column-tag-cloud-separator" width="auto">
				<strong><p id="tagCloudLabel" align="center" style="font-family: inherit; font-size-adjust: inherit"></p></strong>
				<div id="tag-cloud-container"></div>
			</div><!--/row-->
				
	</div>

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<%-- <!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.21.custom.min.js"></script> --%>
	
	<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	
	<!-- High Charts -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	
	<!-- D3.js -->
	<script src="http://www.jasondavies.com/d3.min.js" charset="utf-8"></script>
	<script src="http://www.jasondavies.com/wordcloud/d3.layout.cloud.js"></script>
	
	<!-- Wordl Cloud -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/wordcloud2.js"></script>
	
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
	</script> <!-- end filter results script -->
	
	<!-- Script to get the clicked row from the table and retrieve its data -->
	<script type="text/javascript">
		var medical_record_no;
		var patientName;
		
		$('#patient-table tr').click(function(){
			medical_record_no = $(this).closest('tr').find('td').first().text();
			patientName = $(this).closest('tr').find('td').eq(1).text();
			
			$.get("${pageContext.request.contextPath}/dashboard/patient?medical_record_no=" + medical_record_no, function(data){
			$('#tag-cloud-container').empty();
				var encounters = [];
				var obj = jQuery.parseJSON(data);
				var yearVsEncounterMap = obj.yearVsEncounterMap;
				var sinceYear = obj.sinceYear;
				var years = Object.keys(yearVsEncounterMap);
				var tagList = obj.tagList;
				
				$.each(yearVsEncounterMap, function(key, value) {
					encounters.push(parseInt(value));
				});
				
				alert(encounters);
				
				 $('#column-chart-container').highcharts({
			            chart: {
			                type: 'column'
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
				 
				 $('#tagCloudLabel').html("Summary of " + patientName + "'s medical encounters");
				 
				 var fill = d3.scale.category20();

				 var layout =  d3.layout.cloud().size([960, 600])
				      .words(tagList.map(function(d) {
				        return {text: d, size: 25};
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
				        .attr("width", 1000)
				        .attr("height", 600)
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
				 
			});
		});
		
		
	</script>
		
</body>
</html>
