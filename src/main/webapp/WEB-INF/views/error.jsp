<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Drammy - ERROR</title>

  <!-- Bootstrap core CSS -->
	<style><%@include file="/resources/vendor/bootstrap/css/bootstrap.min.css"%></style>
	
	<!-- Custom fonts for this template -->
	<style><%@include file="/resources/vendor/fontawesome-free/css/all.min.css"%></style>
	<style><%@include file="/resources/vendor/simple-line-icons/css/simple-line-icons.css"%></style>
	<link
		href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
		rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template -->
	<style><%@include file="/resources/css/style.css"%></style>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>

  <!-- Navigation -->
	<nav class="navbar navbar-light bg-dark static-top">
	
		<div class="container">
			<a class="navbar-brand text-light" href="/Drammy">Drammy</a>
			<a class="btn text-white custom-btn" href="/Drammy/signIn">Sign In</a>
			<!-- <a class="btn text-white custom-btn" href="/Drammy/register">Create Account</a> -->
		</div>

	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-left masthead-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/spilled_whiskey.jpeg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">WHOOPSIE...</h1>
					<h5 class mb-5>Someone seems to have spilled on the server...Please go back to the previous page while we try to mop this up!</h5>
				</div>
				<div class="col-12 col-md-3">
					<a class="btn text-white custom-btn" href="/Drammy/">Back</a>
				</div>
			</div>
		</div>
	</header>
	
	  <!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
