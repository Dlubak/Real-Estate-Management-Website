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
			<h1 class="display-4">New Offer</h1>
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
    <form:form class="form-horizontal" action="saveOffer" modelAttribute="offer" method="POST">
				<form:hidden path="id" />
				<div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Add New Offer</h2>
                <hr>
            </div>
        </div>

				<!--Title-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Title</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="title" name="title" class="form-control" id="name" placeholder="Title"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="title" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--Title-->

				<!--Property-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Property</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:select path="property" class="form-control">
													<c:forEach var="property" items="${properties}">
														<option <c:if test="${property.id eq thepropertyid}">selected="selected"</c:if> value="${property.id}">${property.name}</option>
													</c:forEach>
												</form:select>
										</div>
                </div>
            </div>
        </div>
				<!--Property-->

				<!--Area-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Area</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="area" class="form-control" placeholder="Area"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="area" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--Area-->

				<!--Price-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Price</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="price" class="form-control" placeholder="Price"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="price" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--Price-->

				<!--Region-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Region</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:select path="region" class="form-control">
													<c:forEach var="region" items="${regions}">
														<option <c:if test="${region.id eq theregionid}">selected="selected"</c:if> value="${region.id}">${region.name}</option>
													</c:forEach>
												</form:select>
										</div>
                </div>
            </div>
        </div>
				<!--Region-->
				<!--Images-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Images</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="imageUrl1" class="form-control" placeholder="ImageUrl"/>
                    </div>
                </div>
								<div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="imageUrl2" class="form-control" placeholder="ImageUrl"/>
                    </div>
                </div>
								<div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input path="imageUrl3" class="form-control" placeholder="ImageUrl"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="imageUrl1" cssClass="error" />
														<form:errors path="imageUrl2" cssClass="error" />
														<form:errors path="imageUrl3" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--Images-->

				<!--Description-->
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Price</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <form:input style="height: 5rem" path="description" class="form-control" placeholder="Description..."/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <form:errors path="description" cssClass="error" />
                        </span>
                </div>
            </div>
        </div>
				<!--Description-->

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <input type="submit" value="Save" class="btn btn-success"><i class="fa fa-user-plus"></i>
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
