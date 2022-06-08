<!DOCTYPE html>
<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<html land="en" dir="ltr">
<head>
    <meta charset="UTF-8">
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
	   
	<title>WELCOME TO OUR SHOP</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {font-family: 'Fredoka', cursive;}
</style>

<!-- Tailwind CSS Build -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">

<header class="fixed w-full bg-[#0e263d] z-50 drop-shdaow-lg flex justify-between px-4 text-sky-500">

	<!-- Logo -->
	<a href="/jt">
		<div class="text-sky-500/75 flex justify-center items-center pointer-events-none select-none">
		  <div class="h-20 flex flex-col justify-center items-center border-black rounded-full">
		  	<span class="text-3xl -my-3 bi bi-sunglasses"></span>
		    <span class="text-4xl bi bi-bookmark-dash-fill"></span>
		  </div>
		  <h1 class="text-2xl font-medium ml-1">BookBob</h1>
		</div>
	</a>

	<!-- NavBar -->
	<nav class="flex justify-between items-center gap-2">
		
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_article">Articles</a>
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_magazine">Magazines</a>
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_novel">Novels</a>
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_cart">
		Cart <span class="bg-sky-800 text-sm rounded-full font-normal p-1 px-2 text-white"><%
			Configuration con1 = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
			SessionFactory sf1 = con1.buildSessionFactory();

			Session ses1 = sf1.openSession();

			ses1.getTransaction().begin();
			Query query1 = ses1.createQuery("from cart WHERE email = :email");
			query1.setParameter("email", session.getAttribute("email"));
			List<cart> results1 = query1.list();
			out.print(results1.size());
			%></span>
		</a>
		
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500" href="contact">Contact Us</a>
		
		<span class="text-2xl bg-sky-400/20 m-2 p-[.5px] h-1/2 rounded-full"></span>
		
		<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
			<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full flex justify-center items-center gap-1 hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="admin_page" aria-label="Admin Panel" title="Admin Panel">
			<span class="text-lg bi bi-person-workspace"></span></a>
		<% } %>

		<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75 flex justify-center items-center gap-1" href="edit" aria-label="Edit profile" title="Go to profile">
  	<span class="text-lg bi bi-person-fill"></span></a>
  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-red-500 hover:text-red-500 active:bg-red-500 active:text-white/75 flex justify-center items-center gap-1" href="logout" aria-label="Logout" title="logout">
  	<span class="text-lg bi bi-box-arrow-right"></span></a>
	</nav>

</header>

