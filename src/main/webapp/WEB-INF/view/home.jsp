<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Real Estate Office</title>
  </head>
  <body>
		<div class="jumbotron jumbotron-fluid">
  		<div class="container">
    		<h1 class="display-4">HomePage</h1>
    		<p class="lead">Welcome to the Real Estate Management Office</p>
  		</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  	<a class="navbar-brand" href="${pageContext.request.contextPath}/">HomePage</a>

    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/addOffer">Add Offer <span class="sr-only">(current)</span></a>
      </li>

    </ul>
		<ul class="navbar-nav ml-auto">
			<security:authorize access="isAnonymous()">
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/registerForm">Register <span class="sr-only">(current)</span></a>
				</li>
	      <li class="nav-item active">
	        <a class="nav-link" href="${pageContext.request.contextPath}/loginPage">Login</a>
	      </li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/profile">
						<security:authentication property="principal.username"/>
					</a>
				</li>
				<li class="nav-item active">
					<form:form class="form-inline" action="${pageContext.request.contextPath}/logout" method="POST">
						<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Logout" />
					</form:form>
				</li>
			</security:authorize>
		</ul>
</nav>

<div class="row justify-content-center">
	<div class="col-10 col-md-6 col-lg-4">
		<form:form class="card card-sm" action="search" method="GET">
			<div class="card-body row no-gutters align-items-center">
				<div class="col-auto">
					<i class="fas fa-search h4 text-body"></i>
				</div>
				<div class="col-auto">
					<input type="text" name="theSearchTitle" class="form-control form-control-lg form-control-borderless" placeholder="Title">
				</div>
				<div class="col-auto">
					<button class="btn btn-lg btn-success" type="submit">Search</button>
				</div>
		</form:form>
		<div clas="col-auto">
		<form:form action="/price" method="GET">
			<select name="filterType" class="browser-default custom-select">
				<option value="asc"> Price Ascending</option>
        <option value="desc">Price Descending</option>
			</select>
		</div>
			<div class="col-auto">
				<button class="btn btn-lg btn-success" type="submit">Filter</button>
			</div>
		</form:form>
		</div>
		</div>
</div>
<div class="row justify-content-center">
<div class="col-8">
		<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Area</th>
      <th scope="col">Price</th>
      <th scope="col">Miniature</th>
			<th scope="col-auto">Property</th>
			<th scope="col">Date</th>
    </tr>
  </thead>
		<c:forEach var="tempOffer" items="${offer}">
		<tbody>
    <tr>
      <th scope="row"><a href="${pageContext.request.contextPath}/offer/${tempOffer.id}">${tempOffer.title}</th>
      <td>${tempOffer.area}</td>
      <td>${tempOffer.price}</td>
			<td><img src="${tempOffer.imageUrl1}" alt=" " class="rounded" width="200" height="150"></td>
			<td>${tempOffer.property.name}</td>
			<td>${tempOffer.dateAdd}</td>
    </tr>
		</tbody>
		</c:forEach>
</table>
</div>
</div>









    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
