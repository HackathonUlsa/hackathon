
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Hey Taxi! | Dashboard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'LaSalle.png')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'fonts/css', file: 'font-awesome.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'green.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}" type="text/css">
	<g:javascript src="jquery-1.11.3.min.js"/>
	<g:javascript src="jquery-ui.js"></g:javascript>
	<g:javascript src="bootstrap.min.js"></g:javascript>
	<g:javascript src="bootbox.min.js"></g:javascript>
	<g:javascript src="jsapi.js"/>
	<g:javascript src="jquery.dataTables.min.js"/>
	<g:javascript src="offcanvas.js"/>
	<g:javascript src="bootstrap-filestyle.min.js"/>
	<g:javascript src="application.js"></g:javascript>
	<g:javascript>
		$('.alert').fadeToggle(5000);
	</g:javascript>

	<g:layoutHead/>
	<r:layoutResources />
</head>
<body class="nav-md">

<div class="container body">


	<div class="main_container">

		<div class="col-md-3 left_col">
			<div class="left_col scroll-view">

				<div class="navbar nav_title" style="border: 0;">
					<a href="${createLink(controller: 'cuestionario', action: 'index')}" class="site_title"><i class="fa fa-taxi"></i><span> Hey Taxi!</span></a>
				</div>
				<div class="clearfix"></div>

				<!-- menu prile quick info -->
				<div class="profile">
					<div class="profile_pic">
						<img src="${resource(dir: 'images', file: 'profile.png')}" alt="..." class="img-circle profile_img">
					</div>
					<div class="profile_info">
						<span>Bienvenido,</span>
						<h2><sec:loggedInUserInfo field="username"/></h2>
					</div>
				</div>
				<!-- /menu prile quick info -->

				<br/>

				<!-- sidebar menu -->
				<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

					<div class="menu_section">
						<h3>General</h3>
						<ul class="nav side-menu">
							<li class="inicio"><a href="${createLink(controller: 'historial', action: 'inicio')}"><i class="fa fa-home"></i> Inicio </a>
							</li>
						</ul>
						<ul class="nav side-menu">
							<li><a><i class="fa fa-archive"></i> Administrar <span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" style="display: none">
									<li><a href="${createLink(controller: 'chofer',action: 'inicio')}">Choferes</a>
									</li>
									<li><a href="${createLink(controller: 'taxi',action: 'obtenerTaxis')}">Taxis</a>
									</li>
									<li><a href="${createLink(controller: 'sitio',action: 'list')}">Sitios</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>

				</div>
				<!-- /sidebar menu -->
			</div>
		</div>

		<!-- top navigation -->
		<div class="top_nav">

			<div class="nav_menu">
				<nav class="" role="navigation">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>

					<ul class="nav navbar-nav navbar-right">
						<li class="clickAbrir">
							<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<img src="${resource(dir: 'images', file: 'profile.png')}" alt=""><sec:loggedInUserInfo field="username"/>
								<span class=" fa fa-angle-down"></span>
							</a>
							<ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
								<li><a href="${createLink(controller: 'sitio', action: 'perfil')}"><i class="fa fa-user pull-right"></i>Perfil</a>
								</li>
								<li><a href="${createLink(controller: 'logout', action: 'index')}"><i class="fa fa-sign-out pull-right"></i> Cerrar Sesión</a>
								</li>
							</ul>
						</li>

					</ul>
				</nav>
			</div>

		</div>
		<!--Page content-->
		<div class="right_col" role="main">

			<g:layoutBody/>

		</div>
		<g:javascript src="custom.js"></g:javascript>
		<r:layoutResources />

</body>
</html>
