//
//  Publicaciones.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class Publicaciones {
    
    let publicaciones : [Publicacion]
    
    init (json: JSON){
        
        var auxPublicaciones = [Publicacion]()
        
        for (_,subjson):(String, JSON) in json[]{
            var publicacion : Publicacion
            publicacion = Publicacion(json: subjson)
            auxPublicaciones.append(publicacion)
        }
        publicaciones = auxPublicaciones
    }
}
