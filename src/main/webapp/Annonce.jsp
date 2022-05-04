<%@page import="Entities.Annonce"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	ArrayList<Annonce> listDesAnnonces = (ArrayList<Annonce>)request.getAttribute("listDesAnnonces"); 
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
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/css/card-image-zoom-on-hover.css">
    <link rel="stylesheet" href="assets/css/Filter-Annonce.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body>
    
    <%@include file="assets/inc/header.jsp" %>
    
    <section class="py-5" style="background: var(--bs-light);">
        <div class="container p-4" style="/*max-width: 320px;*//*width: 90%;*/margin: 0 auto;background-color: #ffffff;/*padding: 40px;*/border-radius: 4px;color: #505e6c;box-shadow: 1px 1px 5px rgba(0,0,0,0.1);">
            <div class="row">
                <div class="col-2 annonceFilter-clean p-0">
                    <form class="p-2" method="post">
                        <div class="mb-3"><input class="form-control" type="text" name="nomAnimal" placeholder="Nom"></div>
                        <div class="mb-3"><input class="form-control" type="email" name="adresseAnimal" placeholder="Adresse"></div>
                        <div class="mb-3"><select class="form-select form-control" name="TypeAnimal">
                                <option value="" selected>Type d'Animal</option>
                                <option value="chien">Chien</option>
                                <option value="chat">Chat</option>
                                <option value="oiseau">Oiseau</option>
                            </select></div>
                        <div class="mb-3"><select class="form-select form-control" name="TypeAnnonce">
                                <option value="" selected>Type d'Annonce</option>
                                <optgroup label="Adoption">
                                    <option value="offreAnimal">Offre d&apos;animal</option>
                                    <option value="demandeAdoption">Demande d&apos;adoption</option>
                                </optgroup>
                                <optgroup label="Hébergement provisoire">
                                    <option value="demandeHebergement">Demande d&apos;hébergement</option>
                                    <option value="offreHebergement">Offre d&apos;hébergement</option>
                                </optgroup>
                            </select></div>
                        <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: var(--bs-gray-dark);">Chercher !</button></div>
                    </form>
                </div>
                <div class="col-10">
                	<c:forEach items="${listDesAnnonces}" var="annonce">
						<div class="card shadow w-25">
	  						<div class="innerCard">
	    						<img src="<c:out value="${annonce.animal.image}" />" class="card-img-top" alt="...">
	  						</div>
	  						<div class="card-body text-center">
	    						<h5 class="card-title">${annonce.nom}</h5>
	    						<p class="card-text">${annonce.petiteDescription}</p>
	    						<a href="#" class="btn btn-info d-block">Consulter</a>
	  						</div>
						</div>
					</c:forEach>
				</div>
            </div>
        </div>
    </section>

	<%@include file="assets/inc/footer.jsp" %>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>