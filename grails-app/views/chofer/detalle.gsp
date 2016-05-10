<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 9/05/16
  Time: 10:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>

    <title>Hey taxi | Detalle</title>
</head>

<body>

<form class="form-horizontal form-label-left" method="POST" novalidate>


    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nombre <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="nombre" class="form-control col-md-7 col-xs-12" readonly name="nombre" value="${choferes.usuario.persona.nombre}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Paterno <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoPaterno" class="form-control col-md-7 col-xs-12" readonly name="apellidoPaterno" value="${choferes.usuario.persona.apPaterno}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Materno <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoMaterno" class="form-control col-md-7 col-xs-12" readonly name="apellidoMaterno" value="${choferes.usuario.persona.apMaterno}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sexo <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="sexo" class="form-control col-md-7 col-xs-12"  readonly name="sexo" value="${choferes.usuario.persona.sexo}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Numero licencia <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="licencia" class="form-control col-md-7 col-xs-12" readonly name="licencia" value="${choferes.numLicencia}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha de nacimiento <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="fecha" class="form-control col-md-7 col-xs-12" readonly name="fecha" value="${choferes.usuario.persona.fechaNacimiento}" required="required" type="date">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Usuario <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="usuario" class="form-control col-md-7 col-xs-12" readonly name="usuario" value="${choferes.usuario.username}" required="required" type="email">
        </div>
    </div>


    <div class="ln_solid"></div>
    <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
            <a class="btn btn-success" href="${createLink(controller:"chofer" , action: "editarC",id: choferes.id)}">Editar</a>
        </div>
    </div>

</form>
</body>
</html>