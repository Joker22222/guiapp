//
//  Constants.swift
//  GuiApp
//
//  Created by Fernando  on 2/26/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation

struct Constants {
    
    struct URL {
        static let base = "http://guiappworldwide.com/admin/api/"
        static let eventosLista = "evento/l"
        static let publicacionesLista = "publicacion/listabackoffice"
        static let publicacionesDestLista = "publicacion/destacadas"
    }

    struct Publicaciones {
        static let id = "id"
        static let titulo = "titulo"
        static let imagen = "imagen"
        static let descripcion = "descripcion"
        static let idEmpresa = "idempresa"
        static let razonSocial = "razonSocial"
        static let destacada = "destacada"
        static let fechaModificacion = "fecmodificacion"
        static let dirty = "dirty"
    }
   
    struct Eventos {
        static let id = "id"
        static let nombre = "nombre"
        static let descripcion = "descripcion"
        static let imagen = "imagen"
        static let idTipo = "idtipo"
        static let tipo = "deportes"
        static let ubicacion = "ubicacion"
        static let fechaInicio = "fecinicio"
        static let fechaFin = "fecfin"
        static let idEmpresa = "idempresa"
        static let razonSocial = "razonSocial"
        static let horaInicio = "horainicio"
        static let horaFin = "horafin"
    }
    
}
