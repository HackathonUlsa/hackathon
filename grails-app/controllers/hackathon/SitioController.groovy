package hackathon

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SitioController {

    def index() { }

    def create() {

    }

    def perfil(){

    }

    def actualizarPerfil(){
        println "idd " + params.idd

        def u = Usuario.get(params.idd)
        u.password = params.password



        if(u.save(flush: true)){
            flash.message = "Actualizado Exitosamente"
        }else{
            flash.error = "Error al actualizar"
        }

        redirect(controller: 'sitio', action: 'perfil')
    }

    def save() {
        def sitio = new Sitio(nombre: params.nombre, direccion: params.direccion)
        if (sitio.save() && ! sitio.hasErrors()) {
            flash.message = "Sitio creado correctamente"
            redirect(controller: 'sitio', action: 'show', id: sitio.id)
        }
    }

    def update(Long id) {
        def sitio = Sitio.get(id)
        sitio.nombre = params.nombre
        sitio.direccion = params.direccion
        if (sitio.save() && ! sitio.hasErrors()) {
            flash.message = "Sitio actualizado correctamente"
            redirect(controller: 'sitio', action: 'show', id: sitio.id)
        }

    }

    def sitio(Long id) {
        def sitio = Sitio.get(id)
        if (! sitio)
            sitio = []
        render sitio as JSON
    }

    def show(Long id) {
        def sitio = Sitio.get(id)
        [sitio: sitio]
    }

    def sitios() {
        def sitios = Sitio.getAll()
        if (! sitios)
            sitios = []
        render sitios as JSON
    }

    def list() {
        def sitios = Sitio.getAll()
        [sitios: sitios]
    }

    def edit(Long id) {
        def sitio = Sitio.get(id)
        [sitio: sitio]
    }


    def historial(Long id) {
        def sitio = Sitio.get(id)
        render sitio.historial as JSON
    }

    def getHistorial(Long id) {
        def sitio = Sitio.get(id)
        [historial: sitio.historial]
    }

    def _modalEliminar(Long id) {
        def sitio = Sitio.get(id)
        [sitio: sitio]
    }

    def delete(Long id) {
        def sitio = Sitio.get(id)
        sitio*.delete()
        redirect(action: 'list', sitios: Sitio.getAll())
    }

}
