//
//  BusquedaViewModel.swift
//  GuiApp
//
//  Created by Fernando Garay on 19/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation

protocol BusquedaViewModelDelegate {
    func finishGettingPublicidad()
}

class BusquedaViewModel{
   
    var publicidades: Publicidades?
    var listaPublicidades: [Publicidad]?
    var delegate : BusquedaViewModelDelegate?
    
    init(){
        APIClient.getPublicidad (completion: { (result, error) in
            if error == nil {
                self.publicidades = result
                self.listaPublicidades = self.publicidades?.publicidades
                self.delegate?.finishGettingPublicidad()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        })
    }

}

