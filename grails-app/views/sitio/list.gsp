<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 9/05/16
  Time: 11:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Hey Taxi | Agregar chofer</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dataTables.tableTools.css')}" type="text/css">

    <g:javascript src="validator.js"></g:javascript>
    <g:javascript src="jquery.dataTables.js"></g:javascript>
    <g:javascript src="dataTables.tableTools.js"></g:javascript>

    <g:javascript>

        function showModal() {
            $("#myModal").modal('toggle');
        }

        function dismissModal() {
            $("#myModal").modal('toggle');
            location.reload();
        }


    </g:javascript>



</head>

<body>

<div class="col-md-3">

    <a class="btn btn-primary" href="${createLink(controller:"sitio" , action: "create")}">Agregar Sitio</a>

</div>

<div class="x_content">
    <table id="example" class="table table-striped responsive-utilities jambo_table">
        <thead>
        <tr class="headings">

            <th>Nombre</th>
            <th>Direccion</th>

            <th class=" no-link last">Acción</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${sitios}" var="sitio">
            <tr class="even pointer">
                <td >${sitio.nombre}</td>
                <td>${sitio.direccion}</td>
                <td><a class="btn btn-success" href="${createLink(controller:"sitio" , action: "show",id: sitio.id)}">Detalle</a>
                    <input class="btn btn-danger" type="submit" value="eliminar" onclick="${remoteFunction(controller: 'chofer', action: '_modalEliminar', update: 'modal3', id: sitio.id)},
                        onSuccess: 'showModal()')}"> </td>


            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<div id="modal"></div>
<div id="modal2"></div>
<div id="modal3"></div>

<g:javascript>


    var asInitVals = new Array();
    $(document).ready(function () {
        var oTable = $('#example').dataTable({
            "language": {
                "decimal":        "",
                "emptyTable":     "No hay informacion disponible",
                "info":           "Mostrando del _START_ al _END_ de _TOTAL_ entradas",
                "infoEmpty":      "Mostrando 0 de 0 de 0 entradas",
                "infoFiltered":   "(filtrado de _MAX_ total entradas)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Mostrar _MENU_ entradas",
                "loadingRecords": "Cargando...",
                "processing":     "Procesando...",
                "search":         "Buscar:",
                "zeroRecords":    "No se han encontrado resultados",
                "paginate": {
                    "first":      "Primero",
                    "last":       "Ultimo",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
                },
                "aria": {
                    "sortAscending":  ": Activar ordenación ascendente",
                    "sortDescending": ": Activar ordenacion descendente"
                }
            },
            "aoColumnDefs": [
                {
                    'bSortable': false,
                    'aTargets': [0]
                } //disables sorting for column one
            ],
            'iDisplayLength': 12,
            "sPaginationType": "full_numbers"
        });
    });
</g:javascript>

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