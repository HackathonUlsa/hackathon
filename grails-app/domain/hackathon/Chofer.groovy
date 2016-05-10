package hackathon

class Chofer {

    static hasMany = [rankings : Ranking]

    String numLicencia
    Usuario usuario

    static constraints = {
    }

    static mapping = {
        table 'Chofer'
        version false
        numLicencia column: 'numLicencia'
        usuario column: 'usuario'
    }

    def getValoracion() {
        int sumatoria
        int valoracion
        rankings.each { r ->
            sumatoria += r.calificacion
        }

        return sumatoria / rankings.size()
    }

    def numViajes() {
        return
    }
}
