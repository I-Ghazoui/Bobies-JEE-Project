<%@page import="Entities.Annonce"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<Annonce> listDesAnnonces = (ArrayList<Annonce>) request.getAttribute("listDesAnnonces");
	String selectedTypeAnimal = ((String)request.getAttribute("typeAnimal"));
	String selectedTypeAnnonce = ((String)request.getAttribute("typeAnnonce"));
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Bobies</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="assets/css/card-image-zoom-on-hover.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body>

	<%@include file="assets/inc/header.jsp"%>

	<section class="py-5" style="background: var(--bs-light);">
		<div class="container p-4"
			style="margin: 0 auto; background-color: #ffffff; border-radius: 4px; color: #505e6c; box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);">
			<div class="row">
				<div class="col-12 p-0">
					<form class="d-flex justify-content-between p-2" action="Annonces" method="post">
						<div class="d-flex align-items-center illustration">
							<i class="material-icons" style="color: var(- -bs-gray-dark);">pets</i>
							<h2 class="d-flex align-items-center m-0">Annonces</h2>
						</div>
						<div class="d-flex align-items-center">
							<div class="mx-1">
								<select class="form-select form-control" name="TypeAnimal">
									<option value="" selected="">Type d&apos;Animal</option>
									<option value="chien" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("chien")){out.print("selected");} %>>Chien</option>
									<option value="chat" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("chat")){out.print("selected");} %>>Chat</option>
									<option value="oiseau" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("oiseau")){out.print("selected");} %>>Oiseau</option>
									<option value="lapin" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("lapin")){out.print("selected");} %>>Lapin</option>
									<option value="poisson" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("poisson")){out.print("selected");} %>>Poisson</option>
									<option value="cameleon" <% if(selectedTypeAnimal!=null && selectedTypeAnimal.equals("cameleon")){out.print("selected");} %>>Cameleon</option>
								</select>
							</div>
							<div class="mx-1">
								<select class="form-select form-control" name="TypeAnnonce">
									<option value="" selected="">Type d&apos;Annonce</option>
									<optgroup label="Adoption">
										<option value="offreAnimal" <% if(selectedTypeAnnonce!=null && selectedTypeAnnonce.equals("offreAnimal")){out.print("selected");} %>>Offre d&apos;animal</option>
										<option value="demandeAdoption" <% if(selectedTypeAnnonce!=null && selectedTypeAnnonce.equals("demandeAdoption")){out.print("selected");} %>>Demande
											d&apos;adoption</option>
									</optgroup>
									<optgroup label="Hébergement provisoire">
										<option value="demandeHebergement" <% if(selectedTypeAnnonce!=null && selectedTypeAnnonce.equals("demandeHebergement")){out.print("selected");} %>>Demande
											d&apos;hébergement</option>
										<option value="offreHebergement" <% if(selectedTypeAnnonce!=null && selectedTypeAnnonce.equals("offreHebergement")){out.print("selected");} %>>Offre
											d&apos;hébergement</option>
									</optgroup>
								</select>
							</div>
							<div class="d-flex justify-content-center mx-1">
								<button class="btn btn-dark d-block float-end" type="submit">Chercher
									!</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col">
					<div class="row">
						<c:forEach items="${listDesAnnonces}" var="annonce">
							<div class="col-lg-3 p-2">
								<div class="card shadow">
									<div class="innerCard">
										<img src="<c:out value="assets/uploadedFiles/animals/${annonce.animal.image}" />"
											class="card-img-top" alt="...">
									</div>
									<div class="card-body text-center">
										<h5 class="card-title">${annonce.nom}</h5>
										<p class="card-text">${annonce.petiteDescription}</p>
										<a href="#" class="btn btn-info d-block"
											data-bs-toggle="modal"
											data-bs-target="#exampleModal${annonce.id}">Consulter</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:forEach items="${listDesAnnonces}" var="annonce">
		<%@include file="assets/inc/AnnonceInfos.jsp"%>
	</c:forEach>

	<%@include file="assets/inc/footer.jsp"%>

	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>