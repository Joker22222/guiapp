//
//  Evento.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class Evento {
    
    let id: String
    let nombre: String
    let descripcion: String
    let imagen: String
    let idTipo: String
    let tipo: String
    let fechaInicio: String
    let fechaFin: String
    let idEmpresa: String
    let razonSocial: String
    let horaInicio: String
    let horaFin: String
    
    init(json: JSON){
        id = json[Constants.Eventos.id].stringValue
        nombre = json[Constants.Eventos.nombre].stringValue
        descripcion = json[Constants.Eventos.descripcion].stringValue
        imagen = json[Constants.Eventos.imagen].stringValue
        idTipo = json[Constants.Eventos.idTipo].stringValue
        tipo = json[Constants.Eventos.tipo].stringValue
        fechaInicio = json[Constants.Eventos.fechaInicio].stringValue
        fechaFin = json[Constants.Eventos.fechaFin].stringValue
        idEmpresa = json[Constants.Eventos.idEmpresa].stringValue
        razonSocial = json[Constants.Eventos.razonSocial].stringValue
        horaInicio = json[Constants.Eventos.horaInicio].stringValue
        horaFin = json[Constants.Eventos.horaFin].stringValue
    }
}
