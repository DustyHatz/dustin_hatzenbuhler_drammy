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
	
	<title>Drammy - Results</title>
	
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

	<!-- Add jstl for using c:forEach tag -->
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<section class="search-results bg-dark text-center"
		style="background-image: url();">
		<div class="container">
			<span class="font-italic font custom-span">Search found ${results.size()} results...</span>
		</div>
	</section>
	
	<!-- Search Results -->
	<div class="album py-5 bg-white">
    <div class="container">
    	
	      <div class="row">
	      	<%-- <c:if test="${results.size() > 1}"> --%>
					<c:forEach items="${results}" var="result">
		        <div class="col-md-4">
		          <div class="card mb-3 box-shadow bg-light">
		            <img class="card-img-top search-result" alt="${result.name} thumbnail" src="${result.imageUrl}" data-holder-rendered="true">
		            <div class="card-body">
		            	<h5 class="card-title">${result.name}</h5>
		              <p class="card-text">${result.distillery}</p>
		              <div class="d-flex justify-content-between align-items-center">
		                <div class="btn-group">
		                	<form action="/Drammy/saveWhiskey" method="POST">
		                		<input type="hidden" name="whiskeyId" value="${result.whiskeyId}">
		                  	<button type="submit" class="btn btn-sm btn-outline-secondary">Save</button>
		                  	<button type="submit" class="btn btn-sm btn-outline-secondary" formaction="/Drammy/wantWhiskey">Want</button>
		                  </form>
		                </div>
		                <small class="text-muted">${result.type}</small>
		              </div>
		            </div>
		          </div>
		        </div>
		      </c:forEach>
	     		<%-- </c:if> --%>
	      </div>
	     
    </div>
  </div>

	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

</body>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
