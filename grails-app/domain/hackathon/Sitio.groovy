package hackathon

class Sitio {

    static hasMany = [taxis: Taxi]

    String nombre
    String direccion


    static constraints = {
    }

    static mapping = {
        table 'Sitio'
        version false
    }
}
