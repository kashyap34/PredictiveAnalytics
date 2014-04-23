<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Register</title>
	<!-- The styles -->
	<link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
	<style type="text/css">
	input {
		display: block;
		//margin-top: 15px;
		//padding-left: 15px;
	}
	td {
		width: 400px;
		padding-left: 15px;
	}
	.center {
		margin: 0 auto;
	}
	body {
 		padding-bottom: 40px;
 	  }
	.ui-autocomplete-loading { background: white url("/images/ui-anim_basic_16x16.gif") right center no-repeat; }
	</style>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
		
</head>

<body>
		<div class="container">
		<div class="row">
		
			<div class="row">
				<div class="span10 center login-header">
					<h2><center>Welcome to Population Analytics</center></h2>
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
			
			<div class="row center" id="register" style="padding-left: 25%"> 
				<div class="well col-md-8 center">
					<div class="alert alert-info" align="center">
						Please provide all the below details.
					</div>
					<form action="${pageContext.request.contextPath}/register" method="post">
						<fieldset>
						<table width="auto" align="center" id="form-container">
							<tr>
								<td>
									<div class="input-group" title="Firstname" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input autofocus name="fname" id="fname" type="text" placeholder="First Name (e.g. John)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Lastname" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input name="lname" id="lname" type="text" placeholder="Last Name (e.g. Doe)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Password" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-key"></i></span>
									<input name="pwd" id="pwd" type="password" placeholder="Password (8 to 20 characters)" required="required" size="35" maxlength="20" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="ConfirmPassword" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-key"></i></span>
									<input name="confpwd" id="confpwd" type="password" placeholder="Confirm Password" required="required" size="35" maxlength="20" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Email" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
									<input name="email" id="email" type="email" placeholder="Email (e.g. John@abc.com)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Contact" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-mobile"></i></span>
									<input name="contact" id="contact" type="tel" placeholder="Contact No (e.g. 0123456789)" data-format="+1 (ddd) ddd-dddd" required="required" size="35" maxlength="10" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="Street1" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-road"></i></span>
									<input name="street1" id="street1" type="text" placeholder="Street Name (e.g. 1 N St.)" required="required" size="35" class="form-control"/>
									</div>
								</td>
								<td>
									<div class="input-group" title="Apt" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-home"></i></span>
									<input name="apt" id="apt" type="text" placeholder="Apt/Suite (e.g. Apt. 1)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<div class="clearfix"></div>
							
							<tr>
								<td>
									<div class="input-group" title="ZipCode" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="zipcode" id="zipcode" type="text" placeholder="Zip Code (e.g. 12345)" required="required" size="35" maxlength="5" class="form-control"/>
									</div>
									<div class="text-error"></div>
								</td>
								<td>
									<div class="input-group" title="City" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="city" id="city" type="text" placeholder="City (e.g. San Jose)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group" title="State" data-rel="tooltip" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<input name="state" id="state" type="text" placeholder="State (e.g. CA)" required="required" size="35" class="form-control"/>
									</div>
								</td>
							</tr>
						</table>	
						<div class="clearfix"></div>
						</fieldset>
					<div style="text-align: center;">
							
						<button type="submit" class="btn btn-success" id="button" style="width: 200px"><i class="fa fa-sign-in"> Register</i></button>
					</div>
					</form>
				</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- Core Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>	<script src="${pageContext.request.contextPath}/resources/js/charisma.js"></script>
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
