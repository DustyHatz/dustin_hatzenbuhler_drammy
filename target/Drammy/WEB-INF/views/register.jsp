<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Drammy - Register</title>
	
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
		
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		
	<script>
		// JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load', function() {
				// Fetch all the forms we want to apply custom Bootstrap validation styles to
				var forms = document.getElementsByClassName('needs-validation');
				// Loop over them and prevent submission
				var validation = Array.prototype.filter.call(forms, function(form) {
					form.addEventListener('submit', function(event) {
						if (form.checkValidity() === false) {
							event.preventDefault();
							event.stopPropagation();
						}
						form.classList.add('was-validated');
					}, false);
				});
			}, false);
		})();
	</script>

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
	<header class="masthead text-white text-left masthead-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/tasting_glass.jpeg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">Create account...</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-left">
					<form class="needs-validation" action="/Drammy/createAccount" method="POST" novalidate
						oninput='confirmPassword.setCustomValidity(confirmPassword.value != password.value ? "Passwords do not match." : "")'>
						<div class="form-group">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="firstName">First Name</label>
									<input type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name...">
								</div>
								<div class="form-group col-md-6">
									<label for="lastName">Last Name</label>
									<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name...">
								</div>
							</div>
							<label for="userName">Username*</label> <input type="text" class="form-control" name="username" id="userName" placeholder="Create username..." required maxlength="20">
							<div class="invalid-feedback">Please enter a Username</div>
							<small id="usernameHelp" class="form-text text-light">*Limit 20 characters</small>
							<p class="text-danger">${usernameAlreadyExists}</p>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="password">Create Password*</label> <input type="password" class="form-control" name="password" id="password" placeholder="Create password..." required>
								<div class="invalid-feedback">Please enter a valid password</div>
							</div>
							<div class="form-group col-md-6">
								<label for="confirmPassword">Confirm Password*</label> <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Re-type password..." required>
								<div class="invalid-feedback">Passwords do not match</div>
							</div>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1" required>
							<label class="form-check-label" for="exampleCheck1">I am at least 21 years of age.</label>
							<div class="invalid-feedback">Must confirm legal drinking age to proceed</div>
						</div>
						<button type="submit" class="btn text-white submit-btn">Create Account</button>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->
  <section class="features-icons bg-dark text-center">
    <div class="container">
      <span class="font-italic font custom-span">"The best whiskey is the whiskey you like, the way you like to drink it!"</span>
    </div>
    <span class="font-italic font-weight-light custom-span">- Whiskey Tribe</span>
  </section>

	<!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/resources/images/pot_still.jpeg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>Is Bourbon whiskey?...</h2>
          <p class="lead mb-0">Yes, all bourbon is whiskey but not all whiskey is bourbon. Bourbon is but one type of whiskey. Other types of whiskey include, Scotch, Rye, Irish, Japenese, and many more!</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/resources/images/tasting_glasses.jpeg');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2>"Tasting" is different than "drinking"</h2>
          <p class="lead mb-0">The goal is to evaluate and enjoy the whiskey. Sip a little bit at a time, taking note of the aroma, texture, and ultimately the flavor, just as you would when tasting wine.</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/resources/images/enjoy_whiskey.jpeg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>What is the best whiskey?</h2>
          <p class="lead mb-0">Whether you enjoy a dram neat, on the rocks, or mixed in a tasty cocktail, the best whiskey is the whiskey you like the way you like to drink it.</p>
        </div>
      </div>
    </div>
  </section>

	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>