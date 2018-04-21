//
//  APIClient.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    let eventosUrl = Constants.URL.base+Constants.URL.eventosLista
    
    //EVENTOS
    class func getEventos(completion:@escaping (_ resultArray: Eventos?, _ error: NSError?)->()){
        Alamofire.request(Constants.URL.base + Constants.URL.eventosLista, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
            switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let eventosObject = Eventos(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(eventosObject, nil)
                    })
                
                case .failure(let error):
                return
            }
        })
    }
    
    //PUBLICACIONES
    class func getPublicaciones(completion:@escaping (_ resultArray: Publicaciones?, _ error: NSError?)->()){
        Alamofire.request(Constants.URL.base + Constants.URL.publicacionesLista, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicacionObject = Publicaciones(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicacionObject, nil)
                    })
                    
                case .failure(let error):
                    return
                }
            })
    }
    
    //PUBLICACIONES Destacadas
    class func getPublicacionesDest(completion:@escaping (_ resultArray: PublicacionesDest?, _ error: NSError?)->()){
        Alamofire.request(Constants.URL.base + Constants.URL.publicacionesDestLista, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicacionObjectDest = PublicacionesDest(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicacionObjectDest, nil)
                    })
                    
                case .failure(let error):
                    return
                }
            })
    }
    
    //BUSQUEDA PARAM
    class func getResultadosDeBusquedaParam(_ parametros:[[String: Any]], completion:@escaping (_ resultArray: ResultadosDeBusqueda?, _ error: NSError?)->()){
        
        var request = URLRequest(url: URL(string:Constants.URL.base + Constants.URL.resultadoDeBusquedaParam)!)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametros)
        
        Alamofire.request(request)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicacionObject = ResultadosDeBusqueda(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicacionObject, nil)
                    })
                    
                case .failure(let error):
                    return
                }
            })
    }
    
    //BUSQUEDA CAT
    class func getResultadosDeBusquedaCat(_ parametros:[[String: Any]], completion:@escaping (_ resultArray: ResultadosDeBusqueda?, _ error: NSError?)->()){
        
        var request = URLRequest(url: URL(string:Constants.URL.base + Constants.URL.resultadoDeBusquedaCat)!)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametros)
        
        Alamofire.request(request)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicacionObject = ResultadosDeBusqueda(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicacionObject, nil)
                    })
                    
                case .failure(let error):
                    return
                }
            })
    }
    
    //PUBLICIDAD
    class func getPublicidad(completion:@escaping (_ resultArray: Publicidades?, _ error: NSError?)->()){
        Alamofire.request(Constants.URL.base + Constants.URL.publicidad, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicidadesObject = Publicidades(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicidadesObject, nil)
                    })
                case .failure(let error):
                    return
                }
            })
    }
    
    //POST EMPRESAS
    class func postEmpresas(_ parametros:[String: Any], completion:@escaping (_ error: NSError?)->()){
        
        var request = URLRequest(url: URL(string:Constants.URL.base + Constants.URL.postEmpresas)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametros)
        
        Alamofire.request(request).responseJSON
            { (response:DataResponse<Any>) in
                if let responseStatus = (response.response?.statusCode) {
                    switch responseStatus {
                    case 200 :
                        //not parsing group ID here
                        completion(nil)
                    default :
                        return
                    }
                }
        }
    }
    
    class func postUsuarios(_ parametros:[String: Any], completion:@escaping (_ error: NSError?)->()){
        
        var request = URLRequest(url: URL(string:Constants.URL.base + Constants.URL.postUsuarios)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametros)
        
        Alamofire.request(request).responseJSON
            { (response:DataResponse<Any>) in
                if let responseStatus = (response.response?.statusCode) {
                    switch responseStatus {
                    case 200 :
                        //not parsing group ID here
                        completion(nil)
                    default :
                        return
                    }
                }
        }
    }
    
    class func getEmpresas(_ id:String, completion:@escaping (_ resultArray: Empresas?, _ error: NSError?)->()){
        Alamofire.request(Constants.URL.base + Constants.URL.getEmpresas + id, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let publicidadesObject = Empresas(json: json)
                    OperationQueue.main.addOperation({ () -> Void in
                        completion(publicidadesObject, nil)
                    })
                case .failure(let error):
                    return
                }
            })
    }
    
    class func putEmpresas(_ id:String, _ parametros:[String: Any], completion:@escaping (_ error: NSError?)->()){
        
        var request = URLRequest(url: URL(string:Constants.URL.base + Constants.URL.postEmpresas + "/" + id)!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametros)
        
        Alamofire.request(request).responseJSON
            { (response:DataResponse<Any>) in
                if let responseStatus = (response.response?.statusCode) {
                    switch responseStatus {
                    case 200 :
                        //not parsing group ID here
                        completion(nil)
                    default :
                        return
                    }
                }
        }
    }
}
