//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Las Suleman on 1/3/23.
//

import Foundation


@MainActor class WeatherViewModel:ObservableObject{
    
    @Published var weatherModel:WeatherModel?
    
    func getCurrentWeather(lat:Double,long:Double)async{
        print("current")
        let data = try? await NetworkingHandler.getRequest(urlString: "/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(apiKey ?? "")&units=metric")
        do{
            if(data != nil){
               
                let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data!)
                weatherModel = decodedData
            }
        }
        catch let err{
            print(err)
        }
    }
    
    func getCityweather(cityName:String)async{
        print("city")
        let data = try? await NetworkingHandler.getRequest(urlString: "/data/2.5/weather?q=\(cityName)&appid=\(apiKey ?? "")&units=metric")
        do{
            if(data != nil){
               
                let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data!)
                weatherModel = decodedData
            }
        }
        catch let err{
            print(err)
        }
    }
}
