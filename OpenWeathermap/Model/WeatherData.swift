//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Владислав Склюев on 18.07.2023.
//

import Foundation

struct WeatherData: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var current: CurrentWeather
    var hourly: [Hourly]
    var daily: [Daily]
}

extension WeatherData {
    struct Hourly: Codable {
        var dt: TimeInterval
        var temp: Double
        var weather: [Weathers]
    }
    
    struct Daily: Codable {
        var dt: TimeInterval
        var temp: Temp
        var weather: [Weath]
    }
    
    struct CurrentWeather: Codable {
        var dt: TimeInterval
        var temp: Double
        var weather: [Weather]
    }
    
    struct Weath: Codable {
        var description: String
        var icon: String
    }
    
    struct Weather: Codable {
        var description: String
        var icon: String
    }
    
    struct Weathers: Codable {
        var icon: String
    }
    
    struct Temp: Codable {
        var day: Double
        var min: Double
        var max: Double
        var night: Double
        var eve: Double
        var morn: Double
    }
}
