<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Profile</title>
	<!-- The styles -->
	<link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
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
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
		
</head>

<body>
	<!-- topbar starts -->
<div id="wrapper">

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/"><strong>Predictive Analytics</strong></a>
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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-dashboard fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a href="${pageContext.request.contextPath}/dashboard/">
                                	<i class="fa fa-globe fa-fw"> World</i>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/dashboard/patient">
                                <i class="fa fa-user fa-fw"> Patient</i>
                            </a>
                        </li>
                        </ul>
                 </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"> ${user.fname}</i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="${pageContext.request.contextPath}/profile"><i class="fa fa-user-md fa-fw"></i> Profile</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/admin/data/who"><i class="fa fa-gear fa-fw"></i> Admin</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
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
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> Dashboard<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard/">
                                    	<i class="fa fa-globe"> World</i>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard/patient">
										<i class="fa fa-user"> Patient</i>
									</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-archive fa-fw"></i> Data Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/data/who">
                                    	<i class="fa fa-cloud-upload"> Upload</i>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/data/who">
										<i class="fa fa-cloud-download"> Download</i>
									</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/data/who"><i class="fa fa-folder-open fa-fw"></i> Browse WHO Data Repo</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/data/who"><i class="fa fa-tasks fa-fw"></i> Run EMR Job</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-print fa-fw"></i> Generate Report<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard/">
                                    	<i class="fa fa-globe"> World</i>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard/patient">
                                    	<i class="fa fa-user"> Patient</i>
                                    </a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/contact"><i class="fa fa-envelope fa-fw"></i> Contact Us</a>
                        </li>
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
			
	<div id="page-wrapper">
				<!-- content starts -->


				<!-- <div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider"></span></li>
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div> -->
                <!-- /.col-lg-12 -->	
			<div class="row">
			<c:if test="${user != null}">
			<div class="col-lg-12">
                    <h1 class="page-header">${user.fname}'s Profile</h1>
            </div>
				<div  style="padding-left: 10%">
					<h4>Hi There! Please check your registered information. You can choose to update the registered information</h4>
				</div><!--/span-->
			</div><!--/row-->
			
				<div class="alert alert-error" id="form_post_error" align="center">
					Error in updating your information. Please try again
				</div>
				<div class="alert alert-success" id="form_post_success" align="center">
					Success! You have successfully updated your information.
				</div>
			
			<div class="row center" id="register" style="padding-left: 25%"> 
				<div class="well col-md-8 center">
					<div class="alert alert-info" align="center">
						Please provide all the below details.
					</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/profile/update" method="post">
						<fieldset>
						<table width="auto" align="center" id="form-container">
							<tr>
								<td>
									<div class="input-group" title="Firstname" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input autofocus name="fname" id="fname" type="text" value="${user.fname}" placeholder="First Name (e.g. John)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Lastname" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input name="lname" id="lname" type="text" value="${user.lname}" placeholder="Last Name (e.g. Doe)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Password" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-key"></i></span>
									<input name="pwd" id="pwd" type="password" value="${user.password}" placeholder="Password (8 to 20 characters)" required="required" size="35" maxlength="20" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Email" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
									<input name="email" id="email" type="email" value="${user.email}" placeholder="Email (e.g. John@abc.com)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Contact" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-mobile"></i></span>
									<input name="contact" id="contact" type="tel" value="${user.contact}" placeholder="Contact No (e.g. 0123456789)" required="required" size="35" maxlength="10" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Street1" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-road"></i></span>
									<input name="street1" id="street1" type="text" value="${user.street}" placeholder="Street Name (e.g. 1 N St.)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Apt" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-home"></i></span>
									<input name="apt" id="apt" type="text" value="${user.aptOrSuite}" placeholder="Apt/Suite (e.g. Apt. 1)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="ZipCode" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="zipcode" id="zipcode" type="text" value="${user.zip}" placeholder="Zip Code (e.g. 12345)" required="required" size="35" maxlength="5" class="form-control"/>
									</div>
									<div class="text-error"></div>
								</td>
								<td>
									<div class="input-group" title="City" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="city" id="city" type="text" value="${user.city}" placeholder="City (e.g. San Jose)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group" title="State" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="state" id="state" type="text" value="${user.state}" placeholder="State (e.g. CA)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
						</table>	
							<div class="clearfix"></div>
						</fieldset>
					</form>
					<div style="text-align: center;">
						<table align="center">
							<tr>
								<button type="button" class="btn btn-warning" id="editBtn" style="width: 150px"><i class="fa fa-edit"> Edit</i></button>
								&nbsp;&nbsp;&nbsp;
								<button type="submit" class="btn btn-success" id="button" style="width: 150px"><i class="fa fa-sign-in"> Update</i></button>
							</tr>
						</table>
					</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
			</c:if>
			<c:if test="${user == null}">
				<div class="alert alert-danger">There was a problem retrieving your details. Please try again</div>
			</c:if>
	</div><!--/.fluid-container-->
	</div>

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- Core Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>	
		
	<script type="text/javascript">//<![CDATA[
	$(function() {
		// IMPORTANT: Fill in your client key
		var clientKey = "js-sShLjxuMWIFdoIDmTTZ11pGxIOC9VQYoJf92NEOJmtXLbB75u76vwM2eBEnwvmUe";
		
		var cache = {};
		var container = $("#register");
		var errorDiv = container.find("div.text-error");

		$('#form_post_error').hide();
		$('#form_post_success').hide();
		
		/** Handle successful response */
		function handleResp(data)
		{
			// Check for error
			if (data.error_msg)
				errorDiv.text(data.error_msg);
			else if ("city" in data)
			{
				// Set city and state
				container.find("input[name='city']").val(data.city);
				container.find("input[name='state']").val(data.state);
			}
		}
		
		// Set up event handlers
		container.find("input[name='zipcode']").on("keyup change", function() {
			// Get zip code
			var zipcode = $(this).val().substring(0, 5);
			if (zipcode.length == 5 && /^[0-9]+$/.test(zipcode))
			{
				// Clear error
				errorDiv.empty();
				
				// Check cache
				if (zipcode in cache)
				{
					handleResp(cache[zipcode]);
				}
				else
				{
					// Build url
					var url = "http://zipcodedistanceapi.redline13.com/rest/"+clientKey+"/info.json/" + zipcode + "/radians";
					
					// Make AJAX request
					$.ajax({
						"url": url,
						"dataType": "json"
					}).done(function(data) {
						handleResp(data);
						
						// Store in cache
						cache[zipcode] = data;
					}).fail(function(data) {
						if (data.responseText && (json = $.parseJSON(data.responseText)))
						{
							// Store in cache
							cache[zipcode] = json;
							
							// Check for error
							if (json.error_msg)
								errorDiv.text(json.error_msg);
						}
						else
							errorDiv.text('Request failed.');
					});
				}
			}
		}).trigger("change");
	});
