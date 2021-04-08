<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Drammy - Profile</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous" />	
	<!-- Custom fonts for this template -->
	<style><%@include file="/resources/vendor/fontawesome-free/css/all.min.css"%></style>
	<style><%@include file="/resources/vendor/simple-line-icons/css/simple-line-icons.css"%></style>
	<link
		href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
		rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template -->
	<style><%@include file="/resources/css/style.css"%></style>


</head>

<body>

	<!-- Navigation -->
	<!-- Navigation -->
	<nav class="navbar navbar-light bg-dark static-top">
	
		<div class="container">
			<a class="navbar-brand text-light" href="/Drammy">Drammy</a>
			<a class="btn text-white custom-btn" href="/Drammy/logOut">Log Out</a> 
		</div>

	</nav>

	<!-- Masthead -->
	<header class="masthead text-white masthead-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/tasting_glass.jpeg');">
		<div class="overlay"></div>
	    	<div class="container">
	      	<!-- <h2 class="mb-5">What people are saying...</h2> -->
	      		<div class="row">
		        	<div class="col-lg-4">
		          		<div class="testimonial-item mx-auto mb-5 mb-lg-0">
		            		<img class="img-fluid rounded-circle mb-3" src="${whiskey.imageUrl}" data-holder-rendered="true" alt="">
		            		<h5>${whiskey.name}</h5>
		            		<p class="font-weight-light mb-0">${whiskey.description}</p>
		          		</div>
		        	</div>
		        	<div class="col-lg-6 tasting-notes-container">
		        		<h3>Tasting Notes</h3>
		        		<hr>
		        		<form action="saveNotes" method="POST">
			        		<div class="tasting-category top">
			        			<h5>Color</h5>
			        			<input type="hidden" name="color"> <p contenteditable="true">Color notes...</p>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>Nose</h5>
			        			<p contenteditable="true">Nose notes...</p>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>Palate</h5>
			        			<p contenteditable="true">Palate notes...</p>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>Finish</h5>
			        			<p contenteditable="true">Finish notes...</p>
			        		</div>
			        	</form>
		        	</div>
		        </div>
	    	</div>
	</header>
  
  <%-- 		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<img class="whiskey-profile-image" alt="${whiskey.name} thumbnail" src="${whiskey.imageUrl}" data-holder-rendered="true">
					<h1 class="mb-5">${whiskey.name}</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-left">
				</div>
			</div>
		</div> --%>


	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
