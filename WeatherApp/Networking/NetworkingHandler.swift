//
//  NetworkingHandler.swift
//  WeatherApp
//
//  Created by Las Suleman on 1/3/23.
//

import Foundation

class NetworkingHandler{
    
    
    static func getRequest(urlString:String)async throws -> Data {
        guard let url = URL(string: baseUrl.appending(urlString))
        else{fatalError("bas url")}
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        }
        catch let err{
            throw err
        }
    }
}
