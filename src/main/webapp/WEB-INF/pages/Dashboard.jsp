<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Dashboard</title>
	<!-- The styles -->
	<link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<style type="text/css">
	.ui-menu .ui-menu-item a,.ui-menu .ui-menu-item a.ui-state-hover, .ui-menu .ui-menu-item a.ui-state-active {
		font-weight: normal;
		margin: -1px;
		text-align:left;
		font-size:14px;
	}
	.ui-autocomplete-loading { background: white url("/images/ui-anim_basic_16x16.gif") right center no-repeat; }
	</style>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap-classic.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/charisma-app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='${pageContext.request.contextPath}/resources/css/fullcalendar.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='${pageContext.request.contextPath}/resources/css/chosen.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/uniform.default.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/colorbox.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/jquery.noty.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/noty_theme_default.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/elfinder.min.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/elfinder.theme.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/opa-icons.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/uploadify.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.4.custom.css' rel='stylesheet'>
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.11/themes/flick/jquery-ui.css" rel="stylesheet" type="text/css" />
	

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
				
				<div class="box span10">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list-alt"></i> Health Trends around the world</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div id="pie-chart-container">
							<c:if test="${error != null}">
								<div class="alert alert-danger">${error}</div>
							</c:if>
						</div>
						<div id="filter-data">
							<label for="searchText"><strong>Filter data by Country </strong></label>
							<input type="text" id="searchText" placeholder="Enter search country here" class="span6 typeahead" data-provide="typeahead"
								data-items="8"/>
							<button class="btn btn-primary" id="btn-filter" value="filter" type="button">Filter</button>
						</div>
						<div id="alert-error" class="alert alert-danger"></div>
						<hr id="pie-bar-separator">
						<div id="bar-chart-container"></div>
						<br/>
						<br/>
						<hr id="bar-line-separator">
						<div id="line-chart-container"></div>
					</div>
				</div><!--/span-->
			</div><!--/row-->
				
	</div>

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<%-- <!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-alert.js"></script>
	<!-- popover effect library -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-popover.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${pageContext.request.contextPath}/resources/js/charisma.js"></script> --%>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.core.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.position.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.min.js" type="text/javascript"></script>
	<!-- autocomplete library -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-typeahead.js"></script>
	<script src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>
	
	<!-- High Charts -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	
	<script type="text/javascript">
	var disease;
	$(function () {
	$('#pie-bar-separator').hide();
	$('#bar-line-separator').hide();
	$('#alert-error').hide();
	$('#filter-data').hide();
	
		 $('#pie-chart-container').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: 'Disease share in United States since 2006 (Avg. number of cases)'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    color: '#000000',
	                    connectorColor: '#000000',
	                    format: '<b>{point.name}</b>: {point.percentage:.1f}%'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Disease share',
	            data: [
	                <c:forEach items = "${avgCasesMap}" var = "avgCases">
	                ['${avgCases.key}', ${avgCases.value}],
	                </c:forEach>
	            ],
	            point: {
	            	events: {
		            	click: function(event) {
		            		disease = this.name;
		            		$.get("${pageContext.request.contextPath}/dashboard/country/" + disease, function(data){
		            			var obj = jQuery.parseJSON(data);
		            			/* $('#searchText').autocomplete({
		            				lookup: countries.countryList
		            			}) */
		            			var countries = obj.countryList;
		            			var autoComplete = $('#searchText').typeahead();
		            			autoComplete.data('typeahead').source = countries;
		            			$('#filter-data').show();
		            			
		            		});
	    	        	}
	            	}
	            }
	        }]
	    });
	});
	
	$('#btn-filter').click(function(){
		var country = $('#searchText').val();
		$.get("${pageContext.request.contextPath}/dashboard/country?disease=" + disease + "&country=" + country, function(data){
			var obj = jQuery.parseJSON(data);
			var cases = obj.cases;
			var predictions = obj.predictions;
			if(obj.error != null) {
				$('#alert-error').text(obj.error).show();
			}
			else {
				$('#pie-bar-separator').show();
				$('#bar-chart-container').highcharts({
		            chart: {
		                type: 'bar'
		            },
		            title: {
		                text: disease + ' - Number of reported cases'
		            },
		            subtitle: {
		                text: 'Source: WHO Data Repository'
		            },
		            xAxis: {
		                categories: [country],
		                title: {
		                    text: null
		                }
		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: 'Cases',
		                    align: 'low'
		                },
		                labels: {
		                    overflow: 'justify'
		                }
		            },
		            plotOptions: {
		                bar: {
		                    dataLabels: {
		                        enabled: true
		                    }
		                }
		            },
		            legend: {
		                layout: 'vertical',
		                align: 'right',
		                verticalAlign: 'top',
		                x: -40,
		                y: 100,
		                floating: true,
		                borderWidth: 1,
		                backgroundColor: '#FFFFFF',
		                shadow: true
		            },
		            credits: {
		                enabled: false
		            },
		            series: [{
		                name: 'Year 2006',
		                data: [cases[2006]]
		            }, {
		                name: 'Year 2007',
		                data: [cases[2007]]
		            }, {
		                name: 'Year 2008',
		                data: [cases[2008]]
		            }, {
		                name: 'Year 2009',
		                data: [cases[2009]]
		            }, {
		                name: 'Year 2010',
		                data: [cases[2010]]
		            }, {
		                name: 'Year 2011',
		                data: [cases[2011]]
		            }]
		        });
				
				$('#bar-line-separator').show();
				
				$('#line-chart-container').highcharts({
		            title: {
		                text: 'Estimated number of cases by 2018',
		                x: -20 //center
		            },
		            subtitle: {
		                text: 'Predictions based on WHO Data',
		                x: -20
		            },
		            xAxis: {
		                categories: [2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018],
		                title: {
		                	text: 'Year'
		                }
		            },
		            yAxis: {
		                title: {
		                    text: 'Number of cases'
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 1,
		                    color: '#808080'
		                }]
		            },
		            tooltip: {
		                pointFormat: '{series.name}: <b>{point.y:.0f}</b>'
		            },
		            legend: {
		                layout: 'vertical',
		                align: 'right',
		                verticalAlign: 'middle',
		                borderWidth: 0
		            },
		            series: [{
		                name: country,
		                data: predictions
		            }]
		        });
			}
		});
		
	});
	
</script>	
		
</body>
</html>
