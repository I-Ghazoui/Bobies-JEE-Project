<%@page import="Entities.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	Utilisateur user = (Utilisateur)session.getAttribute("user");
%>
    
<nav class="navbar navbar-light navbar-expand-md">
	<div class="container"><a class="navbar-brand" href="home">Bobies</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
    	<div class="collapse navbar-collapse" id="navcol-2">
        	<ul class="navbar-nav">
            	<li class="nav-item"><a class="nav-link active" href="home">Home</a></li>
                <c:if test="${not empty user}">
    				<li class="nav-item"><a class="nav-link" href="Annonces">Annonce</a></li>
				</c:if>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			</ul>
            <c:if test="${empty user}">
    			<ul class="navbar-nav ms-auto">
                   	<li class="nav-item"><button onclick="window.location.href='login'" class="btn btn-light btn-sm" type="button">Se connecter</button></li>
                   	<li class="nav-item"><button onclick="window.location.href='register'" class="btn btn-dark btn-sm" type="button">S'inscrire</button></li>
               	</ul>
			</c:if>
			<c:if test="${not empty user}">
    			<ul class="navbar-nav ms-auto">
    				<li class="nav-item d-flex align-items-center mx-0">
                        <div class="d-flex flex-row"><img class="rounded-circle" src="${user.image}" style="width: 30px;"></div>
                    </li>
                    <li class="nav-item mx-0"><a class="nav-link d-flex align-items-center px-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><span>${user.nom} ${user.prenom}</span></a></li>
                    <li class="nav-item d-flex align-items-center mx-0"><a class="nav-link d-flex align-items-center px-1" href="AjouterAnnonceServlet" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><i class="fa fa-plus"></i></a></li>
                    <li class="nav-item d-flex align-items-center mx-0"><a class="nav-link d-flex align-items-center px-1" href="EditProfileServlet" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><i class="fa fa-gear"></i></a></li>
                   	<li class="nav-item d-flex align-items-center mx-0"><a class="nav-link d-flex align-items-center px-1" href="logout" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><i class="fa fa-sign-out"></i></a></li>
               	</ul>
			</c:if>
		</div>
	</div>
</nav>