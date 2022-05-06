<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5 mb-3" style="width: 150px;" src="${user.image}"><span class="font-weight-bold">GHAZOUI Ilyas</span><span class="text-black-50">i-ghazoui@live.fr</span></div>
                </div>
                <div class="col-md-6 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Paramètres de profil<br></h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="form-label">Nom</label><input type="text" class="form-control" name="nom" value="${user.nom}"></div>
                            <div class="col-md-6"><label class="form-label">Prenom</label><input type="text" class="form-control" name="prenom" value="${user.prenom}"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="form-label"><strong>Description</strong><br></label><textarea class="form-control" name="description">${user.description}</textarea></div>
                        </div>
                        <div class="mt-5 text-center"><button class="btn btn-dark" type="button">Sauvegarder<br></button></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Cookies</h4>
                        </div>
                        <div class="col-md-12"><label class="form-label">Animal préféré:</label><select class="form-control" name="TypeAnimal">
                                <option value="" selected="">Type d'Animal</option>
                                <option value="chien">Chien</option>
                                <option value="chat">Chat</option>
                                <option value="oiseau">Oiseau</option>
                            </select></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<%@include file="assets/inc/footer.jsp" %>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>