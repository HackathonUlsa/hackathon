package hackathon

class Ranking {

    static belongsTo = [cliente: Cliente, chofer: Chofer]

    Usuario usuario
    String comentario
    int calificacion

    static constraints = {
        chofer(nullable: true)
        cliente(nullable: true)
    }

    static mapping = {
        table 'Ranking'
        version false
        usuario column: 'usuario'
        cliente column: 'cliente'
        chofer column: 'chofer'
    }
}
