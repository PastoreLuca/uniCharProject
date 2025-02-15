
<%
String nome = (String) session.getAttribute("name");

if(nome == null){
	response.sendRedirect("index.jsp");
	return;
}


String message = "Benvenuto/a "+nome;
%>







<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/areaAdmin-style.css">
    <title>Area Admin</title>
</head>
<body>

    <%@ include file="navbar.html" %>

	<div class="page">
    <h2 class="welcome"><%=message %></h2>
	<h3 class="operations">Scegli le operazioni che vuoi effettuare</h3>
    <div class="cards">
	
		<a href="UserInvoiceControl">
			<div class="card">
				<ion-icon class="iconFunction" name="ribbon-outline" size="large"></ion-icon><p>Gestione Donazioni</p>
			</div>
		</a>
		
	
		<a href="OrderControl">
			<div class="card">
				<ion-icon class="iconFunction" name="documents-outline" size="large"></ion-icon><p>Gestione Ordini</p>
			</div>
		</a>
		
		<a href="product?action=catalog&returnto=gestioneCatalogoAdmin.jsp">
			<div class="card">
				<ion-icon class="iconFunction" name="grid-outline" size="large"></ion-icon><p>Gestione Catalogo</p>
			</div>
		</a>
	</div>

	<div class="cards">
		<a href="connection?action=users&returnto=gestioneUtenteAdmin.jsp">
			<div class="card">
				<ion-icon class="iconFunction" name="people-outline" size="large"></ion-icon><p>Gestione Utenti</p>
			</div>
		</a>
		
		<a href="connection?action=user&returnto=OpzioniAccount.jsp">
			<div class="card">
				<ion-icon class="iconFunction" name="cog-outline" size="large"></ion-icon><p>Impostazioni Account</p>
			</div>
		</a>
		
		<a href="connection?action=logout&returnto=index.jsp">
			<div class="cardLogout">
				<ion-icon class="iconFunction" name="log-out-outline" size="large"></ion-icon><p>Esci</p>
			</div>
		</a>
	
	
	</div>
	
	<div class="content"></div>
	<div class="content"></div>
	<div class="content"></div>

	
	
</div>
	
	

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>