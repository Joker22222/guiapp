//
//  ResultadoDeBusqueda.swift
//  GuiApp
//
//  Created by Fernando  on 4/18/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON


class ResultadoDeBusqueda {
    
    let id : String
    let idEmpresa: String
    let razonSocial: String
    let estado: String
    let idCategoria: String
    let direccion: String
    let idPais: String
    let idProvincia: String
    let idLocalidad: String
    let telefono: String
    let delivery: String
    let veinticuatroHs: String
    let diasHorarios: String
    let dirty: String
    let palabrasClave: String
    let distancia: String
    
    init(json: JSON){
        
        id = json[Constants.ResultadosDeBusqueda.id].stringValue
        idEmpresa = json[Constants.ResultadosDeBusqueda.idEmpresa].stringValue
        razonSocial = json[Constants.ResultadosDeBusqueda.razonSocial].stringValue
        estado = json[Constants.ResultadosDeBusqueda.estado].stringValue
        idCategoria = json[Constants.ResultadosDeBusqueda.idEmpresa].stringValue
        direccion = json[Constants.ResultadosDeBusqueda.direccion].stringValue
        idPais = json[Constants.ResultadosDeBusqueda.idPais].stringValue
        idProvincia = json[Constants.ResultadosDeBusqueda.idProvincia].stringValue
        idLocalidad = json[Constants.ResultadosDeBusqueda.idLocalidad].stringValue
        telefono = json[Constants.ResultadosDeBusqueda.telefono].stringValue
        delivery = json[Constants.ResultadosDeBusqueda.delivery].stringValue
        veinticuatroHs = json[Constants.ResultadosDeBusqueda.veinticuatrohs].stringValue
        diasHorarios = json[Constants.ResultadosDeBusqueda.diasHorarios].stringValue
        dirty = json[Constants.ResultadosDeBusqueda.dirty].stringValue
        palabrasClave = json[Constants.ResultadosDeBusqueda.palabrasClave].stringValue
        distancia = json[Constants.ResultadosDeBusqueda.distancia].stringValue
    }
}
