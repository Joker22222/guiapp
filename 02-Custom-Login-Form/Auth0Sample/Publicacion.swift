//
//  publicacion.swift
//  GuiApp
//
//  Created by Fernando  on 2/26/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import SwiftyJSON
import Foundation

class Publicacion {
    
    let id : String
    let titulo: String
    let imagen: String
    let descripcion: String
    let idEmpresa: String
    let razonSocial: String
    let dirty: String
    let destacada: String
    let fechaModificacion: String
   

    init(json: JSON){
        
        id = json[Constants.Publicaciones.titulo].stringValue
        titulo = json[Constants.Publicaciones.titulo].stringValue
        imagen = json[Constants.Publicaciones.imagen].stringValue
        descripcion = json[Constants.Publicaciones.descripcion].stringValue
        idEmpresa = json[Constants.Publicaciones.idEmpresa].stringValue
        razonSocial = json[Constants.Publicaciones.razonSocial].stringValue
        destacada = json[Constants.Publicaciones.destacada].stringValue
        dirty = json[Constants.Publicaciones.dirty].stringValue
        fechaModificacion = json[Constants.Publicaciones.fechaModificacion].stringValue
    }
}

