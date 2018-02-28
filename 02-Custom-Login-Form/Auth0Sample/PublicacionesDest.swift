//
//  PublicacionesDest.swift
//  GuiApp
//
//  Created by Fernando  on 2/28/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class PublicacionesDest {
    
    let publicacionesDest : [PublicacionDest]
    
    init (json: JSON){
        
        var auxPublicacionesDest = [PublicacionDest]()
        
        for (_,subjson):(String, JSON) in json[]{
            var publicacionDest : PublicacionDest
            publicacionDest = PublicacionDest(json: subjson)
            auxPublicacionesDest.append(publicacionDest)
        }
        publicacionesDest = auxPublicacionesDest
    }
}
