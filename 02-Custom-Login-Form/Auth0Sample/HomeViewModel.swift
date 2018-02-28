//
//  HomeViewModel.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
protocol HomeViewModelDelegate {
    func finishedGettingEventos()
    func finishedGettingPublicaciones()
    func finishedGettingPublicacionesDest()
    func finishedGettingEventosWithError(_ error: NSError)
}

class HomeViewModel{
    
    var delegate: HomeViewModelDelegate?
    var eventos : Eventos?
    var listaEventos : [Evento]?
    var publicaciones : Publicaciones?
    var listaPublicaciones: [Publicacion]?
    var publicacionesDest : PublicacionesDest?
    var listaPublicacionesDest: [PublicacionDest]?
    
    init(){
        //Evetos
        APIClient.getEventos { (result, error) in
            if error == nil {
                self.eventos = result
                self.listaEventos = self.eventos?.eventos
                self.delegate?.finishedGettingEventos()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        }
        
        //Publicaciones
        APIClient.getPublicaciones { (result, error) in
            if error == nil {
                self.publicaciones = result
                self.listaPublicaciones = self.publicaciones?.publicaciones
                self.delegate?.finishedGettingPublicaciones()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        }
        
        //Publicaciones Destacadas
        APIClient.getPublicacionesDest { (result, error) in
            if error == nil {
                self.publicacionesDest = result
                self.listaPublicacionesDest = self.publicacionesDest?.publicacionesDest
                self.delegate?.finishedGettingPublicacionesDest()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        }
    
    }
    
}

