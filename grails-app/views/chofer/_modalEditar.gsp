<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">

        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel2">Agregar chofer</h4>
        </div>
        <div class="modal-body">

            <form class="form-horizontal form-label-left" method="POST" novalidate>


                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Nombre <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="nombre" class="form-control col-md-7 col-xs-12" name="nombre" value="${choferes.usuario.persona.nombre}" required="required" type="text">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Paterno <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="apelidoPaterno" class="form-control col-md-7 col-xs-12" name="apellidoPaterno" value="${choferes.usuario.persona.apPaterno}" required="required" type="text">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Apellido Materno <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="apelidoMaterno" class="form-control col-md-7 col-xs-12" name="apellidoMaterno" value="${choferes.usuario.persona.apMaterno}" required="required" type="text">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Sexo <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="sexo" class="form-control col-md-7 col-xs-12"  name="sexo" value="${choferes.usuario.persona.sexo}" required="required" type="text">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Numero licencia <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="licencia" class="form-control col-md-7 col-xs-12"  name="licencia" value="${choferes.numLicencia}" required="required" type="text">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha de nacimiento <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="fecha" class="form-control col-md-7 col-xs-12"  name="fecha" value="${choferes.usuario.persona.fechaNacimiento}" required="required" type="date">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Usuario <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="usuario" class="form-control col-md-7 col-xs-12" name="usuario" value="${choferes.usuario.username}" required="required" type="email">
                    </div>
                </div>


                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <button type="reset" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                        <g:submitToRemote url="[controller: 'chofer', action: 'agregar']" update="tablaChofer" onSuccess="dismissModal()"
                                          class="btn btn-success" value="Guardar"/>
                    </div>
                </div>

            </form>



        </div>
        <div class="modal-footer">

        </div>
    </div>
</div>
</div>