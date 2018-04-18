//
//  ResultadosDeBusqueda.swift
//  GuiApp
//
//  Created by Fernando  on 4/18/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

class ResultadosDeBusqueda {
    
    let resultadosDeBusqueda : [ResultadoDeBusqueda]
    
    init (json: JSON){
        
        var auxResultadosDeBusqueda = [ResultadoDeBusqueda]()
        
        for (_,subjson):(String, JSON) in json[]{
            var resultadoDeBusqueda : ResultadoDeBusqueda
            resultadoDeBusqueda = ResultadoDeBusqueda(json: subjson)
            auxResultadosDeBusqueda.append(resultadoDeBusqueda)
        }
        resultadosDeBusqueda = auxResultadosDeBusqueda
    }
}
