//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Владислав Склюев on 18.07.2023.
//

import Foundation

class NetworkService {
    static let shared = NetworkService(); private init() {}
    
    func getCurrentWeather(lat: Double, lon: Double, measurement: Measurement, lang: Language) async throws -> WeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=b9c81050cef9855eeaca27cf97ae5d26&units=\(measurement)&lang=\(lang)") else { throw NetworkError.badURL }
        
        let response = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response.1 as? HTTPURLResponse else { throw NetworkError.badRequest }
        if httpResponse.statusCode == 200 {
            let data = response.0
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(weatherData) {
                UDService.shared.saveCurrentWeather(data: encoded, key: "currentWeather")
            }
            print(httpResponse.statusCode)
            
            return weatherData
            
        } else {
            throw NetworkError.badResponse
        }
    }
    
    func getFoundWeather(lat: Double, lon: Double, measurement: Measurement) async throws -> WeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=b9c81050cef9855eeaca27cf97ae5d26&units=\(measurement)&lang=ru")  else { throw NetworkError.badURL }
        let response = try await URLSession.shared.data(from: url)
        print(lat, lon)
        
        guard let httpResponse = response.1 as? HTTPURLResponse else { throw NetworkError.badRequest }
            guard httpResponse.statusCode == 200 else { throw NetworkError.badResponse }
            let data = response.0
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            
            return weatherData
        }
    
    func getCurrentGeo(city: String) async throws -> GeoDict {
        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&appid=b9c81050cef9855eeaca27cf97ae5d26") else { throw NetworkError.badURL }
        
        let response = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response.1 as? HTTPURLResponse else { throw NetworkError.badRequest }
        print(httpResponse)
        if httpResponse.statusCode == 200 {
            let data = response.0
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let weatherData = try? decoder.decode(GeoDict.self, from: data) else { throw NetworkError.errorDecoding }
            print(weatherData)
            return weatherData
            
        } else {
            throw NetworkError.badResponse
        }
    }
}

enum NetworkError: Error {
    case badURL
    case badRequest
    case badResponse
    case errorDecoding
}
