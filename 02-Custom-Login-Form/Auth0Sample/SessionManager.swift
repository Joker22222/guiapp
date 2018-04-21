//
//  SessionManager.swift
//  GuiApp
//
//  Created by Fernando Garay on 3/1/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import SimpleKeychain
import Auth0

class SessionManager : UsuarioViewModelDelegate {
    
    static let shared = SessionManager()
    private let authentication = Auth0.authentication()
    let credentialsManager: CredentialsManager!
    var profile: UserInfo?
    var credentials: Credentials?
    var viewModel : UsuarioViewModel?
    
    private init () {
        self.credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        _ = self.authentication.logging(enabled: true) // API Logging
        viewModel = UsuarioViewModel()
        viewModel?.delegate = self
    }
    
    func retrieveProfile(_ callback: @escaping (Error?) -> ()) {
        guard let accessToken = self.credentials?.accessToken
            else { return callback(CredentialsManagerError.noCredentials) }
        self.authentication
            .userInfo(withAccessToken: accessToken)
            .start { result in
                switch(result) {
                case .success(let profile):
                    self.profile = profile
                    if (UserDefaults.standard.string(forKey: "Mail") == nil){
                        UserDefaults.standard.set(profile.email, forKey: "Mail")
                        UserDefaults.standard.set(profile.name, forKey: "Name")
                        self.viewModel?.guardar(id: profile.email, nombre: profile.name)
                    }
                
                    callback(nil)
                case .failure(let error):
                    callback(error)
                }
        }
    }
    
    func renewAuth(_ callback: @escaping (Error?) -> ()) {
        // Check it is possible to return credentials before asking for Touch
        guard self.credentialsManager.hasValid() else {
            return callback(CredentialsManagerError.noCredentials)
        }
        self.credentialsManager.credentials { error, credentials in
            guard error == nil, let credentials = credentials else {
                return callback(error)
            }
            self.credentials = credentials
            callback(nil)
        }
    }
    
    func logout() -> Bool {
        // Remove credentials from KeyChain
        self.credentials = nil
        // Clear session from browser
        let webAuth = Auth0.webAuth()
        webAuth.clearSession(federated: true) { _ in }
        return self.credentialsManager.clear()
    }
    
    func store(credentials: Credentials) -> Bool {
        self.credentials = credentials
        // Store credentials in KeyChain
        return self.credentialsManager.store(credentials: credentials)
    }
    func finishSendingUsuario() {
        
    }
    
}


