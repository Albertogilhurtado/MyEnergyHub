<%-- 
    Document   : home
    Created on : 11 nov 2023, 18:01:21
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>My Energy Hub</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
    <body class="is-preload">
        <% 
            if(session.getAttribute("login")==null || !session.getAttribute("login").equals("Logged")){
                    response.sendRedirect("login.jsp");
            }
        %>
       <div id="wrapper"> 
            <header id="header">
                <a href="home.jsp" class="logo">MY <strong>ENERGY</strong>  HUB</a>
                <nav>
                        <a href="#menu">Menu</a>
                </nav>
            </header>
            <nav id="menu">
                <ul class="links">
                    <li><a href="home.jsp">Inicio</a></li>
                    <li><a href="calculadoraAhorro.jsp">Calculadora</a></li>
                    <li><a href="perfil.jsp">Mi perfil</a></li>
                    <li><a href="login.jsp" class="button primary fit">Cerrar sesión</a></li>
                </ul>
            </nav>

				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>Bienvenido a My Energy Hub</h1>
							</header>
							<div class="content">
								<p>Aqui podras calcular como esta funcionando tu instalación electrica<br />
								o comprobar si una te puede salir rentable</p>

							</div>
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3>Como calculamos el ahorro</h3>
										<p>Obtenemos todos los datos de consumo y ahorro de nuestros clientes para desarrollar 
                                                                                    una media orientativa.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3>Como saber si te sale rentable</h3>
										<p>En nuestro caso nosotros vemos mas importante el ahorro y el dinero que te cuestan,
                                                                                por tanto no nos orientamos por lo que genera cada panel si no que calculamos cuando
                                                                                ahorro aporta cada panel segun su valor.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3>Datos de referencia iniciales</h3>
										<p>Los datos de ahorro se han obtenido con una tarifa recomendada para todos con 
                                                                                sistema de bateria virtual y con los paneles en orientacion sur o este/oeste, en caso de
                                                                                que tu ahorro no se vea ajustado al que mostramos en los calculos puede ser debido a que
                                                                                tu tarifa no sea optima, que estes realizando sobre consumo, que algun panel no este funcionando
                                                                                adecuadamente o diversos factores variables los cuales no son controlables.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3>Proteccion de datos</h3>
										<p>Los datos no se tratan de forma personal en ningun momento, solo se utilizaran de forma masiva para
                                                                                realizar calculos los cuales beneficiaran a toda la comunidad.</p>
									</header>
								</article>
							</section>

						<!-- Two -->
							<section id="two">
								<div class="inner">
									<header class="major">
										<h2>Comienza a calcular</h2>
									</header>
									<p>Empieza a realizar tus calculos y veras como la autosuficiencia esta cada vez mas cerca</p>
									<ul class="actions">
                                                                            <li><a href="calculadoraAhorro.jsp" class="button next">Calculadora</a></li>
									</ul>
								</div>
							</section>

					</div>
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="https://github.com/Albertogilhurtado/MyEnergyHub" class="icon brands alt fa-github" target="_blank" rel="noopener noreferrer"><span class="label">GitHub</span></a></li>
								<li><a href="https://www.linkedin.com/in/alberto-gil-hurtado-b9b241238/" class="icon brands alt fa-linkedin-in" target="_blank" rel="noopener noreferrer"><span class="label">LinkedIn</span></a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>