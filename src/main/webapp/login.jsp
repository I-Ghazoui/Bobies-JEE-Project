<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	Boolean isLogin = (Boolean)request.getAttribute("isLogin"); 
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
    <link rel="stylesheet" href="assets/css/card-image-zoom-on-hover.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body>

	<%@include file="assets/inc/header.jsp" %>

    <section class="login-clean" style="background: var(--bs-light);">
        <form action="login" method="post">
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><i class="far fa-user" style="color: var(--bs-gray-dark);"></i></div>
            <c:if test="${isLogin == false}">
    			<div class="alert alert-danger" role="alert">Information erronée !</div>
			</c:if>
            <div class="mb-3"><input class="form-control" type="text" name="username" placeholder="Nom d'utilisateur"></div>
            <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Mot de passe"></div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" name="SignInButton" type="submit" style="background: var(--bs-gray-dark);">Se Connecter</button></div><a class="forgot" href="#">Forgot your email or password?</a>
        </form>
    </section>
    
	<%@include file="assets/inc/footer.jsp" %>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>