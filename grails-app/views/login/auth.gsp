<html>
<head>
	<meta name='layout' content='login'/>
	<title>Hey Taxi! | Login</title>
</head>

<body>
<div id='login'>
	<div class=''>

		<g:if test='${flash.message}'>
			<div class='login_message'>Usuario o contraseña incorrectas</div>
		</g:if>
		<div>

			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<h1>Bienvenido</h1>
				<div>
					<input type="text" class="form-control" name='j_username' id='username' placeholder="Usuario" required="" />
				</div>
				<div>
					<input type="password" class="form-control" name='j_password' id='password' placeholder="Contraseña" required="" />
				</div>
				<div>
					<input type="submit" class="btn btn-default submit" id="submit" value='${message(code: "springSecurity.login.button")}'></input>

				</div>

			</form>
		</div>


	</div>
	<div class="separator">

		<h2><i class="" style="font-size: 26px;"></i> ULSA OAXACA IS - OAXACOS</h2>

	</div>
</div>
</body>
</html>
