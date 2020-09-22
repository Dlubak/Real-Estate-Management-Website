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

    <title>Offer Details Page</title>
  </head>
  <body>
		<div class="jumbotron jumbotron-fluid">
  		<div class="container">
    		<h1 class="display-4">Offer Details</h1>
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
<div class="container" style="padding-top: 50px">
				<div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1 style="align-center">Offer Details</h1>
                <hr>
            </div>
        </div>
				<!--Username-->
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Title:</h2>
                          <br><h4><c:out value="${offer.title}"/></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Price:</h2>
                          <br><h4><c:out value="${offer.price}"/></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Area^2:</h2>
                          <br><h4><c:out value="${offer.area}"/></h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Property Type:</h2>
                          <br><h4><c:out value="${offer.property.name}"/></h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Region:</h2>
                          <br><h4><c:out value="${offer.region.name}"/></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Region:</h2>
                          <br><h4><c:out value="${offer.region.name}"/></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                          <h2>Description:</h2>
                          <br><h4><c:out value="${offer.description}"/></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 50px">
          <div class="col-md-8">
            <div id="demo" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
              </ul>

              <!-- The slideshow -->
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${offer.imageUrl1}" alt=" " width="800" height="600">
                </div>
                <div class="carousel-item">
                  <img src="${offer.imageUrl2}" alt=" " width="800" height="600">
                </div>
                <div class="carousel-item">
                  <img src="${offer.imageUrl3}" alt=" " width="800" height="600">
                </div>
              </div>
              <!-- Left and right controls -->
              <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
              </a>
              <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
              </a>
              </div>
          </div>
        </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
