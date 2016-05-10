<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 20/04/16
  Time: 01:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${terreno.nombre} - Detalles</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>Detalles</h3>
        </div>


    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Tipo de cultivo: ${terreno.cultivo.nombre}</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${createLink(controller: 'terreno', action: 'editar', id: terreno.id)}">Editar</a>
                                </li>
                                <li><a id="eliminar">Eliminar</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <ul class="stats-overview">
                            <li>
                                <span class="name"> Temperatura necesaria </span>
                                <span class="value text-success">${terreno.cultivo.temperaturaNecesaria} <i class="wi wi-celsius"></i></span><span class=""></span>
                            </li>
                            <li>
                                <span class="name"> Humedad Necesaria </span>
                                <span class="value text-success"><i class="wi wi-humidity"></i> ${terreno.cultivo.humedadNecesaria} </span>
                            </li>
                            <li class="hidden-phone">
                                <span class="name"> Dirección IP </span>
                                <span class="value text-success"> <i class="fa fa-link"></i> ${terreno.ip} </span>
                            </li>
                        </ul>
                        <br />
                        <div class="demo-container" style="height:280px">
                            <div id="placeholder33x" class="demo-placeholder"></div>
                        </div>
                        <br />
                        <h2 class="title">Ubicación</h2>
                        <br />
                        <div id="map" style="height:350px;"></div>
                        <br />
                        <div>
                        </div>
                    </div>
                    <!-- start project-detail sidebar -->
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <section class="panel">
                            <div class="x_title">
                                <h3 class="green"><i class="wi wi-raindrop"></i> Sistema de riego</h3>

                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">
                                <h2 class="title">Descripción</h2>
                                <div class="project_detail">
                                    <p>${terreno.descripcion}</p>
                                </div>
                                <br />
                                <h4 class="title">Colaboradores</h4>
                                <ul class="messages">
                                    <g:each in="${terreno.usuarios}" var="usuario">
                                        <li>
                                            <a href="${createLink(controller: 'usuario', action: 'usuario', id: usuario.id)}"><img src="${createLink(controller: 'usuario',
                                                    action: 'renderImage', id: usuario.id)}"
                                                                                                                                   class="avatar" alt="Avatar">
                                            </a>
                                            <div class="message_wrapper">
                                                <h4 class="heading"><a href="${createLink(controller: 'usuario', action: 'usuario', id: usuario.id)}">${usuario.datosPersonales.nombre} ${usuario.datosPersonales.apPaterno} ${usuario.datosPersonales.apMaterno}</a></h4>
                                                <blockquote class="message">${usuario.biografia}</blockquote>
                                            </div>
                                        </li>
                                    </g:each>
                                </ul>

                            </div>
                        </section>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgK8kiRGmbR_z8UNewkMpBv9hZANY10Ic">
