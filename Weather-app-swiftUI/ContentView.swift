//
//  ContentView.swift
//  Weather-app-swiftUI
//
//  Created by Lilian on 08/03/2021.
//

import Foundation
import SwiftUI

struct ContentView: View {
    private let weatherViewModel = WeatherViewModel()
    @State private var weather: WeatherModel?
    @State private var showPopUp: Bool = false
    @State private var text: String = ""
    @State private var city: String = "Bordeaux"
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
            VStack {
                Text(weather?.city.fullName ?? "")
                    .font(.system(size: 50, weight:.medium, design:.default))
                    .foregroundColor(Color.white)
                    .padding()
                Image(systemName: weather?.firstHour?.imageName ?? "")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text(weather?.firstHour?.temperature.formattedCelsius ?? "")
                    .font(.system(size: 50, weight:.medium, design:.default))
                    .foregroundColor(Color.white)
                    .padding(Edge.Set.bottom, 40)
                
                HStack(spacing: 20) {
                    HourlyWeather(hourlyWeather: weather?.firstHour)
                    HourlyWeather(hourlyWeather: weather?.secondHour)
                    HourlyWeather(hourlyWeather: weather?.thirdHour)
                    HourlyWeather(hourlyWeather: weather?.fourthHour)
                    HourlyWeather(hourlyWeather: weather?.fifthHour)
                }
                .padding(.horizontal, 50)
                Spacer()
                Button {
                    self.text = ""
                    self.showPopUp = true
                } label: {
                    Text("Choisir une autre ville")
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(4)
                }.padding(.bottom, 10)
            }
            if self.showPopUp == true {
                PopUpCity(showPopUp: self.$showPopUp, text: self.$text, onDone: {text in loadData(city: text)})
            }
        } .onAppear(perform: { loadData(city: city) })
    }
    
    var colors: [Color] {
        if weather?.firstHour?.temperature.isCold ?? true {
            return [Color.blue , Color("lightBlue")]
        } else {
            return [Color.red , Color("lightRed")]
        }
    }
    
    private func loadData(city: String) {
        weatherViewModel.showHandler = { weather in
            DispatchQueue.main.async {
                self.weather = weather
            }
        }
        weatherViewModel.getWeather(city: city)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
