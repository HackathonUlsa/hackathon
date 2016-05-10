package hackathon

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Secured(['permitAll'])
class ClienteController {

    def index() {}

    def cliente(Long id) {
        def cliente = Cliente.get(id)
        render cliente as JSON
    }

    def clientes() {
        def clientes = Cliente.getAll()
        render clientes as JSON
    }

    def create() {
        def persona = new Persona(nombre: params.nombre, apPaterno: params.apPaterno, apMaterno: params.apMaterno,
            sexo: params.sexo, fechaNacimiento: params.fechaNacimiento).save(flush: true)
        def usuario = new Usuario(username: params.email, password: params.password, enabled: true,
                persona: persona).save(flush: true)
        def rol = Rol.findByAuthority('ROLE_CLIENTE')
        UsuarioRol.create usuario, rol, true
        println usuario
        def cliente = new Cliente(usuario: usuario)

        header 'access-control-allow-origin', '*'
        if (cliente.save() && ! cliente.hasErrors()) {
            def aux = ["success": true]
            render aux as JSON
        } else
            render(status: 404)

    }


}
