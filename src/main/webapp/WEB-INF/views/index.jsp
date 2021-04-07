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
	
	<title>Drammy - Home</title>
	
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
					<h1 class="mb-5">DRAMMY</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-left">
					<form action="/Drammy/search" method="POST">
						<div class="form-row">
							<div class="col-12 col-md-6 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg" name="search"
									placeholder="Search for whiskey...">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit"
									class="btn btn-block btn-lg text-white submit-btn">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->
	<section class="features-icons bg-dark text-center"
		style="background-image: url();">
		<div class="container">
			<span class="font-italic font custom-span">"The best whiskey
				is the whiskey you like, the way you like to drink it!"</span>
		</div>
		<span class="font-italic font-weight-light custom-span">-
			Whiskey Tribe</span>
	</section>

	<!-- Image Showcases -->
	<section class="showcase">
		<div class="container-fluid p-0">
			<div class="row no-gutters">

				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('<%=request.getContextPath()%>/resources/images/pot_still.jpeg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>All Scotch is whiskey...</h2>
					<p class="lead mb-0">...but not all whiskey is Scotch. Scotch
						is but one variation of whiskey. Other styles of whiskey include,
						Bourbon, Irish, Canadian, Japenese, and many more!</p>
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 text-white showcase-img"
					style="background-image: url('<%=request.getContextPath()%>/resources/images/tasting_glasses.jpeg');"></div>
				<div class="col-lg-6 my-auto showcase-text">
					<h2>"Tasting" is different than "drinking"</h2>
					<p class="lead mb-0">The goal is to evaluate and enjoy the
						whiskey. Sip a little bit at a time, taking note of the aroma,
						texture, and ultimately the flavor, just as you would when tasting
						wine.</p>
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('<%=request.getContextPath()%>/resources/images/enjoy_whiskey.jpeg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>What is the best whiskey?</h2>
					<p class="lead mb-0">Whether you enjoy a dram neat, on the
						rocks, or mixed in a tasty cocktail, the best whiskey is the
						whiskey you like the way you like to drink it.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonials
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">What people are saying...</h2>
      <div class="row">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
            <h5>Margaret E.</h5>
            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
            <h5>Fred S.</h5>
            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
            <h5>Sarah W.</h5>
            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- Call to Action -->
	<!-- <section class="call-to-action text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h2 class="mb-4">Ready to get started? Sign up now!</h2>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form>
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="email" class="form-control form-control-lg"
									placeholder="Enter your email...">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit"
									class="btn btn-block btn-lg custom-btn text-light">Sign
									up!</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section> -->

	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
