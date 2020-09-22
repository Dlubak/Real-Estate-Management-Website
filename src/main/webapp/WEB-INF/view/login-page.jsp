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
    		<h1 class="display-4">Login Page</h1>
    		<p class="lead">Welcome to the Real Estate Management Office</p>
  		</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  	<a class="navbar-brand" href="${pageContext.request.contextPath}/">HomePage</a>
		<ul class="navbar-nav ml-auto">
			<security:authorize access="isAnonymous()">
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/registerForm">Register <span class="sr-only">(current)</span></a>
				</li>
			</security:authorize>
		</ul>
</nav>
<div class="container" style="padding-top: 50px">
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST" class="form-horizontal">
				<div class="row">
					<div class="col-md-3 row justify-content-center">
							<div class="form-control-feedback">
											<span class="text-danger align-middle">
												<c:if test="${param.error != null}">
													<div class="alert alert-danger col-xs-offset-1 col-xs-10">
														Invalid username and password.
													</div>
												</c:if>
											</span>
							</div>
					</div>
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Login</h2>
                <hr>
            </div>
        </div>
				<!--Username-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Username:</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <input type="text" name="username" class="form-control" id="name" placeholder="username"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
								<!-- Check for login error -->
                      </span>
                </div>
            </div>
        </div>
				<!--End Username-->

				<!--Password-->
				<div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <input type="password" name="password" class="form-control" id="password"
                               placeholder="Password"/>
                    </div>
                </div>
            </div>
        </div>
				<!--End Password-->
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i>Login</button>
								<a href="${pageContext.request.contextPath}/" class="btn btn-success"><i class="fa fa-user-plus"></i> Cancel</a>
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
