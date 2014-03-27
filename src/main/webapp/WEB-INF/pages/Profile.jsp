<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Profile</title>
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
			<c:if test="${user != null}">
				<div class="span12 center login-header">
					<h2>Hi There! Please check your registered information. You can choose to update the registered information</h2>
				</div><!--/span-->
			</div><!--/row-->
			
				<div class="alert alert-error" id="form_post_error" align="center">
					Error in updating your information. Please try again
				</div>
				<div class="alert alert-success" id="form_post_success" align="center">
					Success! You have successfully updated your information.
				</div>
			
			<div class="row-fluid" id="register"> 
				<div class="well span12 center login-box">
					<div class="alert alert-info">
						Please provide all the below details.
					</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/profile/update" method="post">
						<fieldset>
						<table width="auto" align="center" id="form-container">
							<tr>
								<td><label>First Name</label></td>
								<td>
									<div class="input-prepend" title="Firstname" data-rel="tooltip">
									<input autofocus name="fname" id="fname" type="text" value="${user.fname}" placeholder="First Name (e.g. John)" required="required" size="35"/>
									</div>
								</td>
								<td><label>Last Name</label></td>
								<td>
									<div class="input-prepend" title="Lastname" data-rel="tooltip">
									<input name="lname" id="lname" type="text" value="${user.lname}" placeholder="Last Name (e.g. Doe)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td><label>Password</label></td>
								<td>
									<div class="input-prepend" title="Password" data-rel="tooltip">
									<input name="pwd" id="pwd" type="password" value="${user.password}" placeholder="Password (8 to 20 characters)" required="required" size="35" maxlength="20"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td><label>E-mail</label></td>
								<td>
									<div class="input-prepend" title="Email" data-rel="tooltip">
									<input name="email" id="email" type="email" value="${user.email}" placeholder="Email (e.g. John@abc.com)" required="required" size="35"/>
									</div>
								</td>
								<td><label>Contact</label></td>
								<td>
									<div class="input-prepend" title="Contact" data-rel="tooltip">
									<input name="contact" id="contact" type="tel" value="${user.contact}" placeholder="Contact No (e.g. 0123456789)" required="required" size="35" maxlength="10"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td><label>Street</label></td>
								<td>
									<div class="input-prepend" title="Street1" data-rel="tooltip">
									<input name="street1" id="street1" type="text" value="${user.street}" placeholder="Street Name (e.g. 1 N St.)" required="required" size="35"/>
									</div>
								</td>
								<td><label>Apt/Suite</label></td>
								<td>
									<div class="input-prepend" title="Apt" data-rel="tooltip">
									<input name="apt" id="apt" type="text" value="${user.aptOrSuite}" placeholder="Apt/Suite (e.g. Apt. 1)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td><label>Zipcode</label></td>
								<td>
									<div class="input-prepend" title="ZipCode" data-rel="tooltip">
									<input name="zipcode" id="zipcode" type="text" value="${user.zip}" placeholder="Zip Code (e.g. 12345)" required="required" size="35" maxlength="5"/>
									</div>
									<div class="text-error"></div>
								</td>
								<td><label>City</label></td>
								<td>
									<div class="input-prepend" title="City" data-rel="tooltip">
									<input name="city" id="city" type="text" value="${user.city}" placeholder="City (e.g. San Jose)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>State</label></td>
								<td>
									<div class="input-prepend" title="State" data-rel="tooltip">
									<input name="state" id="state" type="text" value="${user.state}" placeholder="State (e.g. CA)" required="required" size="35"/>
									</div>
								</td>
							</tr>
						</table>	
							<div class="clearfix"></div>
							<table align="center">
								<tr>	
									<td>
										<button type="button" class="btn btn-success" id="editBtn">Edit</button>
									</td>
									<td>
										<button type="submit" class="btn btn-primary" id="button">Update</button>
									</td>
								</tr>
							</table>
						</fieldset>
					</form>
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

	<!-- jQuery -->
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
	<script src="${pageContext.request.contextPath}/resources/js/charisma.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>
	
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
		$('input').prop('readonly', true);
	});
	
	$('#editBtn').click(function(){
		$('input').prop('readonly', false);
		$('#email').prop('readonly', true);
	});
</script>	
		
</body>
</html>