//]]></script>

<script type="text/javascript">
    
                $('form').submit(function () {
                    var fname = $('#fname').val();
                    var lname = $('#lname').val();
                    var password = $('#pwd').val();
                    var email = $('#email').val();
                    var contact = $('#contact').val();
                    var street = $('#street1').val();
                    var aptOrSuite = $('#apt').val();
                    var zip = $('#zipcode').val();
                    var city = $('#city').val();
                    var state = $('#state').val();

                    var json = {"fname" : fname, "lname" : lname, "password" : password, "email" : email, "contact" : contact, "street" : street, "aptOrSuite" : aptOrSuite, "zip" : zip, "city" : city, "state" : state};
                    
                    $.ajax({
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: JSON.stringify(json),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function(response) {
                        	if(response.error != null) {
                        		$('#register').toggle();
                        		var errorText = response.error; 
                        		$('#form_post_error').html(errorText);
                        		$('#form_post_error').toggle();  
                            }
                            else {
                            	$('#register').toggle();
                        		$('#form_post_success').toggle();
                            }
                                
                        },
                   		error: function(data, status, er) {
							//alert("Status: " + status + " er: " + er);
							console.log("Error: " + er);
							$('#register').toggle();
							$('#form_post_error').toggle();
                      	}
                    });
                    return false;
                });
 
</script>
<script type="text/javascript">
		$("form").validate({
		    rules: {
		        pwd: {
		            required: true,
		            minlength: 8
		        },
		    },
		    messages: {
		        pwd: {
		            required: "Please provide a password",
		            minlength: "Your password must be at least 8 characters long"
		        },
		    }
		});
</script>

<!-- This JavaScript corresponds to editing the user information -->
<script type="text/javascript">
	$(function(){
		$('#register :input').prop('readonly', true);
	});
	
	$('#editBtn').click(function(){
		$('input').prop('readonly', false);
		$('#email').prop('readonly', true);
	});
</script>	
		
</body>
</html>
