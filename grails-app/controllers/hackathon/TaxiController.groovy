package hackathon

import grails.converters.JSON

class TaxiController {

    def index() {}

    def agregarTaxi(){
        def chofer = Chofer.findById(params.idd)
        new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso, estado: params.estado, capacidadDisponible: params.capacidadDisponible, chofer: chofer).save(flush: true)
    }

    def editarTaxi(){
        def chofer = Chofer.findById(params.idd)
        new Taxi(numero: params.numero, numPlaca: params.numPlaca, numPermiso: params.numPermiso, estado: params.estado, capacidadDisponible: params.capacidadDisponible, chofer: chofer).save(flush: true)
    }

    def eliminarTaxi(){
        def taxi = Taxi.findById(params.idd)
        taxi.delete()
    }

    def obtenerTaxis(){
        def taxis = Taxi.getAll()
        [taxis: taxis]
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

}
