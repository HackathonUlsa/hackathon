package hackathon

class Persona {

    String nombre
    String apPaterno
    String apMaterno
    String sexo
    String fechaNacimiento

    static constraints = {
        apMaterno(nullable: true, blank: true)
    }

    static mapping = {
        table 'Persona'
        version false
        apPaterno column: 'apPaterno'
        apMaterno column: 'apMaterno'
        fechaNacimiento column: 'fechaNacimiento'
    }
}
