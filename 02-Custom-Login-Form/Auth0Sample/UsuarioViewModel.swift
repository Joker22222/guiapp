//
//  UsuarioViewModel.swift
//  GuiApp
//
//  Created by Fernando Garay on 20/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation

protocol UsuarioViewModelDelegate {
    func finishSendingUsuario()
}

class UsuarioViewModel{
    var delegate : UsuarioViewModelDelegate?
    init(){
        
    }
    
    func guardar (id: String?, nombre: String?){
        var base64URL = "0"
        if let idCuentabase64 = id?.base64Encoded() {
            base64URL = base64ToBase64url(base64: idCuentabase64)
        }
        let idCuentaBase64URL = base64URL
        
        let parameters : [String: Any] = [
            "id":idCuentaBase64URL,
            "nombre":nombre!,
            "email":id!,
            "provider": "",
            "notificaciones": "0",
            ]
        APIClient.postUsuarios(parameters, completion: { (error) in
            if error == nil {
                self.delegate?.finishSendingUsuario()
            } else {
                //Show error
                //self.delegate?.finishedGettingProjectsWithError(error!)
            }
        })
        
    }
    
    func base64ToBase64url(base64: String) -> String {
        let base64url = base64
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
        return base64url
    }
}


