<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--  Use this to set the icon in menu bar
    <link rel="shortcut icon" href="http://getbootstrap.com/assets/ico/favicon.ico">
    -->

    <title>Welcome to Population Analytics</title>

    <link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
	<style type="text/css">
	body {
 	    background-color: #ffffff;
    	padding-top: 100px;
	}
	</style>
    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/justified-nav/justified-nav.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <div class="masthead">
        <h3 class="text-muted"><i class="fa fa-users"></i> <i class="fa fa-bar-chart-o"></i> Population Analytics</h3>
        <ul class="nav nav-justified">
          <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
          <li><a href="${pageContext.request.contextPath}/help">Help</a></li>
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
        </ul>
      </div>

      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>Welcome to Population Analytics !</h1>
        <p class="lead">This web application is helpful to doctors for performing analytics on their patient's health records.</p>
        <p><a class="btn btn-lg btn-success" href="${pageContext.request.contextPath}/register" role="button">Get started today <i class="fa fa-arrow-circle-o-right"></i></a></p>
        <p class="lead"><strong>It's free!</strong></p>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-4">
          <h2>How it helps ?</h2>
          <p>We provide prediction analytics for doctors. This helps them to alert their patients when they visit them. </p>
        </div>
        <div class="col-lg-4">
          <h2>Features provided:</h2>
		  <ul>
		  	<li>Predictive Analytics</li>
		  	<li>Interactive Dashboard</li>
		  	<li>Big Data Processing</li>
		  	<li>Cloud based access</li>
		  </ul>
       </div>
        <div class="col-lg-4">
          <h2>Instant Poll</h2>
          <div id="poll-container">
		  <form id='poll' action="${pageContext.request.contextPath}/home/poll" method="post" accept-charset="utf-8">
	          <p>What do your patients have in common?</p>
	   		  <input type="radio" name="poll" value="opt0" id="opt0" /><label for='opt0'>&nbsp;Diabetes</label><br />
			  <input type="radio" name="poll" value="opt1" id="opt1" /><label for='opt1'>&nbsp;Obesity</label><br />
			  <input type="radio" name="poll" value="opt2" id="opt2" /><label for='opt2'>&nbsp;Flu</label><br />
			  <input type="radio" name="poll" value="opt3" id="opt3" /><label for='opt3'>&nbsp;Heart Problems</label><br />
			  <input type="radio" name="poll" value="opt4" id="opt4" /><label for='opt4'>&nbsp;Malaria</label><br />
			  <input type="radio" name="poll" value="opt5" id="opt5" /><label for='opt5'>&nbsp;Smoking Habits</label><br /><br />
			  <input type="submit" value="Vote" class="btn btn-primary"/></p>
		</form>	
		</div>
		<div id="poll-results-container"></div>
		<div id="poll-error" class="alert alert-danger"></div>
        </div>
      </div>

      <!-- Site footer -->
      <div class="footer">
        <p>&copy; Company 2014</p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- Core Scripts - Include with every page -->
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<!-- High Charts -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	
	<script type="text/javascript">
		$(function(){
			//$('#poll-results-container').hide();
			$('#poll-error').hide();
		});
		
		$('form').submit(function () {
			var value = $('input[type="radio"]:checked').val();

			$.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: {"value" : value},
                dataType: 'json',
                success: function(response) {
                    if(response.error == null) {
                    	$(function () {
                            $('#poll-results-container').highcharts({
                                chart: {
                                    type: 'bar'
                                },
                                title: {
                                    text: 'Results'
                                },
                                xAxis: {
                                    categories: ['Diabetes', 'Obesity', 'Flu', 'Heart Problems', 'Malaria', 'Smoking Habits']
                                },
                                yAxis: {
                                    min: 0,
                                    title: {
                                        text: 'Total number of votes'
                                    }
                                },
                                legend: {
                                    backgroundColor: '#FFFFFF',
                                    reversed: true
                                },
                                plotOptions: {
                                    series: {
                                        stacking: 'normal'
                                    }
                                },
                                    series: [{
                                    name: '# of votes',
                                    data: [response.Diabetes, response.Obesity, response.Flu, response.Heart_Problems, response.Malaria, response.Smoking_Habits]
                                }]
                            });
                        });
                    	
                    	$('#poll-container').hide();
                    }
                    else
                    {
                    	$('#poll-error').text(response.error);
						$('#poll-error').show();
                    }
                },
           		error: function(data, status, er) {
					//alert("Status: " + status + " er: " + er);
					console.log("Error: " + er);
					$('#poll-error').text(er).show();
              	}
            });
            return false;
        });
	</script>
  </body>
</html>
