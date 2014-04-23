<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
td {
	width: 400px;
	padding-left: 15px;
}

body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

.ui-menu .ui-menu-item a,.ui-menu .ui-menu-item a.ui-state-hover,.ui-menu .ui-menu-item a.ui-state-active
	{
	font-weight: normal;
	margin: -1px;
	text-align: left;
	font-size: 14px;
}

.ui-autocomplete-loading {
	background: white url("/images/ui-anim_basic_16x16.gif") right center
		no-repeat;
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

		<!-- content starts -->
		<div id="page-wrapper" >
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">World Dashboard</h1>
				</div>
			</div>
			<div id="content" class="row">
				<!-- <div>
						<ul class="breadcrumb">
							<li><a href="#">Home</a> <span class="divider">/</span></li>
							<li><a href="#">Dashboard</a></li>
						</ul>
					</div> -->
				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<svg height="100" width="100">
  							<circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/>
						</svg>
						<h4>People are suffering from diabetes worldwide.</h4>
						<span class="text-muted">Something else</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="${pageContext.request.contextPath}/resources/js/holder.js/200x200/auto/vine" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>People died from cancer in 2012</h4>
						<span class="text-muted">Something else</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="${pageContext.request.contextPath}/resources/js/holder.js/200x200/auto/sky" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>People died from malaria in 2012</h4>
						<span class="text-muted">Something else</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="${pageContext.request.contextPath}/resources/js/holder.js/200x200/auto/vine" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>People died from tuberculosis in 2012</h4>
						<span class="text-muted">Something else</span>
					</div>
				</div>
				<div class="col-md-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o"></i> Health Trends around the world
						</div>
						<div class="panel-body">
							<div id="pie-chart-container">
								<c:if test="${error != null}">
									<div class="alert alert-danger">${error}</div>
								</c:if>
							</div>
							<br />
							<div id="filter-data"
								style="display: inline-block; margin-left: 25%">
								<p>
									<strong>Filter data by Country </strong>
								</p>
								<input type="text" id="searchText"
									placeholder="Enter search country here"
									class="form-control typeahead" data-provide="typeahead"
									data-items="8" style="width: 300px; height: 35px" required />
								<button class="btn btn-success" id="btn-filter" value="filter"
									type="button">
									<i class="fa fa-filter"></i> Filter
								</button>
							</div>
							<div id="alert-error" class="alert alert-danger"></div>
						</div>
						<hr id="pie-bar-separator">
						<div id="bar-chart-container"></div>
						<br /> <br />
						<hr id="bar-line-separator">
						<div id="line-chart-container"></div>
					</div>
				</div>
				<!--/span-->
			</div>
			<!--/row-->

		</div>

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
		
		<script type="text/javascript" src="http://getbootstrap.com/assets/js/docs.min.js"></script>

		<!-- SB Admin Scripts - Include with every page -->
		<script
			src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>
		<!-- autocomplete library -->
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-typeahead.js"></script>
		<script src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>

		<!-- High Charts -->
		<script src="http://code.highcharts.com/highcharts.js"></script>
		<script src="http://code.highcharts.com/modules/exporting.js"></script>

		<script type="text/javascript">
	var disease;
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
	$(function () {
	$('#pie-bar-separator').hide();
	$('#bar-line-separator').hide();
	$('#alert-error').hide();
	$('#filter-data').hide();
	
		 $('#pie-chart-container').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false//,
	           /*  height: 400,
	            width: 500 */
	        },
	        title: {
	            text: 'Disease share around the world since 2006 <br />(Avg. number of cases)'
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
		            			var countries = obj.countryList;
		            			$('.typeahead').typeahead({
		            				hint: true,
		            				highlight: true,
		            				minLength: 1
		            			},
		            			{
		            				name: 'countries',
		            				displayKey: 'value',
		            				source: substringMatcher(countries)
		            			});
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
