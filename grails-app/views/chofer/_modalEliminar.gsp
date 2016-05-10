<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">Eliminar chofer</h4>
            </div>
            <div class="modal-body">

                <div >
                        Deseas eliminar a ${nombre} ${apP} ${apM}
                </div>


                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="reset" class="btn btn-primary" data-dismiss="modal">NO</button>
                            <g:submitToRemote url="[controller: 'chofer', action: 'eliminar',params:[idd:idd]]" onSuccess="dismissModal()"
                                              class="btn btn-success" value="SI" />
                        </div>
                    </div>

                </form>



            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>