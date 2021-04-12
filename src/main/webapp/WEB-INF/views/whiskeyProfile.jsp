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
	<nav class="navbar navbar-light bg-dark static-top">
	
		<div class="container d-flex">
			<a class="navbar-brand text-light mr-auto p-2" href="/Drammy">Drammy</a>
			<a class="btn text-white custom-btn p-2" href="/Drammy/userProfile">Profile</a> 
			<a class="btn text-white custom-btn p-2" href="/Drammy/logOut">Log Out</a> 
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
		            		<img class="img-fluid mb-3" src="${whiskey.imageUrl}" data-holder-rendered="true" alt="">
		            		<h5>${whiskey.name}</h5>
		            		<p class="font-weight-light mb-0">${whiskey.description}</p>
		            		<a class="btn btn-sm text-white btn-danger" href="/Drammy/deleteSavedWhiskey/${whiskey.whiskeyId}">Delete</a> 
		          		</div>
		        	</div>
		        	<div class="col-lg-6 tasting-notes-container">
		        		<h3>Tasting Notes</h3>
		        		<hr>
		        		<form action="/Drammy/saveNotes" method="POST" id="tasting-form">
 			        		<div class="tasting-category top">
			        			<h5>- Color -</h5>
			        			<textarea class="form-control tasting-input" name="color" form="tasting-form" rows="2">${whiskey.color}</textarea>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>- Nose -</h5>
			        			<textarea class="form-control tasting-input" name="nose" form="tasting-form" rows="2">${whiskey.nose}</textarea>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>- Palate -</h5>
			        			<textarea class="form-control tasting-input" name="palate" form="tasting-form" rows="2">${whiskey.palate}</textarea>
			        		</div>
			        		<div class="tasting-category">
			        			<h5>- Finish -</h5>
			        			<textarea class="form-control tasting-input" name="finish" form="tasting-form" rows="2">${whiskey.finish}</textarea>
			        		</div>
			        		<input type="hidden" name="whiskeyId" value="${whiskey.whiskeyId}">
			        		
			        		<button type="submit" class="btn btn-sm text-white submit-btn">Save</button>
			        	</form>
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
