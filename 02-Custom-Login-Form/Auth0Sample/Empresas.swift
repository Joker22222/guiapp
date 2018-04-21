//
//  Empresas.swift
//  GuiApp
//
//  Created by Fernando Garay on 20/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SwiftyJSON

class Empresas {
    
    let empresas : [Empresa]
    
    init (json: JSON){
        
        var auxEmpresas = [Empresa]()
        
        for (_,subjson):(String, JSON) in json[]{
            var empresa : Empresa
            empresa = Empresa(json: subjson)
            auxEmpresas.append(empresa)
        }
        empresas = auxEmpresas
    }
}
