
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>

    <title>Hey taxi | Detalle</title>
    <g:javascript src="flot/jquery.flot.js"></g:javascript>
    <g:javascript src="flot/jquery.flot.animator.min.js"></g:javascript>
    <g:javascript src="flot/date.js"></g:javascript>
    <g:javascript src="flot/jquery.flot.time.min.js"></g:javascript>
    <g:javascript src="flot/jquery.flot.resize.js"></g:javascript>
    <g:javascript src="flot/jquery.flot.tooltip.min.js"></g:javascript>
    <g:javascript src="flot/curvedLines.js"></g:javascript>
</head>

<body>
<g:hiddenField name="idSitio" id="idSitio" value="${sitio.id}"></g:hiddenField>
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

    <div class="demo-container" style="height:280px">
        <div id="placeholder33x" class="demo-placeholder"></div>
    </div>

</form>
<g:javascript>
$(document).ready(function() {
        // Flot.js Graficador
            //define chart clolors ( you maybe add more colors if you want or flot will add it automatic )
            var chartColours = ['#96CA59', '#3F97EB', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'];

            $(function () {
                var idS = $("#idSitio").val();
                //var intervalId = setInterval(plot, 3000);
                var placeholder = $("#placeholder33x");
                plot();

                function plot() {
                var maximo = 0;
                    $.ajax({
                        method: "POST",
                        data: { id : idS },
                        url: "${createLink(controller: 'taxi', action: 'rank')}",
                        success: function(result) {
                            var d1 = [];
                            var ticks = [];
                            try {
                                for(var i = 0; i < result.choferes.length; i++) {
                                    if (result.choferes[i].cantidad > maximo)
                                        maximo = result.choferes[i].cantidad;
                                    d1.push([i, result.choferes[i].cantidad]);
                                    ticks.push([i, result.choferes[i].chofer]);
                                    console.log(result.choferes.length);
                                }
                                var dataset = [{label: "Número de viajes", data: d1, color: "#5482FF"}]
                                console.log(d1[0]);
                                //graph options
                                var options = {
                                    series: {
                                        bars: {
                                        show: true
                                        }
                                    },
                                    bars: {
                                    align: "center",
                                    barWidth: 0.5
                                    },
                                    xaxis: {
                                        axisLabel: "Choferes",
                                        axisLabelUseCanvas: true,
                                        axisLabelFontSizePixels: 12,
                                        axisLabelFontFamily: 'Verdana, Arial',
                                        axisLabelPadding: 10,
                                        ticks: ticks
                                    },
                                    yaxis: {
                                        axisLabel: "Número de viajes",
                                        axisLabelUseCanvas: true,
                                        axisLabelFontSizePixels: 12,
                                        axisLabelFontFamily: 'Verdana, Arial',
                                        axisLabelPadding: 3,
                                        tickFormatter: function (v, axis) {
                                            return v;
                                        }
                                    },
                                    legend: {
                                        noColumns: 0,
                                        labelBoxBorderColor: "#000000",
                                        position: "nw"
                                    },
                                    grid: {
                                        hoverable: true,
                                        borderWidth: 2,
                                        backgroundColor: { colors: ["#ffffff", "#EDF5FF"] }
                                    }
                                }
                                //plotAnimator
                                $.plot($(placeholder), dataset, options);
                            } catch(error) {
                                //clearInterval(intervalId);
                                $(placeholder).append("<h4>Sin información disponible.</h4>");
                            }

                        }
                    });
                };




            });
    });
</g:javascript>
</body>
</html>