//
//  Eventos.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class Eventos {
    
    let eventos : [Evento]
    
    init (json: JSON){
        
        var auxEnventos = [Evento]()
        
        for (_,subjson):(String, JSON) in json[]{
            var evento: Evento
            evento = Evento(json: subjson)
            auxEnventos.append(evento)
        }
        eventos = auxEnventos
    }
}
