//
//  NetWorkConstants.swift
//  movieAPP
//
//  Created by AMN on 3/30/22.
//

import Foundation
class NetworkConstants {
    
    static let shared = NetworkConstants()
    
    let baseURL = "https://api.themoviedb.org/3/discover/movie"
    let key = "32c6fcb48eb9f8aba840a7e9dbe4188c"
    let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    
    func headers() -> [String:Any]{
        return ["x-device":"ios"]
    }
    
}
