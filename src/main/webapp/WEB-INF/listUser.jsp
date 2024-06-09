<%@page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="beans.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.Instant" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.ZoneId" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<% 
	final String APP_ROOT = request.getContextPath();
	ArrayList<User> utilisateurs = (ArrayList<User>) request.getAttribute("utilisateurs"); 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Liste des utilisateurs</title>
		<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/style.css">
		<style type="text/css">
			button{
				height : 35px;
				background-color : #4CAF50;
				color : white;
				border : none;
				cursor : pointer;
				text-transform :capitalize;
				min-width : 50px;
			}
		</style>
	</head>
	<body>
		<header>Liste des utilisateurs</header>
		<%@ include file="nav.jsp" %>
		
		<section>
			 <c:choose> 
	            <c:when test="${ empty utilisateurs }">
	                <p style="color : red; font-size : 20px">Aucun utilisateur a afficher, merci d'ajouter des utilisateurs !</p>
	            </c:when>
	            <c:otherwise>
	                <table border="1" cellspacing="0" cellpadding="10">
	                    <tr>
	                        <th>ID</th>
	                        <th>Nom</th>
	                        <th>Prénom</th>
	                        <th>Login</th>
	                        <th>Date de naissance</th>
	                        <th colspan="2">Editer ou supprimer</th>
	                    </tr>
	                    <c:forEach items="${ requestScope.utilisateurs }" var="utilisateur">
	                        <tr>
	                            <td><c:out value="${ utilisateur.id }"/></td>
	                            <td><c:out value="${ utilisateur.nom }"/></td>
	                            <td><c:out value="${ utilisateur.prenom }"/></td>
	                            <td><c:out value="${ utilisateur.login }"/></td>
	                            <td><c:out value="${ utilisateur.dateDeNaissance }"/></td>
	                            <td><a href="<%= APP_ROOT %>/users/update?id=${ utilisateur.id }"><button>Editer</button></a></td>
	                            <td><a href="<%= APP_ROOT %>/delete?id=${ utilisateur.id }" onclick="return confirm('Voulez supprimer cet utilisateur  ?')"><button style="background-color : red">Supprimer</button></a></td>
	                        </tr>
	                    </c:forEach>
	                </table>
	            </c:otherwise>
	        </c:choose>
		</section>
<%@ include file="footer.jsp" %>