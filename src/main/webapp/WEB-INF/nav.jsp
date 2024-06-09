<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% final String APP_URL = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<style type="text/css">
			ul {
            list-style-type: none; 
            padding: 0; 
            margin-top: 10px;
            margin-left : 5px;
        	}

        	li {
            	display: inline-block;
            	margin-right: 5px;
        	}
        	.my-btn{
        		min-height : 35px;
        		background-color : #4CAF50;
        		color : white;
        		border : 0px;
        		cursor : pointer;
        	}
		</style>
	</head>
	<body>
		<ul style="margin-left:20px">
			<li><a href="<%= APP_URL %>"><button class="my-btn">Accueil</button></a></li>
			<li><a href="<%= APP_URL %>/users/add"><button class="my-btn">Ajouter un utilisateur</button></a></li>
		</ul>
	</body>
</html>