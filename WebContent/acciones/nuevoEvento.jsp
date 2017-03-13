<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="0; url=../index.jsp">
<title>procesando evento</title>
</head>
<body>
	<%
		out.println("El año recodigo es "+request.getParameter("anio"));
		out.println("El mes recodigo es "+request.getParameter("mes"));
		out.println("El dia recodigo es "+request.getParameter("dia"));
		out.println("El calendario recodigo es "+request.getParameter("calendario"));
		out.println("La hora de inicio recogido es "+request.getParameter("hora"));
		out.println("El minuto de inicio recogido es"+request.getParameter("anio"));
		out.println("La duracion es"+request.getParameter("duracion"));
		out.println("El nombre del evento es "+request.getParameter("nombre"));
		
	%>
	<%
		try {
			String conexion = "jdbc:mysql://localhost:3306/webcalendario";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(conexion, "usercalendar", "calendario");

			Statement stmt = connection.createStatement();
			stmt.executeUpdate("INSERT INTO eventos VALUES (NULL,"+request.getParameter("calendario")+",'"+request.getParameter("nombre")+"',"+request.getParameter("anio")+","+request.getParameter("mes")+","+request.getParameter("dia")+","+request.getParameter("hora")+","+request.getParameter("minuto")+",0,"+request.getParameter("duracion")+")");
			stmt.close();
			connection.close();

		} catch (Exception ex) {
			out.println("Ha ocurrido el siguiente error: " + ex.getMessage().toString());
		}
	%>
	
</body>
</html>