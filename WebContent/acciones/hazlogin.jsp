<%@page import="sun.net.smtp.SmtpClient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String usuario =request.getParameter("usuario");
		String password = request.getParameter("password");
		int logeado =0;
		try {
			String conexion = "jdbc:mysql://localhost:3306/webcalendario";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(conexion, "usercalendar", "calendario");

			Statement stmt = connection.createStatement();
			ResultSet rset;
			
			String peticion = "SELECT * from usuarios WHERE usuario='"+usuario+"' AND contrasena='"+password+"'";
			rset=stmt.executeQuery(peticion);
			while(rset.next()){
				logeado=1;
				session.setAttribute("idusuario", rset.getInt("idusuario"));
			}
			if(logeado==1){
				session.setAttribute("usuario", usuario);
				out.println("<meta http-equiv='refresh' content='0; url=../index.jsp'>");
			}
			else{
				out.println("<meta http-equiv='refresh' content='0; url=../login.jsp'>");
			}
			
			stmt.close();
			connection.close();

		} catch (Exception ex) {
			out.println("Ha ocurrido el siguiente error: " + ex.getMessage().toString());
		}
	%>
</body>
</html>