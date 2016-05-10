package hackathon

class Historial {

    static belongsTo = [sitio: Sitio]

    Chofer chofer
    Cliente cliente
    double monto
    Date fecha

    static constraints = {

    }

    static mapping = {
        table 'Historial'
        version false
        fecha sqlType: 'datetime'
        sitio column: 'sitio'
    }
}
