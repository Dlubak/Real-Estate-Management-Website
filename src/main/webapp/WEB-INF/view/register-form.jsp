<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
	<title>Register New User Form</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Reference Bootstrap files -->
	<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		.error {
			color: red;
		}
	</style>
</head>

<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4">Register</h1>
			<p class="lead">Welcome to the Real Estate Management Office</p>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/">HomePage</a>
	<ul class="navbar-nav ml-auto">
		<security:authorize access="isAnonymous()">
			<li class="nav-item active">
				<a class="nav-link" href="${pageContext.request.contextPath}/loginPage">Login</a>
			</li>
		</security:authorize>
	</ul>
</nav>
<div class="container" style="padding-top: 30px">
    <form:form id="usersForm" class="form-horizontal" action="${pageContext.request.contextPath}/processRegistrationForm" modelAttribute="crmUser">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Register New User</h2>
                <hr>
            </div>
        </div>

				<!--Username-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">UserName</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="username" name="name" class="form-control" id="name" placeholder="username"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="password" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--End Username-->

				<!--Paassword-->
				<div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <form:password path="password" name="password" class="form-control" id="password"
                               placeholder="Password"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="password" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--End Password-->

				<!-- Confirm Password -->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Confirm Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem">
                            <i class="fa fa-repeat"></i>
                        </div>
                        <form:password path="matchingPassword" name="password-confirmation" class="form-control"
                               id="password-confirm" placeholder="Confirm Password"/>
                    </div>
                </div>
            </div>
						<div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="matchingPassword" cssClass="error" />
                        </span>
                </div>
        </div>
			</div>
				<!-- End Confirm Password -->

				<!-- First name -->
				<div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Firstname</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="firstName" name="name" class="form-control" id="name"
                               placeholder="John"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="firstName" cssClass="error" />
                        </span>
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
                        <form:input path="lastName" name="name" class="form-control" id="name"
                               placeholder="Doe"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="lastName" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!-- End last name -->
				<!-- End email name -->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">E-Mail Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <form:input path="email" name="email" class="form-control" id="email"
                               placeholder="you@example.com"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="email" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!-- End email name -->
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i> Register</button>
								<a href="${pageContext.request.contextPath}/" class="btn btn-success"><i class="fa fa-user-plus"></i> Cancel</a>
            </div>
        </div>
    </form:form>
</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
