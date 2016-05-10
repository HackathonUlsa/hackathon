package hackathon

import grails.converters.JSON
import org.hibernate.mapping.Map

import java.rmi.server.ServerCloneException

class TaxiController {

    def index() {}

    def agregarTaxi() {
        def chofer = Chofer.findById(params.chofer)
        def sitio = Sitio.get(params.sitio)
        def taxi = new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso,
                estado: true, capacidadDisponible: 4, chofer: chofer, sitio: sitio)

        if (params.nombreServicio) {
            if (params.nombreServicio instanceof String) {
                def servicio = new Servicio(nombre: params.nombreServicio, descripcion: params.descripcionServicio)
                taxi.addToServicios(servicio)
            } else {
                for (int i = 0; i < params.nombreServicio.size(); i++) {
                    def servicio = new Servicio(nombre: params.nombreServicio.getAt(i),
                            descripcion: params.descripcionServicio.getAt(i))
                    taxi.addToServicios(servicio)
                }
            }

        }

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
        taxi.numPermiso = params.numPermiso
        taxi.numPlaca = params.numPlaca
        taxi.chofer = chofer
        taxi.sitio = sitio

        if (taxi.save() && ! taxi.hasErrors()) {
            flash.message = "Taxi actualizado correctamente."
            redirect(action: 'show', id: taxi.id)
        }



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

    def taxi(){
        def user = Usuario.findById(params.id)
        def chofer = Chofer.findByUsuario(user)
        def taxi = Taxi.findByChofer(chofer)
        header 'access-control-allow-origin', '*'
        render taxi as JSON
    }

    def taxis(){
        def taxis = Taxi.getAll()
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getBySitio(){
        def taxis = Taxi.findBySitio(params.sitio)
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getByNumeroTaxi(){
        def taxis = Taxi.findByNumero(params.numero)
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getByGenero(){
        def taxis = Taxi.withCriteria {
            chofer.usuario.persona {
                eq("sexo", params.genero)
            }
        }
        header 'access-control-allow-origin', '*'
        render taxis as JSON
    }

    def getByDistancia(){
        def taxis = Taxi.getAll()
        ArrayList<TaxiDistancia> all = new ArrayList<TaxiDistancia>();
        double x1 = params.lat
        double y1 = params.lng
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

    def updateLocation(){
        def user = Usuario.get(params.id)
        def chofer = Chofer.findByUsuario(user)
        def taxi = Taxi.findByChofer(chofer)
        def ubicacion = new Ubicacion(lat: params.lat, lng: params.lng)
        taxi.addToUbicaciones(ubicacion)

        header 'access-control-allow-origin', '*'
        if(taxi.save(flush: true)){
            def aux = ["success": true]
            render aux as JSON
        }else{
            render("status": 404)
        }

    }

    def isDisponible(){
        def user = Usuario.findById(params.id)
        def chofer = Chofer.findByUsuario(user)
        def taxi = Taxi.findByChofer(chofer)
        taxi.estado = params.disponible
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

    def rank() {
        def sitio = Sitio.get(params.id)
        def taxis = sitio.taxis

        def map = [:]
        def map2
        def lista = new LinkedList()

        taxis.each { taxi ->
            map2 = new HashMap()
            map2["chofer"] = taxi.chofer.usuario.persona.nombre
            map2["cantidad"] = Historial.countByChofer(taxi.chofer)
            //map2["cantidad"] = 5
            lista.add(map2)
        }
        map.put("choferes", lista)
        render map as JSON
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
