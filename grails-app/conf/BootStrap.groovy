
class BootStrap {

    def init = { servletContext ->
        def persona = hackathon.Persona.findByNombre('admin')
        if(!persona){
            persona = new hackathon.Persona(nombre: 'admin', apPaterno: 'admin', sexo: 'M', fechaNacimiento: '10-10-2010').save(flush: true)
        }
        def adminRole = new hackathon.Rol(authority:'ROLE_ADMIN').save()
        def testUser = new hackathon.Usuario(username: 'admin', password: 'admin', enabled: true, persona: persona).save()
        hackathon.UsuarioRol.create testUser, adminRole, true
    }
    def destroy = {
    }
}
