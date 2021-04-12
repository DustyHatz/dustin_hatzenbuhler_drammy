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
	
		<!-- Add jstl for using c:forEach tag -->
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-dark static-top">
	
		<div class="container">
			<a class="navbar-brand text-light" href="/Drammy/userProfile">Drammy</a>
			<a class="btn text-white custom-btn" href="/Drammy/logOut">Log Out</a> 
		</div>

	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-left masthead-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/tasting_glass.jpeg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">${user.getFirstName()}'s Drams</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-left">
					<form action="search" method="POST">
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

<!-- User Whiskey Tables -->
  <div class="row">
    <div class="column">
      <h3>Tasted</h3>
      <table class="table table-light table-hover table-md">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Whiskey</th>
            <th scope="col">Distillery</th>
            <th scope="col">Type</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach items="${savedWhiskey}" var="whiskey">
	          <tr>
	            <td><a href="/Drammy/whiskeyProfile/${whiskey.whiskeyId}">${whiskey.name}</a></td>
	            <td>${whiskey.distillery}</td>
	            <td>${whiskey.type}</td>
	          </tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
    <div class="column">
      <h3>Want</h3>
      <table class="table table-light table-hover table-md">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Whiskey</th>
            <th scope="col">Distillery</th>
            <th scope="col">Type</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach items="${wantedWhiskey}" var="whiskey">
	          <tr>
	            <td>${whiskey.name}</td>
	            <td>${whiskey.distillery}</td>
	            <td>${whiskey.type}</td>
	            <td><a href="/Drammy/moveWhiskey/${whiskey.whiskeyId}">Taste</a></td>
	          </tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
  </div>

	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
