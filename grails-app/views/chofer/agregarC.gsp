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
    <g:javascript src="validator.js"></g:javascript>

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

<g:javascript>
    // initialize the validator function
    validator.message['date'] = 'not a real date';

    // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
    $('form')
            .on('blur', 'input[required], input.optional, select.required', validator.checkField)
            .on('change', 'select.required', validator.checkField)
            .on('keypress', 'input[required][pattern]', validator.keypress);

    $('.multi.required')
            .on('keyup blur', 'input', function () {
                validator.checkField.apply($(this).siblings().last()[0]);
            });

    // bind the validation to the form submit event
    //$('#send').click('submit');//.prop('disabled', true);

    $('form').submit(function (e) {
        e.preventDefault();
        var submit = true;
        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
            submit = false;
        }

        if (submit)
            this.submit();
        return false;
    });

    /* FOR DEMO ONLY */
    $('#vfields').change(function () {
        $('form').toggleClass('mode2');
    }).prop('checked', false);

    $('#alerts').change(function () {
        validator.defaults.alerts = (this.checked) ? false : true;
        if (this.checked)
            $('form .alert').remove();
    }).prop('checked', false);
</g:javascript>

</body>
</html>