<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<title>Mon compte</title>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<header>
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
				 <li><a>Operation</a></li>
				 <li><a>Comptes</a></li>
				 <li><a>Deconnexion</a></li>
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
		    		<form action="consulerCompte" method="GET">
		    			<div class="form-group">
		    				<label >Code de compte</label>
		    				<input type="text" name="code" />
		    				<button type="submit" class="btn btn-success">ok</button>
		    			</div>
		    		</form>
		    		<c:if test="${exception ne null}" >
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
		    	  <c:if test="${compte ne null}" >
		    		<div>
		    		 <label>Code :</label>
		    		 <label><c:out value="${compte.codeCompte}" /></label>
		    		</div>
		    		<div>
		    		 <label>Solde :</label>
		    		 <label><c:out value="${compte.solde}" /></label>
		    		</div>
		    		<div>
		    		 <label>Date de création :</label>
		    		 <label><c:out value="${compte.dateCreation}" /></label>
		    		</div>
		    		<div>
			    		 <label>Type :</label>
			    		 <label><c:out value="${compte['class'].simpleName}" /> </label>
			    		</div>
		    		<c:if test="${compte['class'].simpleName eq 'CompteCourant'}" >
			    		<div>
			    		 <label>Decouvert :</label>
			    		 <label><c:out value="${compte.decouvert}" /> </label>
			    		</div>
			    	</c:if>
			    	<c:if test="${compte['class'].simpleName eq 'CompteEpargne'}" >
			    		<div>
			    		 <label>Taux :</label>
			    		 <label><c:out value="${compte.taux}" /> </label>
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
		      <c:if test="${compte ne null}" >
		       <label>hey</label>
		     </c:if>
		     </div>
		  </div>
		<div class="panel panel-success">
		   <div class="panel-heading">Liste des opérations </div>
		 
		   <div class="panel-body">
		    <c:if test="${compte ne null}" >
		    <table class="table table-striped">
		    
		     <tr>
	             <th>Num</th><th>Type</th>	<th>Date</th><th>Montant</th>		    
		     </tr>
		       <c:forEach var="op" items="${operations}" >
		      <tr>
		          <td><c:out value="${op.numero}"/></td>
		          <td><c:out value="${op['class'].simpleName}"/></td>
                  <td><c:out value="${op.dateOperation}"/></td>		      
		          <td><c:out value="${op.montant}"/></td>
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