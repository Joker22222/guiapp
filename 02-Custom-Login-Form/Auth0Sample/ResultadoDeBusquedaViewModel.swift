//
//  ResultadoDeBusquedaViewModel.swift
//  GuiApp
//
//  Created by Fernando  on 4/18/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import Alamofire
protocol ResultadoDeBusquedaViewModelDelegate {
    func finishGetingResults()
}

class ResultadoDeBusquedaViewModel{
    var resultadosDeBusqueda : ResultadosDeBusqueda?
    var listaResultadosDeBusqueda : [ResultadoDeBusqueda]?
    var delegate : ResultadoDeBusquedaViewModelDelegate?
    
    init(){

    }
    convenience init (parametro: String, latitud: String, longitud:String){
        self.init()
        let parameters : [[String: Any]] = [[
            "param":parametro,
            "latitud":latitud,
            "longitud":longitud
        ]]
    
        APIClient.getResultadosDeBusquedaParam(parameters, completion: { (result, error) in
            if error == nil {
                self.resultadosDeBusqueda = result
                self.listaResultadosDeBusqueda = self.resultadosDeBusqueda?.resultadosDeBusqueda
                self.delegate?.finishGetingResults()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        })
    
    }

}
