//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Las Suleman on 1/3/23.
//

import Foundation


struct WeatherModel:Codable{
   
    let main:Main
    let name:String?
    
    enum CodingKeys:String,CodingKey{
    
        case main = "main"
        case name = "name"
    }
}


struct Weather:Codable{
    let current:String?
    
    enum CodingKeys:String,CodingKey{
        case current = "main"
    }
}


struct Main:Codable{
    let temp:Double?
    
    enum CodingKeys:String,CodingKey{
        case temp = "temp"
    }
}
