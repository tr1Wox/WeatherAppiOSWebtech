//
//  ContentView.swift
//  Weather-app-swiftUI
//
//  Created by Lilian on 08/03/2021.
//

import SwiftUI

struct ContentView: View {
    private let weatherViewModel = WeatherViewModel()
    @State private var weather: WeatherModel?

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color("lightBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
        }
        .onAppear(perform: loadData)
    }

    private func loadData() {
        weatherViewModel.showHandler = { weather in
            DispatchQueue.main.async {
                self.weather = weather
            }
        }
        weatherViewModel.getWeather()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
