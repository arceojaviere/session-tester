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
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
    	<link href="resources/css/bootstrap-theme.min.css" rel="stylesheet" />
    	<link href="resources/css/theme.css" rel="stylesheet" />
		<title>Probador de sesi&oacute;n</title>
	</head>
	<body>
		<div class="container" role="main">
			<div class="panel panel-opcionales">
				<h4>PRUEBA DE REPLICACI&Oacute;N</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<th><h4>Informaci&oacute;n de sesi&oacute;n</h4></th>
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
				
				<h4>Host: <span class="host"><%= java.net.InetAddress.getLocalHost().getHostName() %></span></h4>
			</div>
			<div class="panel panel-opcionales">
				<h4>Agregar Atributos de sesi&oacute;n</h4>
				<form action="./" method="post">
					<div class="panel-body">
						<div class="contenedor-input"><h5>Atributo:</h5><input type="text" name="variable" class="form-control"/></div>
						<div class="contenedor-input"><h5>Valor:</h5><input type="text" name="valor" class="form-control"/></div>
						<div class="contenedor-input"><input type="submit" name="Agregar" value="Agregar" /></div>
					</div>
				</form>
			</div>
			<div class="panel panel-opcionales">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><h4>Atributos de sesi&oacute;n</h4></th>
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
			</div>
		</div>
	</body>
</html>