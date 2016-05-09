package hackathon

class Servicio {

    static belongsTo = [taxi: Taxi]

    String nombre
    String descripcion

    static constraints = {
    }

    static mapping = {
        table 'Servicio'
        version false
        taxi column: 'taxi'
    }
}
