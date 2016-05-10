package hackathon

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ChoferController {

    def inicio() {

        def query = Chofer.getAll()
        [choferes:query]
    }

    def _ModalAgregar(){

    }

    def _modalEditar(){

        def query = Chofer.findById(params.idd)
        [choferes:query]
    }

    def _modalEliminar(){

    }

    def agregar(){

        def p = new Persona(nombre:params.nombre,apPaterno: params.apellidoPaterno,apMaterno:params.apellidoMaterno,sexo: params.sexo, fechaNacimiento: params.fecha).save(flash:true)
        def adminRole  = new hackathon.Rol(authority: 'Role_Chofer').save()
        def u = new Usuario(username: params.usuario, password: params.password,persona: p, enabled: true).save()
        hackathon.UsuarioRol.create u,adminRole,true

        if(new Chofer(numLicencia:params.licencia,usuario: u).save(flush: true)){
            flash.message = "chofer agregado exitosamente"
        }else{
            flash.error = "No se pudo agregar el chofer"
        }

        render(controller: 'chofer', action: 'inicio')
    }


   /* def _tablaChofer(){

        def query = Chofer.getAll()

        [choferes:query]
    }*/

}
