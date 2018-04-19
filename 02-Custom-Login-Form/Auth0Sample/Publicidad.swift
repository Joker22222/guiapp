//
//  Publicidad.swift
//  GuiApp
//
//  Created by Fernando Garay on 19/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class Publicidad {
    
    let id : String
    let idSponsor: String
    let fecInicio: String
    let fecFin: String
    let imagen: String
    let url: String
    
    init(json: JSON){
        id = json[Constants.Publicidad.id].stringValue
        idSponsor = json[Constants.Publicidad.idSponsor].stringValue
        fecInicio = json[Constants.Publicidad.fecInicio].stringValue
        fecFin = json[Constants.Publicidad.fecFin].stringValue
        imagen = json[Constants.Publicidad.imagen].stringValue
        url = json[Constants.Publicidad.url].stringValue
    }
}
