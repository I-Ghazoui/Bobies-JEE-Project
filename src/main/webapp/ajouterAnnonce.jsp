<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%
	String successAnnonceStatus = (String)request.getAttribute("successAnnonceStatus");
	String failedAnnonceStatus = (String)request.getAttribute("failedAnnonceStatus");
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Bobies</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/card-image-zoom-on-hover.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>
	
<body>
    
    <%@include file="assets/inc/header.jsp" %>
    
    <section class="py-5" style="background: var(--bs-light);">
        <div class="container" style="margin: 0 auto;background-color: #ffffff;border-radius: 4px;color: #505e6c;box-shadow: 1px 1px 5px rgba(0,0,0,0.1);">
            <div class="row">
                <div class="col-md-4 p-0">
                    <div class="h-100 rounded-start" style="background: url(&quot;assets/img/dog-house.jpg&quot;) center / cover no-repeat;"></div>
                </div>
                <div class="col-md-8 border-right">
                    <form action="AjouterAnnonceServlet" method="POST">
                        <div class="p-3 py-5">
                        	<c:if test="${not empty successAnnonceStatus}">
				    			<div class="alert alert-success" role="alert">${successAnnonceStatus}</div>
							</c:if>
							<c:if test="${not empty failedAnnonceStatus}">
				    			<div class="alert alert-danger" role="alert">${failedAnnonceStatus}</div>
							</c:if>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Informations d'animal<br></h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label class="form-label">Nom</label><input class="form-control form-control" type="text" name="nomAnimal" required></div>
                                <div class="col-md-6"><label class="form-label">Type d&apos;Animal</label>
                                	<select class="form-select form-control" name="TypeAnimal">
										<option value="" selected="">Type d&apos;Animal</option>
										<option value="chien">Chien</option>
										<option value="chat">Chat</option>
										<option value="oiseau">Oiseau</option>
										<option value="lapin">Lapin</option>
										<option value="poisson">Poisson</option>
										<option value="cameleon">Cameleon</option>
									</select>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label class="form-label">Age</label><input class="form-control form-control" type="number" name="ageAnimal" required></div>
                                <div class="col-md-6"><label class="form-label">Lien image</label><input class="form-control form-control" type="text" name="imageAnimal" required></div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center my-3">
                                <h4 class="text-right">Information d'annonce<br></h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-4"><label class="form-label">Titre</label><input class="form-control form-control" type="text" name="titreAnnonce" required></div>
                                <div class="col-md-4"><label class="form-label">Type d&apos;Annonce</label>
                                	<select class="form-select form-control" name="TypeAnnonce">
										<option value="" selected="">Type d&apos;Annonce</option>
										<optgroup label="Adoption">
											<option value="offreAnimal">Offre d&apos;animal</option>
											<option value="demandeAdoption">Demande
												d&apos;adoption</option>
										</optgroup>
										<optgroup label="Hébergement provisoire">
											<option value="demandeHebergement">Demande
												d&apos;hébergement</option>
											<option value="offreHebergement">Offre
												d&apos;hébergement</option>
										</optgroup>
									</select>
                                </div>
                                <div class="col-md-4"><label class="form-label">Date</label><input class="form-control form-control" type="date" name="dateAnnonce" required></div>
                            </div>
                            <div class="row mt-2">
                                <div class="col"><label class="form-label"><strong>Description</strong><br></label><textarea class="form-control form-control" name="descriptionAnnonce" maxlength="250" style="resize: none;" rows="3" required></textarea></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-dark" type="submit">Ajouter<br></button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="assets/inc/footer.jsp" %>
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>