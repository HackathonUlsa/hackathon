<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 18/02/16
  Time: 06:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Hey Taxi! | Perfil</title>
    <g:javascript src="validator.js"></g:javascript>
</head>

<body>

<form class="form-horizontal form-label-left" novalidate>

    <span class="section">Perfil</span>

    <g:if test="${flash.message}">
        <div class="alert alert-info" style="display: block;text-align: center;">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${flash.message}
        </div>
    </g:if>

    <g:if test="${flash.error}">
        <div class="alert alert-danger">
            ${flash.error}

        </div>
    </g:if>


    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12"></span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="idd" class="form-control col-md-7 col-xs-12" name="idd" type="hidden" value="<sec:loggedInUserInfo field="id"/>">
        </div>
    </div>


    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Usuario</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="usuario" class="form-control col-md-7 col-xs-12" name="usuario" placeholder="" required="required" type="text" value="<sec:loggedInUserInfo field="username"/>" disabled>
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
    <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
            <button id="reset" type="reset" class="btn btn-primary">Cancelar</button>
            <button formaction="${createLink(controller: 'Sitio', action: 'actualizarPerfil')}" id="send" type="submit" class="btn btn-success">Aceptar</button>
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

    $('#reset').click(function(){
       console.log("entro a reset")
       $(location).attr("href", "${createLink(controller: 'historial', action: 'inicio')}");
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