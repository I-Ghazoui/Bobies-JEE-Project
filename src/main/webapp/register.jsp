<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body>

    <%@include file="assets/inc/header.jsp" %>
    
    <section class="login-clean" style="background: var(--bs-light);">
        <form method="post">
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><i class="far fa-user" style="color: var(--bs-gray-dark);"></i></div>
            <div class="d-flex mb-3"><input class="form-control w-50" type="text" name="nom" placeholder="Nom"><input class="form-control w-50" type="text" name="prenom" placeholder="Prenom"></div>
            <div class="mb-3"><input class="form-control" type="text" name="username" placeholder="Nom d'utilisateur"></div>
            <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Email"></div>
            <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Mot de passe"></div>
            <div class="mb-3"><input class="form-control" type="password" name="re-password" placeholder="Confirmer mot de passe"></div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: var(--bs-gray-dark);">S'inscrire</button></div>
        </form>
    </section>
    
    <%@include file="assets/inc/footer.jsp" %>
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>