<%@page import="com.skit.web.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<h1>Employees List</h1>
	<%
		List<Employee> employees = (List<Employee>)request.getAttribute("employees");
		for(Employee emp: employees){
			out.print("Id: "+emp.getId());
			out.print("Name: "+emp.getName());
			out.print("Salary: "+emp.getSalary());
			out.print("Designation: "+emp.getDesignation());
		}
	%>
	
	<c:forEach items="${employees}" var="emp">
		<span><c:out value="${emp.id}" /></span>
		<span><c:out value="${emp.name}" /></span>
		<span><c:out value="${emp.salary}" /></span>
		<span><c:out value="${emp.designation}" /></span>
	</c:forEach>
	<table border="2" width="70%" cellpadding="2">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Salary</th>
			<th>Designation</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		
		<c:forEach var="emp" items="${employees}">
			<tr>
				<td><c:out value="${emp.id}" /></td>
				<td><c:out value="${emp.name}" /></td>
				<td><c:out value="${emp.salary}" /></td>
				<td><c:out value="${emp.designation}" /></td>
				
			</tr>
		</c:forEach>
		
	</table>
	<br />
	<a href="empform">Add New Employee</a>
</body>
</html>