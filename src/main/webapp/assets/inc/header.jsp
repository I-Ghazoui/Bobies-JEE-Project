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
                   	<li class="nav-item"><button onclick="window.location.href='logout'" class="btn btn-dark btn-sm" type="button">Se déconnecter</button></li>
               	</ul>
			</c:if>
		</div>
	</div>
</nav>