package hackathon

import grails.converters.JSON
import org.hibernate.mapping.Map

class TaxiController {

    def index() {}

    def agregarTaxi() {
        def chofer = Chofer.findById(params.id)
        new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso, estado: params.estado, capacidadDisponible: params.capacidadDisponible, chofer: chofer).save(flush: true)
    }

    def editarTaxi() {
        def chofer = Chofer.findById(params.id)
        new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso, estado: params.estado, capacidadDisponible: params.capacidadDisponible, chofer: chofer).save(flush: true)
    }

    def eliminarTaxi() {
        def taxi = Taxi.findById(params.id)
        taxi.delete()
    }

    def obtenerTaxis() {
        def taxis = Taxi.getAll()
        [taxis: taxis]
    }

    def create() {
        def choferes = Chofer.getAll()
        [choferes: choferes]

    }

    def show(Long id) {
        def taxi = Taxi.get(id)
        [taxi: taxi]
    }

    def _modalEliminar(Long id) {
        def taxi = Taxi.get(id)
        [taxi: taxi]
    }

    def taxi(Long id){
        def taxi = Taxi.findById(id)
        render taxi as JSON
    }

    def taxis(){
        def taxis = Taxi.getAll()
        render taxis as JSON
    }

    def getBySitio(String sitio){
        def taxis = Taxi.findBySitio(sitio)
        render taxis as JSON
    }

    def getByNumeroTaxi(String numero){
        def taxis = Taxi.findByNumero(numero)
        render taxis as JSON
    }

    def getByGenero(String genero){
        def taxis = Taxi.withCriteria {
            chofer.usuario.persona {
                eq("sexo", genero)
            }
        }
        render taxis as JSON
    }

    def getByDistancia(double x1, double y1){
        def taxis = Taxi.getAll()
        ArrayList<TaxiDistancia> all = new ArrayList<TaxiDistancia>();
        for(Taxi t: taxis){
            double x2 = t.ubicaciones.lat
            double y2 = t.ubicaciones.lng
            double suma = Math.pow((x2-x1), 2) + Math.pow((y2-y1), 2)
            double d = Math.sqrt(suma)
            TaxiDistancia aux = new TaxiDistancia()
            aux.setTaxi(t)
            aux.setDistancia(d)
            all.add(aux)
        }
        def bySorting = new Comparator() {
            int compare(a,b) { a.distancia <=> b.distancia }
        }
        all.sort(bySorting)
        render all as JSON
    }

    def updateLocation(long idd, double lat, double lng){
        def taxi = Taxi.findById(idd)
        taxi.ubicaciones.lat = lat
        taxi.ubicaciones.lng = lng
        taxi.save(flush: true)
    }

    def isDisponible(long idd, boolean disponible){
        def taxi = Taxi.findById(idd)
        taxi.estado = disponible
        taxi.save(flush: true)
    }

}

class TaxiDistancia {
    Taxi taxi;
    double distancia;

    double getDistancia() {
        return distancia
    }

    void setDistancia(double d) {
        this.distancia = d
    }

    double getTaxi() {
        return taxi
    }

    void setTaxi(double t) {
        this.taxi = t
    }
}
