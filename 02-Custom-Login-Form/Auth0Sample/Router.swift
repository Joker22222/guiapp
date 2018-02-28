//
//  Router.swift
//  GuiApp
//
//  Created by Fernando  on 2/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {

    static let baseURLString = Constants.URL.base

    case Eventos()


    func asURLRequest() throws -> URLRequest{
        let result: (path: String, parameters: [String: AnyObject]?, httpMethod: HTTPMethod) = {
            switch self {
                
                case .Eventos():
                    return (Constants.URL.eventosLista, nil as [String : AnyObject]?, HTTPMethod.get)
                }
            }()
        
            let url = try Router.baseURLString.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = result.httpMethod.rawValue
            return try URLEncoding.default.encode(urlRequest, with: result.parameters)
        
        }
    }

