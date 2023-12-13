//
//  CacheWeatherViewModel.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 12.12.2023.
//

import Foundation

class CacheWeatherViewModel: ObservableObject {
    @Published var cacheWeather: WeatherData?
    @Published var lastRequestTime: TimeInterval = 0.0
    
    init() {
        getSavedWeather()
    }
    
    func getSavedWeather() {
        if let data = UDService.shared.getCurrentWeather(key: "currentWeather") {
            let decoder = JSONDecoder()
            if let myData = try? decoder.decode(WeatherData.self, from: data) {
                cacheWeather = myData
            } else {
                print("Ошибка декодирования")
            }
        } else {
            print("В хранилище нет экземпляра погоды")
        }
        getLastRequestTime()
    }
    
    func getLastRequestTime() {
        if let lastRequestTime = UDService.shared.getLastRequestTimeWith(key: "Last") {
            let currentTime = Date()
            let timeDifference = currentTime.timeIntervalSince(lastRequestTime)
            self.lastRequestTime = timeDifference
        } else {
            print("В хранилище нет времени")
        }
    }
}
