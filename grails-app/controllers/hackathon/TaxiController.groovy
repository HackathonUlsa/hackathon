package hackathon

import grails.converters.JSON
import org.hibernate.mapping.Map

class TaxiController {

    def index() {}

    def agregarTaxi() {
        def chofer = Chofer.findById(params.chofer)
        def sitio = Sitio.get(params.sitio)
        def taxi = new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso,
                estado: true, capacidadDisponible: 4, chofer: chofer, sitio: sitio)
        if (taxi.save() && ! taxi.hasErrors()) {
            flash.message = "Taxi registrado exitosamente."
            redirect(action: 'show', id: taxi.id)
        }

    }

    def edit(Long id) {
        def taxi = Taxi.get(id)
        def sitios = Sitio.getAll()
        def choferes = Chofer.getAll()
        [taxi: taxi, sitios: sitios, choferes: choferes]
    }

    def editarTaxi(Long id) {
        def taxi = Taxi.get(id)
        def chofer = Chofer.get(params.chofer)
        def sitio = Sitio.get(params.chofer)

        taxi.numero = params.numero
        taxi.numPermiso = params.numeroPermiso
        taxi.numPlaca = params.numeroPlaca
        taxi.chofer = chofer
        taxi.sitio = sitio

        if (taxi.save() && ! taxi.hasErrors()) {
            flash.message = "Taxi actualizado correctamente."
        }
            redirect(action: 'show', id: taxi.id)


    }

    def eliminarTaxi() {
        def taxi = Taxi.findById(params.id)
        taxi.delete()
        render(status: 200)
    }

    def obtenerTaxis() {
        def taxis = Taxi.getAll()
        [taxis: taxis]
    }

    def create() {
        def choferes = Chofer.getAll()
        def sitios = Sitio.getAll()
        [choferes: choferes, sitios: sitios]

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
        header 'access-control-allow-origin', '*'
        render taxi as JSON
    }

    def taxis(){
        def taxis = Taxi.getAll()
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getBySitio(String sitio){
        def taxis = Taxi.findBySitio(sitio)
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getByNumeroTaxi(String numero){
        def taxis = Taxi.findByNumero(numero)
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getByGenero(String genero){
        def taxis = Taxi.withCriteria {
            chofer.usuario.persona {
                eq("sexo", genero)
            }
        }
        header 'access-control-allow-origin', '*'
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
        header 'access-control-allow-origin', '*'
        render all as JSON
    }

    def updateLocation(long idd, double lat, double lng){
        def taxi = Taxi.findById(idd)
        taxi.ubicaciones.lat = lat
        taxi.ubicaciones.lng = lng
        header 'access-control-allow-origin', '*'
        if(taxi.save(flush: true)){
            def aux = ["success": true]
            render aux as JSON
        }else{
            render("status": 404)
        }

    }

    def isDisponible(long idd, boolean disponible){
        def taxi = Taxi.findById(idd)
        taxi.estado = disponible
        header 'access-control-allow-origin', '*'
        if(taxi.save(flush: true)){
            def aux = ["success": true]
            render aux as JSON
        }else{
            render("status": 404)
        }
    }

    def servicio(){

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
