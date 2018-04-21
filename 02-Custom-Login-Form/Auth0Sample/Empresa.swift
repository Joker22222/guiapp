//
//  Empresa.swift
//  GuiApp
//
//  Created by Fernando Garay on 20/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON


class Empresa {
    
    let id : String
    let razonSocial: String
    let cuit: String
    let medioPago: String
    let estado: String
    let logo: String
    let facebook: String
    let twitter: String
    let instagram: String
    let palabrasClave: String
    let dirty: String
    let web: String
    let descripcion: String
    let idCuenta: String
    
    init(json: JSON){
        
        id = json[Constants.ResultadosDeBusqueda.id].stringValue
        razonSocial = json[Constants.Empresa.razonSocial].stringValue
        cuit = json[Constants.Empresa.cuit].stringValue
        medioPago = json[Constants.Empresa.medioDePago].stringValue
        estado = json[Constants.Empresa.estado].stringValue
        logo = json[Constants.Empresa.logo].stringValue
        facebook = json[Constants.Empresa.facebook].stringValue
        twitter = json[Constants.Empresa.twitter].stringValue
        instagram = json[Constants.Empresa.instagram].stringValue
        palabrasClave = json[Constants.Empresa.palabrasclave].stringValue
        dirty = json[Constants.Empresa.dirty].stringValue
        web = json[Constants.Empresa.web].stringValue
        descripcion = json[Constants.Empresa.descripcion].stringValue
        idCuenta = json[Constants.Empresa.idCuenta].stringValue
    }
}
