<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 20/04/16
  Time: 06:01 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>Perfil</h3>
        </div>

    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Datos Personales</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${createLink(controller: 'usuario', action: 'edit', id: taxi.id)}"><i class="fa fa-edit"></i> Editar</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">

                        <h3>${taxi.numPermiso}</h3>
                        <ul class="list-unstyled user_data">
                            <li>
                                <i class="fa fa-user"></i> Placas ${taxi.numPlaca}
                            </li>
                            <g:each in="${taxi.servicios}">
                                <li>
                                    <i class="fa fa-info"></i> ${taxi}
                                </li>
                            </g:each>

                            <li><i class="fa fa-map-marker user-profile-icon"></i> Oaxaca, Oaxaca, MEX
                            </li>
                        </ul>
                        <br />


                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">

                        <!-- start of user-activity-graph -->
                        <div id="graph_bar" style="width:100%; height:280px;">


                        </div>
                        <!-- end of user-activity-graph -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>