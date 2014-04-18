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
		input {
		display: block;
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

		.needle,
		.needle-center {
  			fill: #464a4f;
		}
	</style>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap-classic.css" rel="stylesheet">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.11/themes/flick/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
	<%-- <link href="${pageContext.request.contextPath}/resources/css/charisma-app.css" rel="stylesheet"> --%>
	<%-- <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.8.21.custom.css" rel="stylesheet"> --%>
	<%-- <link href='${pageContext.request.contextPath}/resources/css/chosen.css' rel='stylesheet'> --%>
	<%-- <link href='${pageContext.request.contextPath}/resources/css/uniform.default.css' rel='stylesheet'> --%>
	

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
									<span class="clickable filter" data-container="body">
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
							<div style="height: 300 px; overflow-y: auto; text-align: center;">
								<table class="table table-bordered table-hover table-condensed centerText" id="patient-table">
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
							</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div> <!-- Patient data grid ends -->
				<div id="error" class="alert alert-danger"></div>
				<hr id="data-grid-column-chart-separator">
				
				<div id="column-chart-container"></div>
				<hr id="column-tag-cloud-separator">
			
				<br/>
								
				<strong><p id="tagCloudLabel" align="center" style="font-family: inherit; font-size-adjust: inherit"></p></strong>
				<div id="tag-cloud-container" class="span6"></div>
				<hr id="column-family-history-separator">
				
				<div id="family-history-container" class="control-group">
					<h4>Enter family history conditions</h4><br/>
						<div id="family-history-group" class="control-group" style="padding-left: 10px">
						</div>
					<button class="btn btn-success" type="button" id="family-history-btn">
						<i class="icon-plus-sign"></i>
						Add family history
					</button>
				</div>
				
				<div id="occupation-data-container">
					<table style="width: auto">
					<tr>
						<td>
							<h4>Please enter patient's occupation</h4><br/>
						</td>
						<td style="padding-left: 10px">
							<input type="text" id="search-occupation" style="height: 35px; width: 500px" placeholder="For e.g. Engineer" class="span6 typeahead" data-provide="typeahead"
								data-items="8"/>
						</td>
					</tr>
					</table> 
				</div>
				<table style="width: auto">
					<tr>
						<button type="button" class="btn btn-success" id="update-btn">Update</button>
					</tr>
				</table>
				
				<div id="diabetes-questionnaire">
					<p><h4>Please check all the boxes that closely relates to the patient family's historical conditions</h4></p>
					<table class="table table-condensed">
						<tr>
							<td>
								Does anyone in the family have type 2 diabetes?
							</td>
							<td>
								<input type="checkbox" id="q1"> 
							</td>
						</tr>
						<tr>
							<td>
								Has anyone in the family been told they might get diabetes?
							</td>
							<td>
								<input type="checkbox" id="q2"> 
							</td>
						</tr>
						<tr>
							<td>
								Has anyone in the family been told they need to lower their weight or increase their physical activity to prevent type 2 diabetes?
							</td>
							<td>
								<input type="checkbox" id="q3"> 
							</td>
						</tr>
						<tr>
							<td>
								Did your mother get diabetes when she was pregnant? [This is also known as gestational diabetes (GDM)].
							</td>
							<td>
								<input type="checkbox" id="q4"> 
							</td>
						</tr>
					</table>
				<table style="width: auto">
					<tr>
						<button type="button" class="btn btn-success" id="generate-predictions">
							<i class="fa fa-bar-chart-o"> Predict Diabetes</i>
						</button>
					</tr>
				</table>
				</div>
				
				<div id="diabetes-prediction-container"></div>
				
				<div id="diabetes-prediction-gauge" class="chart-gauge"></div>
				
				<strong><div id="diabetes-gauge-label" align="center" style="font-family: inherit; font-size-adjust: inherit"></div></strong>
			
				</div><!--/row-->
	</div>

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<%-- <!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.21.custom.min.js"></script> --%>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<!-- <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script> -->
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
	
	<!-- D3.js -->
	<script src="http://www.jasondavies.com/d3.min.js" charset="utf-8"></script>
	<script src="http://www.jasondavies.com/wordcloud/d3.layout.cloud.js"></script>
	
	<!-- Word Cloud -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/wordcloud2.js"></script>
	
	<!-- Noty plugin -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.noty.js"></script>
	
	
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
		var familyHistoryGroupCount = 1;
		var diseaseList;
		
		$('#patient-table tr').click(function(){
			medical_record_no = $(this).closest('tr').find('td').first().text();
			patientName = $(this).closest('tr').find('td').eq(1).text();
			
			$.get("${pageContext.request.contextPath}/dashboard/patient?medical_record_no=" + medical_record_no, function(data){
			$('#tag-cloud-container').empty();
			$('input:checkbox').removeAttr('checked');
			//$('#diabetes-questionnaire').hide();
			$('#diabetes-prediction-container').empty();
			$('#diabetes-prediction-gauge').empty();
			//$('#family-history-container').hide();
			//$('#occupation-data-container').hide();
			
				var encounters = [];
				var obj = jQuery.parseJSON(data);
				var yearVsEncounterMap = obj.yearVsEncounterMap;
				var sinceYear = obj.sinceYear;
				var years = Object.keys(yearVsEncounterMap);
				var tagList = obj.tagList;
				var familyHistory = obj.familyHistory;
				var jobTitle = obj.title;
				
				$.each(yearVsEncounterMap, function(key, value) {
					encounters.push(parseInt(value));
				});
				
				//alert(encounters);
				
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
				 
				 $('#tagCloudLabel').html("<h3>Summary of " + patientName + "'s medical encounters</h3>");
				 
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
				        .attr("height", 400)
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
				 
			});
			
			$.get("${pageContext.request.contextPath}/dashboard/patient/diseaseList", function(data){
				var obj = jQuery.parseJSON(data);
				diseaseList = obj.diseaseList;
			}); 
			
			$('#diabetes-questionnaire').show();
			
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
		

		$('#family-history-btn').click(function(){
			
			/* if(familyHistoryGroupCount > 10) {
				alert('Only 10 historical events allowed');
				return false;
			} */
			
			$('#family-history-group').append(
					  '<div id="family-history-group-' + familyHistoryGroupCount + '" class="control-group">'
					+ '<input type="text" id="family-history-text-' + familyHistoryGroupCount + '" placeholder="Condition (For e.g. Diabetes)" style="height: 35px; width: 300px;" data-provide="typeahead" data-items="8" class="typeahead" required>'
					+ '<input type="text" id="start-age-' + familyHistoryGroupCount + '" placeholder="Start Age (For e.g. 30)" style="height: 35px; width: auto; margin-left: 10px" required>'
					+ '<input type="text" id="end-age-' + familyHistoryGroupCount + '" placeholder="End Age (For e.g. 50)" style="height: 35px; width: auto; margin-left: 10px" required>'
					+ '<span class="icon-remove" id="remove-group-"' + familyHistoryGroupCount + 'style="margin-left: 10px"></span>'
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
					  var Needle, arc, arcEndRad, arcStartRad, barWidth, chart, chartInset, degToRad, el, endPadRad, height, margin, needle, numSections, padRad, percToDeg, percToRad, percent, radius, sectionIndx, sectionPerc, startPadRad, svg, totalPercent, width, _i;
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
					  
					  var displayText = (obj.diabetes_prediction.replace("\n", "<br />")).replace("\t", "&#9;");
					  $('#diabetes-prediction-container').html(displayText);
				  }
				  else {
					  $('#diabetes-prediction-container').html('<div class="alert alert-danger">' + obj.error + '</div>');
				  }
			   });
		});
		
	</script>
		
</body>
</html>
