package hackathon

import grails.converters.JSON
import org.h2.engine.Role
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ChoferController {

    def inicio() {

        def query = Chofer.getAll()
        [choferes:query]
    }



    def detalle(long id){



        def query = Chofer.findById(id)
        [choferes:query]

    }

    def editarC(long id){



        def query = Chofer.findById(id)
        [choferes:query]

    }

    def _modalEliminar(){


        [nombre:params.nombre2,apP:params.apP,apM:params.apM,idd:params.id2]

    }

    def agregarC(){


    }

    def agregar(){

        def p = new Persona(nombre:params.nombre,apPaterno: params.apellidoPaterno,apMaterno:params.apellidoMaterno,sexo: params.sexo, fechaNacimiento: params.fecha).save(flash:true)
        def adminRole  = Rol.findByAuthority("ROLE_CHOFER")
        def u = new Usuario(username: params.usuario, password: params.password,persona: p, enabled: true).save()
        hackathon.UsuarioRol.create u,adminRole,true

        Chofer c = new Chofer(numLicencia:params.licencia,usuario: u).save(flush: true)
        if(c!=null){
            flash.message = "chofer agregado exitosamente"
        }else{
            flash.error = "No se pudo agregar el chofer"
        }

        redirect(controller: 'chofer',action: 'detalle',id:c.id)
    }


    def editar(Long id){

        Chofer c = Chofer.get(id)
        c.numLicencia= params.licencia
        c.usuario.persona.nombre=params.nombre
        c.usuario.username=params.usuario
        c.usuario.persona.apPaterno=params.apellidoPaterno
        c.usuario.persona.apMaterno=params.apellidoMaterno
        c.usuario.persona.fechaNacimiento=params.fecha
        c.save(flush: true)
        redirect(controller: 'chofer', action: 'detalle',id:c.id)

    }


    def eliminar(){

        Chofer c = Chofer.findById(params.idd)
        c.delete()
        render(status: 200)
    }


    def pdf(){


        String applicationPath = request.getSession().getServletContext().getRealPath("")
        def resul

    }

   /* def _tablaChofer(){

        def query = Chofer.getAll()

        [choferes:query]
    }*/
    

}
