<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true" %>
<%
	if(request.getParameter("variable") != null)
		session.setAttribute(request.getParameter("variable"), request.getParameter("valor"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Probador de sesi&oacute;n</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>Informaci&oacute;n de sesi&oacute;n</th>
			</tr>
			<tr>
				<th>
					Propiedad
				</th>
				<th>
					Valor
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>ID</td>
				<td><%= session.getId() %> </td>
			</tr>
			<tr>
				<td>Fecha de creaci&oacute;n</td>
				<td><%= new Date(session.getCreationTime()) %> </td>
			</tr>
			<tr>
				<td>Fecha de &uacute;ltimo acceso</td>
				<td><%= new Date(session.getLastAccessedTime()) %> </td>
			</tr>
		</tbody>
	</table>
	<h3>Host: <%= java.net.InetAddress.getLocalHost().getHostName() %></h3>
	<form action="./" method="post">
		<h5>Atributo:</h5><input type="text" name="variable" /> <h5>Valor:</h5><input type="text" name="valor" /> <input type="submit" name="Agregar" value="Agregar" />
	</form>
	<table>
		<thead>
			<tr>
				<th>Atributos de sesi&oacute;n</th>
			</tr>
			<tr>
				<th>
					Atributo
				</th>
				<th>
					Valor
				</th>
			</tr>
		</thead>
		<tbody>
			<% 
				Enumeration atributos = session.getAttributeNames();
				String atributo;
				for(; atributos.hasMoreElements() ;){ 
					atributo = (String)atributos.nextElement();%>
				
				<tr>
					<td><%= atributo %></td>
					<td><%= session.getAttribute(atributo) %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>