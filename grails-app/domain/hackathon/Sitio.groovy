package hackathon

class Sitio {

    static hasMany = [taxis: Taxi, historial: Historial]

    String nombre
    String direccion

    static constraints = {
    }

    static mapping = {
        table 'Sitio'
        version false
    }
}
