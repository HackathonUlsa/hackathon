
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>

    <title>Hey taxi | Detalle</title>
</head>

<body>

<form class="form-horizontal form-label-left" method="POST" novalidate>


    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nombre
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="nombre" class="form-control col-md-7 col-xs-12" readonly name="nombre" value="${sitio.nombre}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Dirección
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoPaterno" class="form-control col-md-7 col-xs-12" readonly name="direccion" value="${sitio.direccion}" required="required" type="text">
        </div>
    </div>
    <div class="ln_solid"></div>
    <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
            <a class="btn btn-success" href="${createLink(controller:"sitio" , action: "edit",id: sitio.id)}">Editar</a>
        </div>
    </div>

</form>
</body>
</html>