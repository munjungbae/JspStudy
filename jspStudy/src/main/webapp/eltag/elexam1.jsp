<%@page import="java.util.HashMap"%>
<%@page import="co.kh.dev.actiontag.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Customer customer = new Customer();
	customer.setName("MJB");
	customer.setEmail("ster12390@naver.com");
	customer.setPhone("010-2222-2233");
	
	request.setAttribute("customer", customer);
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "MJB");
	map.put("email", "ster12390@naver.com");
	map.put("phone", "010-2222-2233");
	request.setAttribute("map", map);
	
	Customer ct = (Customer)request.getAttribute("customer");
	HashMap<String, String> map2 = (HashMap<String, String>) request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Example</title>
</head>
<body>
	<ul>
			<li><%= ct.getName()%></li>
			<li><%= ct.getEmail()%></li>
			<li><%= ct.getPhone()%></li>
	</ul>
	<ul>
			<li>${customer.name}</li>
			<li>${customer.email}</li>
			<li>${customer.phone}</li>
	</ul>
	<ul>
			<li><%= map2.get("name")%></li>
			<li><%= map2.get("email")%></li>
			<li><%= map2.get("phone")%></li>
	</ul>
	<ul>
			<li>${map.name}</li>
			<li>${map.email}</li>
			<li>${map.phone}</li>
	</ul>
	<ul>
			<li>${map.["name"]}</li>
			<li>${map.["email"]}</li>
			<li>${map.["Phone"]}</li>
	</ul>
</body>
</html>