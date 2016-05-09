package hackathon

class Taxi {

    static belongsTo = [sitio: Sitio]
    static hasMany = [servicios: Servicio, ubicaciones: Ubicacion]

    Chofer chofer
    String numero
    String numPlaca
    String numPermiso
    boolean estado
    int capacidadDisponible

    static constraints = {
    }


    static mapping = {
        table 'Taxi'
        version false
        numPlaca column: 'numPlaca'
        numPermiso column: 'numPermiso'
        capacidadDisponible column: 'capacidadDisponible'
        sitio column: 'sitio'
    }
}
