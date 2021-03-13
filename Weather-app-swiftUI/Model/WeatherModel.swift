//
//  WeatherModel.swift
//  Weather-app-swiftUI
//
//  Created by Lilian on 08/03/2021.
//

import Foundation

struct WeatherModel: Decodable {
    let city: City
    let list: [Weather]
}

extension WeatherModel {
    var firstDay: Weather? {
        guard let weather = list.first else { return nil }

        return weather
    }

    var secondDay: Weather? {
        guard list.count > 1 else { return nil }

        return list[1]
    }

    var thirdDay: Weather? {
        guard list.count > 2 else { return nil }

        return list[2]
    }

    var fourthDay: Weather? {
        guard list.count > 3 else { return nil }

        return list[3]
    }

    var fifthDay: Weather? {
        guard list.count > 4 else { return nil }

        return list[4]
    }
}
