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
        static let resultadoDeBusquedaParam = "empresa/b"
        static let resultadoDeBusquedaCat = "empresa/c2"
        static let publicidad = "publicidad/2"
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
        static let tipo = "tipo"
        static let ubicacion = "ubicacion"
        static let fechaInicio = "fecinicio"
        static let fechaFin = "fecfin"
        static let idEmpresa = "idempresa"
        static let razonSocial = "razonSocial"
        static let horaInicio = "horainicio"
        static let horaFin = "horafin"
    }
    
    struct ResultadosDeBusqueda {
        static let id = "id"
        static let idEmpresa = "idempresa"
        static let razonSocial = "razonsocial"
        static let estado = "estado"
        static let idCategoria = "idcategoria"
        static let direccion = "direccion"
        static let idPais = "idpais"
        static let idProvincia = "idprovincia"
        static let idLocalidad = "idlocalidad"
        static let telefono = "telefono"
        static let delivery = "delivery"
        static let veinticuatrohs = "veinticuatrohs"
        static let diasHorarios = "diashorarios"
        static let dirty = "dirty"
        static let palabrasClave = "palabrasClave"
        static let distancia = "distancia"
    }
    
    struct Publicidad {
        static let id = "id"
        static let idSponsor = "idsponsor"
        static let fecInicio = "fecinicio"
        static let fecFin = "fecfin"
        static let imagen = "imagen"
        static let url = "url"
    }
}
