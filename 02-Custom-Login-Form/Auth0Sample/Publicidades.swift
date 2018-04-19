//
//  Publicidades.swift
//  GuiApp
//
//  Created by Fernando Garay on 19/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.

import Foundation
import SwiftyJSON

class Publicidades {
    
    let publicidades : [Publicidad]
    
    init (json: JSON){
        
        var auxPublicidades = [Publicidad]()
        
        for (_,subjson):(String, JSON) in json[]{
            var publicidad : Publicidad
            publicidad = Publicidad(json: subjson)
            auxPublicidades.append(publicidad)
        }
        publicidades = auxPublicidades
    }
}
