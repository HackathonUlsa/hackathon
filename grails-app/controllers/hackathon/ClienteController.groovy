package hackathon

import grails.converters.JSON

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
            sexo: params.sexo, fechaNacimiento: params.fechaNacimiento).save()
        def usuario = new Usuario(username: params.email, password: params.password, enabled: true,
                persona: persona).save()
        def rol = Rol.findByAuthority('ROLE_CLIENTE')
        UsuarioRol.create usuario, rol, true

        def cliente = new Cliente(usuario: usuario)
        if (cliente.save() && ! cliente.hasErrors()) {
            render cliente as JSON
        }
    }


}
