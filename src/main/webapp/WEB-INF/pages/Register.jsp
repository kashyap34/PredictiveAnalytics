<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Register</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css" rel="stylesheet">
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
		<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>Welcome to Population Analytics</h2>
				</div><!--/span-->
			</div><!--/row-->
			
			<!-- <c:if test="${error != null}"> -->
			<!-- </c:if> -->
				<div class="alert alert-error" id="form_post_error" align="center">
					Error in registering your information. Please try again
				</div>
				<div class="alert alert-success" id="form_post_success" align="center">
					Success! You are now a registered user of Population Analytics. Please click <a href="${pageContext.request.contextPath}/login">here</a> to log in.
				</div>
			
			<div class="row-fluid" id="register"> 
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						Please provide all the below details.
					</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/register" method="post">
						<fieldset>
						<table width="auto" align="center" id="form-container">
							<tr>
								<td>
									<div class="input-prepend" title="Firstname" data-rel="tooltip">
									<input autofocus name="fname" id="fname" type="text" placeholder="First Name (e.g. John)" required="required" size="35"/>
									</div>
								</td>
								<td>
									<div class="input-prepend" title="Lastname" data-rel="tooltip">
									<input name="lname" id="lname" type="text" placeholder="Last Name (e.g. Doe)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-prepend" title="Password" data-rel="tooltip">
									<input name="pwd" id="pwd" type="password" placeholder="Password (8 to 20 characters)" required="required" size="35" maxlength="20"/>
									</div>
								</td>
								<td>
									<div class="input-prepend" title="ConfirmPassword" data-rel="tooltip">
									<input name="confpwd" id="confpwd" type="password" placeholder="Confirm Password" required="required" size="35" maxlength="20"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-prepend" title="Email" data-rel="tooltip">
									<input name="email" id="email" type="email" placeholder="Email (e.g. John@abc.com)" required="required" size="35"/>
									</div>
								</td>
								<td>
									<div class="input-prepend" title="Contact" data-rel="tooltip">
									<input name="contact" id="contact" type="tel" placeholder="Contact No (e.g. 0123456789)" required="required" size="35" maxlength="10"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-prepend" title="Street1" data-rel="tooltip">
									<input name="street1" id="street1" type="text" placeholder="Street Name (e.g. 1 N St.)" required="required" size="35"/>
									</div>
								</td>
								<td>
									<div class="input-prepend" title="Apt" data-rel="tooltip">
									<input name="apt" id="apt" type="text" placeholder="Apt/Suite (e.g. Apt. 1)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-prepend" title="ZipCode" data-rel="tooltip">
									<input name="zipcode" id="zipcode" type="text" placeholder="Zip Code (e.g. 12345)" required="required" size="35" maxlength="5"/>
									</div>
									<div class="text-error"></div>
								</td>
								<td>
									<div class="input-prepend" title="City" data-rel="tooltip">
									<input name="city" id="city" type="text" placeholder="City (e.g. San Jose)" required="required" size="35"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-prepend" title="State" data-rel="tooltip">
									<input name="state" id="state" type="text" placeholder="State (e.g. CA)" required="required" size="35"/>
									</div>
								</td>
							</tr>
						</table>	
							<div class="clearfix"></div>
							<p class="center span5">
							<button type="submit" class="btn btn-primary" id="button">Register</button>
							</p>
						</fieldset>
					</form>
				</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
		
	</div><!--/.fluid-container-->

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
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
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
                        		var errorText = response.error + ". Please click <a href=\"/PopulationAnalytics/login\">here </a> to Login";
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
		        confpwd: {
		            required: true,
		            minlength: 8,
		            equalTo: "#pwd"
		        }
		    },
		    messages: {
		        pwd: {
		            required: "Please provide a password",
		            minlength: "Your password must be at least 8 characters long"
		        },
		        confpwd: {
		            required: "Please provide a password",
		            minlength: "Your password must be at least 8 characters long",
		            equalTo: "Please enter the same password"
		        }
		    }
		});
</script>
	
		
</body>
</html>
