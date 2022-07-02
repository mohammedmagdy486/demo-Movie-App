//
//  NetworkLayer.swift
//  movieAPP
//
//  Created by AMN on 3/30/22.
//

import Foundation
import Alamofire

enum TaskType {
    case plainRequest
    case parametersRequest(parameter:[String:Any],encoding:ParameterEncoding)
}

protocol TargetType{
    var baseUrl:String { get }
    var headers:HTTPHeaders? { get }
    var parameters:[String:Any] { get }
    var encoding:ParameterEncoding{get}
    var HTTPMethod: HTTPMethod { get }
}
