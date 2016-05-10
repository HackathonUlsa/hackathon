<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 9/05/16
  Time: 11:17 PM
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
            <input id="nombre" class="form-control col-md-7 col-xs-12" name="nombre" value="${sitio.nombre}" required="required" type="text">
        </div>
    </div>

    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Dirección <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="apelidoPaterno" class="form-control col-md-7 col-xs-12" name="direccion" value="${sitio.direccion}" required="required" type="text">
        </div>
    </div>
    <div class="ln_solid"></div>
    <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
            <a class="btn btn-primary" href="${createLink(controller:"sitio" , action: "show",id: sitio.id)}">Cancelar</a>
            <input type="submit" class="btn btn-success" formaction="${createLink(controller:"sitio" ,
                    action: "update",id: sitio.id)}" value="Guardar">
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