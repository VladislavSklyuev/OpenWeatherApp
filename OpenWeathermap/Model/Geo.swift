//
//  Geo.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 11.12.2023.
//

import Foundation

struct Geo: Codable {
    var name: String
    var lat: Double
    var lon: Double
    var localNames: LocalNames
}

extension Geo {
    struct LocalNames: Codable {
        var ru: String
    }
}

typealias GeoDict = [Geo]
