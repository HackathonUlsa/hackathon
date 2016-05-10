<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 9/05/16
  Time: 10:41 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>

<body>
<form class="form-horizontal form-label-left" method="POST" novalidate>


    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nombre <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="nombre" class="form-control col-md-7 col-xs-12" name="nombre" placeholder="Nombre" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Paterno <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoPaterno" class="form-control col-md-7 col-xs-12" name="apellidoPaterno" placeholder="Apellido paterno" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Materno <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoMaterno" class="form-control col-md-7 col-xs-12" name="apellidoMaterno" placeholder="Apellido materno" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sexo <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="sexo" class="form-control col-md-7 col-xs-12"  name="sexo" placeholder="Sexo" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Numero licencia <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="licencia" class="form-control col-md-7 col-xs-12"  name="licencia" placeholder="Numero licencia" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha de nacimiento <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="fecha" class="form-control col-md-7 col-xs-12"  name="fecha" placeholder="Fecha Nacimiento" required="required" type="date">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Usuario <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="usuario" class="form-control col-md-7 col-xs-12" name="usuario" placeholder="Usuario@ulsa.com" required="required" type="email">
        </div>
    </div>

    <div class="item form-group">
        <label for="password" class="control-label col-md-3">Contraseña <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="password" type="password" name="password" class="form-control col-md-7 col-xs-12" required="required">
        </div>
    </div>

    <div class="item form-group">
        <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Repetir contraseña <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
        </div>
    </div>

    <div class="ln_solid"></div>
    <div class="item form-group">
        <div class="col-md-6 col-md-offset-3">
            <a class="btn btn-primary" href="${createLink(controller:"chofer" , action: "inicio")}">Cancelar</a>
            <input type="submit" class="btn btn-success" formaction="${createLink(controller:"chofer" , action: "agregar")}" value="Guardar">
        </div>
    </div>

</form>

</body>
</html>