</script>
<g:javascript>
        $(document).ready(function() {
        // Flot.js Graficador
            //define chart clolors ( you maybe add more colors if you want or flot will add it automatic )
            var chartColours = ['#96CA59', '#3F97EB', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'];

            $(function () {
                var idT = $("#idTerreno").val();
                //var intervalId = setInterval(plot, 3000);
                var placeholder = $("#placeholder33x");
                plot();

                function plot() {
                var maximo = 0;
                    $.ajax({
                        method: "POST",
                        data: { id : idT },
                        url: "${createLink(controller: 'terreno', action: 'historial')}",
                        success: function(result) {
                            var d1 = [];
                            var d2 = [];
                            try {
                                for(var i = 0; i < result.length; i++) {
                                    if (result[i].humedad > maximo)
                                        maximo = result[i].humedad
                                    if (result[i].temperatura > maximo)
                                            maximo = result[i].temperatura
                                    d1.push([new Date(result[i].fecha).getTime(), result[i].humedad]);
                                    d2.push([new Date(result[i].fecha).getTime(), result[i].temperatura]);
                                }
                                var chartMinDate = d1[0][0]; //first day
                                var chartMaxDate = d1[d1.length - 1][0]; //last day

                                var tickSize = [1, "day"];
                                var tformat = "%d/%m/%y";

                                //graph options
                                var options = {
                                    grid: {
                                        show: true,
                                        aboveData: true,
                                        color: "#3f3f3f",
                                        labelMargin: 10,
                                        axisMargin: 0,
                                        borderWidth: 0,
                                        borderColor: null,
                                        minBorderMargin: 2,
                                        clickable: true,
                                        hoverable: true,
                                        autoHighlight: true,
                                        mouseActiveRadius: 100
                                    },
                                    series: {
                                        lines: {
                                            show: true,
                                            fill: true,
                                            lineWidth: 2,
                                            steps: false
                                        },
                                        /*
                                        curvedLines: {
                                            apply: true,
                                            active: true,
                                            monotonicFit: true
                                        },*/
                                        points: {
                                            show: true,
                                            radius: 4.5,
                                            symbol: "circle",
                                            lineWidth: 3.0
                                        }
                                    },
                                    legend: {
                                        show: true,
                                        position: "ne",
                                        margin: [0, -10],
                                        noColumns: 0,
                                        labelBoxBorderColor: null,
                                        labelFormatter: function (label, series) {
                                            // just add some space to labes
                                            return label + '&nbsp;&nbsp;';
                                        },
                                        width: 40,
                                        height: 1
                                    },
                                    colors: chartColours,
                                    shadowSize: 1,
                                    tooltip: true, //activate tooltip
                                    tooltipOpts: {
                                        show: true,
                                        content: "%y.2",
                                        shifts: {
                                            x: -30,
                                            y: -50
                                        },
                                        defaultTheme: false
                                    },
                                    yaxis: {
                                        min: 0,
                                        max: maximo + 12
                                    },
                                    xaxis: {
                                        mode: "time",
                                        minTickSize: tickSize,
                                        timeformat: tformat,
                                        min: chartMinDate,
                                        max: chartMaxDate
                                    }
                                }; //
                                //plotAnimator
                                $.plot($(placeholder), [{
                                    label: "Humedad",
                                    data: d1,
                                    lines: {
                                        fillColor: "rgba(255, 100, 20, 0.12)"
                                    }, //#96CA59 rgba(150, 202, 89, 0.42)
                                    points: {
                                        fillColor: "#fff"
                                    },
                                    animator: { start: 100, steps: 99, duration: 1000, direction: "right" }
                                }, {
                                    label: "Temperatura",
                                    data: d2,
                                    lines: {
                                        fillColor: "rgba(150, 202, 89, 0.12)"
                                    }, //#96CA59 rgba(150, 202, 89, 0.42)
                                    points: {
                                        fillColor: "#000"
                                    }
                                }], options);
                            } catch(error) {
                                //clearInterval(intervalId);
                                $(placeholder).append("<h4>Sin información disponible.</h4>");
                            }

                        }
                    });
                };




            });

        // Termina Flot.js

        // Google maps
           initMap();

           function initMap() {
                var mapDiv = document.getElementById('map');
                    // Oaxaca
                    // lat 17.062036080716222
                    // lng -96.7294692993164
                try {
                    var latitude = parseFloat($("#latitud").val());
                    var longitude = parseFloat($("#longitud").val());
                    if (latitude && longitude) {
                        var location = {lat: latitude, lng: longitude};
                        var map = new google.maps.Map(mapDiv, {
                            center : location,
                            zoom : 10
                        });
                        var title = $("#nombre").val();
                        var marker = new google.maps.Marker({
                            position : location,
                            map : map,
                            title : title
                        });
                    } else
                        $(mapDiv).append("Sin ubicaciones guardadas.");

                } catch(error) {
                    $(mapDiv).append("<h4>Sin información disponible, verifique su conexión.</h4>");
                }
           }
           // Termina Google Maps

            $(".eliminar").click(function() {
                var tId = $(".eliminar").attr('id');
                bootbox.dialog({
                    message: 'Está seguro que deseas eliminar este elemento?',
                    title: 'Confirmar',
                    show: true,
                    backdrop: true,
                    animate: true,
                    className: "my-modal",
                    local: 'es',
                    onEscape: true,
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn btn-success",
                            callback: function () {
                            }
                        },
                        Aceptar: {
                            label: "Eliminar",
                            className: "btn-danger",
                            callback: function () {
                                $.ajax({
                                    method: "POST",
                                    url: '${createLink(controller: 'terreno', action: 'eliminar')}',
                                    data: {
                                        id: tId
                                    },
                                    success: function() {
                                        console.log("Exito");
                                    },
                                    error: function() {
                                        console.log("fallo");
                                    }
                                });
                            }
                        },
                    }

                });
            });
        // Delete terreno
            $("#eliminar").click(function() {
                var tId = $("#idTerreno").val();
                bootbox.dialog({
                    message: '¿Está seguro que deseas eliminar este elemento?',
                    title: 'Confirmar',
                    backdrop: true,
                    animate: true,
                    local: 'es',
                    onEscape: true,
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn btn-success",
                            callback: function () {
                            }
                        },
                        Aceptar: {
                            label: "Eliminar",
                            className: "btn-danger",
                            callback: function () {
                                $.ajax({
                                    method: "POST",
                                    url: '${createLink(controller: 'terreno', action: 'eliminar')}',
                                    data: {
                                        id: tId
                                    },
                                    success: function() {
                                        window.location = '${createLink(controller: 'terreno', action: 'terrenos')}';
                                    },
                                    error: function() {
                                        bootbox.alert("Ocurrió un error al intentar eliminar el elemento.");
                                    }

                                });
                            }
                        },
                    }

                });
            });
        // End Document Ready
        });


</g:javascript>
</body>
</html>