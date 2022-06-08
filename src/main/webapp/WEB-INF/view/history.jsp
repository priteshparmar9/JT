<%@page import="Entity_classes.history"%>
<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order History | BookBob</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<!-- Tailwind CSS Build -->
<script src="https://cdn.tailwindcss.com"></script>
<style>
* {
	font-family: 'Fredoka', cursive;
}
</style>
</head>
<body class="lg:screen grid place-items-center bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">
	<%
		if(!session.getAttribute("email").equals("priteshparmar19273@gmail.com")){
			response.sendRedirect("index");
		}
	%>
	
	<!-- Logo -->
	<a class="my-4" href="/jt">
		<div class="text-sky-500/75 flex justify-center items-center pointer-events-none select-none">
		  <div class="h-20 flex flex-col justify-center items-center border-black rounded-full">
		  	<span class="text-3xl -my-3 bi bi-sunglasses"></span>
		    <span class="text-4xl bi bi-bookmark-dash-fill"></span>
		  </div>
		  <h1 class="text-2xl font-medium ml-1">BookBob</h1>
		</div>
	</a>
	
	<section class="mb-4">
		<div class="rounded-lg bg-gray-800 flex flex-col justify-center items-center p-6 mb-4">
			<h1 class="text-2xl mb-6">Order History</h1>

	
	<table border="1">
		<tr class="uppercase">
			<th>Email</th>
			<th>Bill Id</th>
			<th>Title</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Date</th>
		</tr>
		<%
		
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.history.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session ses = sf.openSession();
		
		ses.getTransaction().begin();	
		Query query = ses.createQuery("from history");
		List<history> results = query.list();
		for(history h:results){
			%>
			<tr>
			<td class="p-2"><%= h.getEmail() %></td>
			<td class="p-2"><%= h.getBill_id() %></td>
			<td class="p-2"><%= h.getTitle() %></td>
			<td class="p-2"><%= h.getQuantity() %></td>
			<td class="p-2"><%= String.format( "%.2f", (double)h.getAmount()) %></td>
			<td class="p-2"><%= h.getDate() %></td>
			</tr>
			<%		
		}
		
		%>
	</table>
	</div>
</section>

</body>
</html>