//
//  GetFilmsNetwork.swift
//  movieAPP
//
//  Created by AMN on 3/30/22.
//

import Foundation
import Alamofire

enum AuthEndPoints {
    case getFilms(apiKey: String,page: Int)
}

extension AuthEndPoints: TargetType {
    var parameters: [String : Any] {
        switch self{
        case .getFilms(apiKey: let apiKey, page: let page):
            let params = [
                "api_key": apiKey,
                "page": page
            ] as [String : Any]
            return params
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var HTTPMethod: HTTPMethod {
        return .get
    }
    
    var baseUrl: String {
        return NetworkConstants.shared.baseURL
    }
    
    var headers: HTTPHeaders? {
        return NetworkConstants.shared.headers() as? HTTPHeaders
    }
    
}