<main class="pt-24">

 <section class="contact">
   <h2 class="text-3xl text-center text-sky-500 font-medium tracking-wide mb-6">Contact Us</h2>
   
   <div class ="my-4 flex flex-col lg:flex-row justify-evenly items-center">
	   <div class="flex flex-col gap-6 mb-6 lg:mb-0">
		   <div class="flex justify-start items-start gap-2">
		       <div class="w-[48px] h-[48px] p-4 bg-slate-700 text-sky-500 rounded-full flex justify-center items-center">
		       	<span class="bi bi-geo-alt-fill"></span>
		       </div>
		       <div class="p-2">
		           <h3 class="text-2xl font-medium">Address</h3>
		           <address class="text-lg">A-704<br/>Swastik Highlands, Rajkot<br/>Gujarat, 360007</address>
		       </div>
		   </div>
		
		   <div class="flex justify-start items-start gap-2">
		       <div class="w-[48px] h-[48px] p-4 bg-slate-700 text-sky-500 rounded-full flex justify-center items-center"><span class="bi bi-telephone-fill"></span></div>
		       <div class="p-2">
		           <h3 class="text-2xl font-medium">Phone</h3>
		           <p class="text-lg">
		           <a class="block" href="tel:+919428349690">+91 94283 49690</a>
		           <a class="block" href="tel:+919227590139">+91 92275 90139</a>
		           <a class="block" href="tel:+919726562484">+91 97265 62484</a>
		       </div>
		   </div>
		   
		   <div class="flex justify-start items-start gap-2">
	       <div class="w-[48px] h-[48px] p-4 bg-slate-700 text-sky-500 rounded-full flex justify-center items-center">
	       	<span class="bi bi-envelope-fill"></span>

	       </div>
	       <div class="p-2">
	           <h3 class="text-2xl font-medium">Email</h3>
	           <a class="text-lg" href="mailto:booksbob@gmail.com">booksbob@gmail.com</a>
	       </div>
		   </div>
	   </div>

       <div class="bg-slate-800 rounded-lg p-6 w-96">
          <h2 class="text-sky-500 text-2xl font-medium mb-12 text-center">Contact us</h2>
       		<form action="#" method="POST" class="flex flex-col gap-8">
            <div class="relative w-full">
                <input class="input-box peer p-2 w-full bg-transparent border-b border-b-2 border-sky-500 outline-none"
                type="text" id="contactName" name="name" required>
                <label for="contactName"
                class="peer-focus:-translate-y-6 transition-all text-sm p-2 absolute top-0 text-sky-500 left-0">
                Full Name</label>
            </div>
            
            <div class="relative w-full">
                <input class="input-box peer p-2 w-full bg-transparent border-b border-b-2 border-sky-500 outline-none"
                type="email" name="email" id="email" required="required">
                <label for="email"
                class="peer-focus:-translate-y-6 transition-all text-sm p-2 absolute top-0 text-sky-500 left-0">
                Email</label>
            </div>
            
            <div class="relative w-full">
                <textarea class="input-box peer p-2 w-full bg-transparent border-b border-b-2 border-sky-500 outline-none"
                 name="message" id="message" required="required"></textarea>
                <label for="message"
                class="peer-focus:-translate-y-6 transition-all text-sm p-2 absolute top-0 text-sky-500 left-0">
                Type your message...</label>
            </div>
            <div class="flex justify-center">
                <input class="text-xl p-2 px-4 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent" type="submit" name="submit" value="Send">
            </div>
           </form>
       </div>
   
   </div>
  </section>
  <br>
  <br>
   	<div class="">
		<h2 class="text-3xl text-center font-medium tracking-wide">Our Team</h2>
	<br>
	<section class="w-full grid grid-cols-3 mb-12">
		<div class="p-5 flex flex-col items-center justify-center">
			<img src="https://cdn.codechef.com/sites/default/files/uploads/pictures/6e2bd5ffb8b2931e20a3c8402d84d808.jpg" class="h-28 w-28 rounded-full text-xl outline outline-1 outline-sky-500">
			<p class="text-lg">Pritesh Parmar</p>
			<div class="my-2 flex justify-evenly items-center gap-3">
				<a class="bi bi-github text-xl" href="" target="https://github.com/priteshparmar9"></a>
				<a class="bi bi-linkedin text-xl" href="https://www.linkedin.com/in/pritesh-parmar-436574203" target="_blank"></a>
				<a class="bi bi-instagram text-xl" href="https://www.instagram.com/pritesh._.19/" target=_blank></a>
			</div>
		</div>
		
		<div class="p-5 flex flex-col items-center justify-center">
			<img src="https://media-exp1.licdn.com/dms/image/C4E03AQF6HHp-i3fELw/profile-displayphoto-shrink_200_200/0/1611909145523?e=1654128000&v=beta&t=l40dLVHx3yyyAIAR2O95vn6GdvdQJ-Qqmyq2SHIJr9w" class="h-28 w-28 rounded-full text-xl outline outline-1 outline-sky-500">
			<p class="text-lg">Parshwa Mehta</p>
			<div class="my-2 flex justify-evenly items-center gap-3">
				<a class="bi bi-github text-xl" href="https://github.com/PARSHWA0510" target=_blank></a>
				<a class="bi bi-linkedin text-xl" href="https://www.linkedin.com/in/parshwa-mehta-949306205" target="_blank"></a>
				<a class="bi bi-instagram text-xl" href="https://www.instagram.com/parshwa_0510/" target=_blank></a>
			</div>
		</div>
	
		<div class="p-5 flex flex-col items-center justify-center">
			<img src="https://avatars.githubusercontent.com/u/25756259?v=4" class="h-28 w-28 rounded-full text-xl outline outline-1 outline-sky-500">
			<p class="text-lg">Deepak Parmar</p>
			<div class="my-2 flex justify-evenly items-center gap-3">
				<a class="bi bi-linkedin text-xl" href="https://www.linkedin.com/in/deepak-prmr/" target="_blank"></a>
				<a class="bi bi-github text-xl" href="https://github.com/deepak-parmar/" target="_blank"></a>
			</div>
		</div>
	</section>
	</div>
        
</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(() => {
	$("input[type='text'], input[type='email'], textarea").keyup(function() {
		$(this).val() != ''
			? $(this).siblings("label").addClass("-translate-y-6")
			: $(this).siblings("label").removeClass("-translate-y-6")
	})
})
</script>
    </body>
    </html>