<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="0; url=../index.jsp">
<title>Insert title here</title>
</head>
<body>
<%
		try {
			String conexion = "jdbc:mysql://localhost:3306/webcalendario";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(conexion, "usercalendar", "calendario");

			Statement stmt = connection.createStatement();
			stmt.executeUpdate("DELETE FROM calendarios WHERE idcalendario="+request.getParameter("idcalendario")+"");
			stmt.executeUpdate("DELETE FROM eventos WHERE calendario="+request.getParameter("idcalendario")+"");
			
			stmt.close();
			connection.close();

		} catch (Exception ex) {
			out.println("Ha ocurrido el siguiente error: " + ex.getMessage().toString());
		}
	%>
</body>
</html>