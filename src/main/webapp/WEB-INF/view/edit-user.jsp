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
<div class="container" style="padding-top: 30px">
    <form:form id="usersForm" class="form-horizontal" action="${pageContext.request.contextPath}/admin/edit/updateuser/${user.id}" modelAttribute="user">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Edit User</h2>
                <hr>
            </div>
        </div>

				<!--Username-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Username</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="username" name="name" class="form-control" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
				<!--End Username-->

				<!-- First name -->
				<div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Firstname</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="firstName" name="name" class="form-control" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
				<!-- End first name -->

				<!-- last name -->
				<div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Lastname</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="lastName" name="name" class="form-control" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
				<!-- End last name -->

				<!-- End email name -->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">E-Mail</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <form:input path="email" name="email" class="form-control" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
				<!-- End email name -->

        <!-- Role -->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">Role</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <form:select path="roleNumber" items="${roleMap}" class="form-control"/>
                    </div>
                </div>
            </div>
        </div>
				<!-- Role -->

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <input type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i></button>
								<a href="${pageContext.request.contextPath}/admin" class="btn btn-success"><i class="fa fa-user-plus"></i> Cancel</a>
            </div>
        </div>
    </form:form>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
