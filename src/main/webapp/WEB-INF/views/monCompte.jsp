<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE >
<html>
<head>
<title>Mon compte</title>
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/CSS/styles.css" />
</head>
<body>
	<header>
		<div class="navbar navbar-default ">
			<div class="container-fluid">
				<div class="navbar-header ">
			      <a class="navbar-brand titre" href="#"> Banque En Ligne</a>
			    </div>
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/tableOperations"/>" >Operations</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/login"/>"><span class="glyphicon glyphicon-off" aria-hidden="true" style="margin-right: 10px;"></span>Deconnexion</a></li>
				</ul>
			</div>
		</div>
	</header>

	<section>
		<div class="col-md-6">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Consulter mon compte</h3>
				</div>
				<div class="panel-body">
					<form action="consulerCompte" method="GET" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label">Code de compte</label>
							<div class="col-sm-6">
						        <input class="form-control" type="text" name="code">
						      </div>
							<button type="submit" class="btn btn-success">Rechercher</button>
						</div>
					</form>
					<c:if test="${exception ne null}">
						<div class="text-danger">
							<label>Compte introuvable</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Information sur mon compte</h3>
				</div>
				<div class="panel-body">
					<c:if test="${compte ne null}">
						<div>
							<label>Code :</label> <label><c:out
									value="${compte.codeCompte}" /></label>
						</div>
						<div>
							<label>Solde :</label> <label><c:out
									value="${compte.solde}" /></label>
						</div>
						<div>
							<label>Date de création :</label> <label><c:out
									value="${compte.dateCreation}" /></label>
						</div>
						<div>
							<label>Type :</label> <label><c:out
									value="${compte['class'].simpleName}" /> </label>
						</div>
						<c:if test="${compte['class'].simpleName eq 'CompteCourant'}">
							<div>
								<label>Decouvert :</label> <label><c:out
										value="${compte.decouvert}" /> </label>
							</div>
						</c:if>
						<c:if test="${compte['class'].simpleName eq 'CompteEpargne'}">
							<div>
								<label>Taux :</label> <label><c:out
										value="${compte.taux}" /> </label>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col-md-6">


			<div class="panel panel-success">

				<div class="panel-heading">Opération sur le compte</div>

				<div class="panel-body">
					<c:if test="${compte ne null}">
						<form action="operation" method="GET" class="form-horizontal">

							<div>
								<label>Compte</label> 
								<input type="hidden" name="codeCompte" value="${compte.codeCompte}" /> 
								<label><c:out value="${compte.codeCompte}" /></label>


							</div>
							<div>
								<input type="radio" name="typeOperation" value="VERS"
									checked="checked" 
									onchange="document.getElementById('forVirement').style.display='none'" />
								<label>Versement</label> <input type="radio"
									name="typeOperation" value="RET" checked="checked"
									onchange="document.getElementById('forVirement').style.display='none'" />
								<label>Retrait</label> <input type="radio" name="typeOperation"
									value="VIR" checked="checked"
									onchange="document.getElementById('forVirement').style.display='block'" />
								<label>Virement</label>

							</div>
							<div >
								<div id="forVirement" class="form-group">
									<label class="col-sm-2 control-label">Vers:</label> 
									<div class="col-sm-6">
								        <input class="form-control" name="codeCompte2"  type="text" required="required" >
								     </div>
								</div>
								
								<div  class="form-group">
									<label class="col-sm-2 control-label">Montant:</label> 
									<div class="col-sm-6">
								        <input class="form-control" name="montant"  type="text" required="required" >
								     </div>     
								</div>
								<c:if test="${err ne null}" >
						    		<div class="text-danger">
						    		 <label><c:out value="${err}" /></label>
						    		</div>
					    		</c:if>
							</div>
							<button type="submit" class="btn btn-success" style="margin-left: 360px;">Save</button>


						</form>
					</c:if>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">Liste des dernieres opérations</div>

				<div class="panel-body">
					<c:if test="${compte ne null}">
						<table class="table table-striped">

							<tr>
								<th>Num</th>
								<th>Type</th>
								<th>Date</th>
								<th>Montant</th>
							</tr>
							<c:forEach var="op" items="${operations}">
								<tr>
									<td><c:out value="${op.numero}" /></td>
									<td><c:out value="${op['class'].simpleName}" /></td>
									<td><c:out value="${op.dateOperation}" /></td>
									<td><c:out value="${op.montant}" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>


			</div>



		</div>
	</section>
	<footer>
		<div class="navbar-fixed-bottom">
			<small>@ Banque en ligne</small>
		</div>
	</footer>
</body>
</html>