<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authentification</title>
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/CSS/styles.css" />
</head>
<body>
	<div class="col-md-4  col-md-offset-4 top">
		<div class="panel panel-success">
			<div class="panel-heading">Login</div>
			<div class="panel-body">
				<form action="compte" method="POST">
					<div class="form-group row">
						<div class="col-xs-8">
							<label>Login</label> <input type="text" name="login"
								class="form-control" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xs-8">
							<label>Mot de passe</label> <input type="password" name="mdp"
								class="form-control" />
						</div>
					</div>
					<div >
					<c:if test="${exception ne null}">
						<div class="text-danger">
							<label>Mot de pass ou login incorrect</label>
						</div>
					</c:if>
					<button type="submit" class="btn btn-success btn-lg btn-rounded">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>