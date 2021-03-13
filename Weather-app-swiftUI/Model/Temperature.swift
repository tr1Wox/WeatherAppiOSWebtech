//
//  Temperature.swift
//  Weather-app-swiftUI
//
//  Created by Lilian on 08/03/2021.
//

import Foundation

struct Temperature: Decodable {
    let kelvin: Float
    let humidity: Float

    enum CodingKeys: String, CodingKey {
        case kelvin = "temp"
        case humidity
    }
}

extension Temperature {
    var isRainy: Bool {
        humidity > 50
    }
}
