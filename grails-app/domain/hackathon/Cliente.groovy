package hackathon

class Cliente {

    static hasMany = [rankings: Ranking]

    Usuario usuario


    static constraints = {
    }

    static  mapping = {
        table 'Cliente'
        version false
        usuario column: 'usuario'
    }
}
