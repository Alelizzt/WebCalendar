<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>introduce tu usuario</h1>
	<form method="POST" action=acciones/hazlogin.jsp>
		<input type="text" name="usuario"><br>
		<input type="text" name="password"><br>
		<input type="submit">
	</form>
	
	<h1>Nuevo usuario</h1>
	<form method="POST" action=acciones/nuevologin.jsp>
		<input type="text" name="usuario" placeholder="nombre de usuario"><br>
		<input type="text" name="password"><br>
		<input type="text" name="nombre" placeholder="digite su nombre"><br>
		<input type="text" name="apellidos" placeholder="digite su apellido"><br>
		<input type="text" name="email" placeholder="digite su emali"><br>
		<input type="submit">
	</form>
</body>
</html>