package hackathon

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SitioController {

    def index() { }

    def create() {
        def sitio = new Sitio(nombre: params.nombre, direccion: params.direccion)
        if (sitio.save() && ! sitio.hasErrors()) {
            flash.message = "Sitio creado correctamente"
            redirect(controller: 'sitio', action: 'sitio', id: sitio.id)
        }
    }

    def update(Long id) {
        def sitio = Sitio.get(id)
        sitio.nombre = params.nombre
        sitio.direccion = params.direccion
        if (sitio.save() && ! sitio.hasErrors()) {
            flash.message = "Sitio actualizado correctamente"
            redirect(controller: 'sitio', action: 'sitio', id: sitio.id)
        }

    }

    def sitio(Long id) {
        def sitio = Sitio.get(id)
        render sitio as JSON
    }

    def show(Long id) {
        def sitio = Sitio.get(id)
        [sitio: sitio]
    }

    def sitios() {
        def sitios = Sitio.getAll()
        render sitios as JSON
    }

    def list() {
        def sitios = Sitio.getAll()
        [sitios: sitios]
    }

    def historial(Long id) {
        def sitio = Sitio.get(id)
        render sitio.historial as JSON
    }

    def getHistorial(Long id) {
        def sitio = Sitio.get(id)
        [historial: sitio.historial]
    }


}
