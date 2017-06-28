<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/CSS/styles.css" />
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css" />
</head>

<body>
	<header>
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<li><a>Operation</a></li>
					<li><a href="<c:url value="/goCompte"/>" > Mon Compte</a></li>
					<li><a href="<c:url value="/login"/>">Deconnexion</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div class="col-md-6  col-md-offset-3 ">
			 <table class="table table-success table-hover table-bordered">
			            <tr class="bg-success">
			            	<th>Numero</th>
			            	<th>date d'operation</th>
			            	<th>Montant</th>
			            	<th>Type d'operation</th>
			             </tr>
			             <c:forEach items="${allOperations}" var="op">
			                <tr>
			                	<td><c:out value="${op.numero}"/></td>
			                	<td><c:out value="${op.dateOperation}"/></td>
			                	<td><c:out value="${op.montant}"/></td>
			                	<td><c:out value="${op['class'].simpleName}"/></td>
			                </tr>
			             </c:forEach>
			        </table>   
		 </div>     
	</section>
</body>
</html>