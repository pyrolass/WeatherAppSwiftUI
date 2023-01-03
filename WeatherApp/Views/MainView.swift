//
//  MainView.swift
//  WeatherApp
//
//  Created by Las Suleman on 1/3/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var currentWeather = WeatherViewModel()
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            .edgesIgnoringSafeArea(.all)
            VStack(alignment:.leading){
                
                SearchComponent()
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(
                        width: 80,height: 80)
                    .padding(.vertical,20)
                
                Text("\(currentWeather.weatherModel?.main.temp ?? 0) C")
                    .font(.system(size: 50))
                    .bold()
                    .padding(.vertical,20)
                
                Text(currentWeather.weatherModel?.name ?? "")
                    .font(.title)
                
                
                Spacer()
            }
            .padding()
        }
        .environmentObject(currentWeather)
        .environmentObject(locationManager)
        .task {
            await currentWeather.getCurrentWeather(lat: locationManager.location?.latitude ?? 0, long: locationManager.location?.longitude ?? 0)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
