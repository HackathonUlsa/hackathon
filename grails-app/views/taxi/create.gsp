

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
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Chofer <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <g:select name="chofer" from="${choferes}" class="form-control"
                      optionValue="${{ chofer -> "${chofer.usuario.persona.nombre}" }}"
                      optionKey="id">

            </g:select>
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Número de taxi <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="numero" class="form-control col-md-7 col-xs-12" name="numero" placeholder="Número de taxi" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Número de placas <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="numPlaca" class="form-control col-md-7 col-xs-12" name="numPlaca" placeholder="Número Placa" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Número de Permiso <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="numPermiso" class="form-control col-md-7 col-xs-12"  name="numPermiso" placeholder="Número de Permiso" required="required" type="text">
        </div>
    </div>

    <div class="ln_solid"></div>
    <div class="item form-group">
        <div class="col-md-6 col-md-offset-3">
            <a class="btn btn-primary" href="${createLink(controller:"taxi" , action: "obtenerTaxis")}">Cancelar</a>
            <input type="submit" class="btn btn-success" formaction="${createLink(controller:"taxi" , action: "agregarTaxi")}" value="Guardar">
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