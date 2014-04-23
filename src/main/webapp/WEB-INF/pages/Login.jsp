<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<!-- The styles -->
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
		
</head>

<body>
		<div class="container">
		<div class="row">
		
			<div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center;"><strong>Please Sign In</strong></h3>
                    </div>
					<div class="panel-body">
						<div class="alert alert-error" id="alert-error">Login Failed
							! Please check your email and password and try again.
						</div>
						<form role="form" action="login" method="post">
							<fieldset>
								<div class="input-group" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-envelope"></i></span><input
										autofocus class="form-control" name="email" id="email"
										type="email" placeholder="Email" required />
								</div>
								<div class="clearfix"></div>

								<div class="input-group" style="margin-bottom: 15px">
									<span class="input-group-addon"><i class="fa fa-key"></i></span><input
										class="form-control" name="password" id="password"
										type="password" placeholder="Password" required />
								</div>
								<div class="clearfix"></div>

								<div class="checkbox">
									<label class="remember" for="remember"><input
										type="checkbox" id="remember" />Remember me</label>
								</div>
								<div class="clearfix"></div>
								
								<p align="center"><button type="submit" class="btn btn-lg btn-success btn-block">Login</button></p>
							</fieldset>
						</form>
					</div>
					<!--/span-->
			</div><!--/row-->
		</div><!--/fluid-row-->
		</div>
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- Core Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>
	

<script type="text/javascript">

		$(function() {
			$('#alert-error').hide();
		});
    
                $('form').submit(function () {
                    var email = $('#email').val();
                    var password = $('#password').val();

                    var json = {"email" : email, "password" : password};
                    
                    $.ajax({
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: JSON.stringify(json),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function(response) {
                            //alert("Success");
                            if(response.fname != null) {
	                            window.location = "http://localhost:8080/PopulationAnalytics/admin/data/who";
                            }
                            else
                            {
                            	$('#alert-info').hide();
                            	$('#alert-error').text(response.error);
    							$('#alert-error').show();
                            }
                        },
                   		error: function(data, status, er) {
							//alert("Status: " + status + " er: " + er);
							console.log("Error: " + er);
							$('#alert-info').hide();
							$('#alert-error').show();
                      	}
                    });
                    return false;
                });
 
</script>
		
</body>
</html>
