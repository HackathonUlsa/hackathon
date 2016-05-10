
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header center">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Escoge los grupos </h4>
            </div>
            <div class="modal-body">

                <g:form name="form" class="form-horizontal" role="form">

                    <div class="form-group col-md-12">

                        <g:each in="${sitios}" var="g">

                            <div class="col-md-6 checkbox" style="position: relative">
                                <label class="">

                                    <div class="" >

                                        <input type="checkbox" class="flat" name="check" value="${g.idds}" >
                                        <!-- <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins> -->

                                    </div>

                                    ${g.nombre}</label>
                            </div>




                        </g:each>

                    </div>

                    <div class="modal-footer">
                        <g:form >
                            <input id="PDFBtn" formaction="${createLink(controller: "historial", action: "reporte")}" onclick="this.form.target='_blank';return true; showModal()" class="btn btn-primary"  type="submit" value="Generar PDF" />
                        </g:form>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    </div>

                </g:form>

            </div>
        </div>
    </div>
</div>
