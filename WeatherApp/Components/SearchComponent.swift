//
//  SearchComponent.swift
//  WeatherApp
//
//  Created by Las Suleman on 1/3/23.
//

import SwiftUI

struct SearchComponent: View {
    @State var searchText = ""
    @FocusState private var nameIsFocused: Bool
    @EnvironmentObject var currentWeather:WeatherViewModel
    @EnvironmentObject var locationManager:LocationManager
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "location.north.circle.fill")
                    .resizable()
                    .frame(width: 30,height: 30)
            }
            
            ZStack(alignment:.leading){
                
                TextField("", text: $searchText,onCommit: {
                    Task{
                        
                        await currentWeather.getCityweather(cityName: searchText)
                    }
                })
                .padding(5)
                .background(
                    Color(.gray)
                )
                .cornerRadius(3)
                if(searchText.isEmpty){
                    Text("search..")
                        .padding(5)
                        .foregroundColor(.white)
                }
            }
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 30,height: 30)
        }
        
    }
}

struct SearchComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchComponent()
    }
}
