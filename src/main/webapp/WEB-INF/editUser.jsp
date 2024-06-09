<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="beans.User"%>
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<% 
	final String APP_ROOT = request.getContextPath(); 
	User utilisateur = (User) request.getAttribute("utilisateur");
	
	
	LocalDate localDate = utilisateur.getDateDeNaissance().atZone(ZoneId.systemDefault()).toLocalDate();
    String formattedDate = localDate.format(DateTimeFormatter.ISO_DATE); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Modification d'un utilisateur</title>
    <link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/style.css">
</head>
<body>
    <header>Modification d'un utilisateur</header>
    <%@ include file="nav.jsp" %>

    <section>
        <form method="post">
            <fieldset>
                <h1>Modification les informations de l'utilisateur</h1>
                <div>
                    <label>Nom :</label>
                    <input type="text" name="nom" value="${utilisateur.nom}" placeholder="Nom de l'utilisateur" required><br>
                </div>
                <div>
                    <label>Prénom :</label>
                    <input type="text" name="prenom" value="${utilisateur.prenom}" placeholder="Prenom de l'utilisateur" ><br>
                </div>
                <div>
                    <label>Login :</label>
                    <input type="text" name="login" value="${utilisateur.login}" placeholder="Login de l'utilisateur" ><br>
                </div>
                <div>
                <div>
                    <label>Date de naissance :</label>
                    <input type="date" name="datedenaissance" value="${utilisateur.dateDeNaissance}" placeholder="Date naissanace  de l'utilisateur" required><br>
                </div>
                <div>
                    <label>Password :</label>
                    <input type="password" name="password" value="${utilisateur.password}" placeholder="Mot de passe de l'utilisateur"><br>
                </div>
                <div>
                    <input type="submit" value="Modifier"></button>
                </div>    
            </fieldset>
        </form>
    </section>
<%@ include file="footer.jsp" %>

