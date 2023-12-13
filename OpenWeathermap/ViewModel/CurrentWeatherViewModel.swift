//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Владислав Склюев on 18.07.2023.
//

import Foundation
import CoreLocation
import SwiftUI

class CurrentWeatherViewModel: ObservableObject {
    @ObservedObject var ls = LocationService()
    let currentLocale = Locale.current.identifier
    @Published var currentWeather: WeatherData?
    
    init() {
        fetchCurrentWeather()
    }
    
    func fetchCurrentWeather() {
        Task {
//            if let lat = ls.locationManager.location?.coordinate.latitude,
//               let lon = ls.locationManager.location?.coordinate.longitude {

                do {
                    let weather = try await NetworkService.shared.getCurrentWeather(lat: ls.latitude, lon: ls.longitude, measurement: currentLocale == "ru_RU" ? .metric : .imperial, lang: currentLocale == "ru_RU" ? .ru : .en)
                    print(weather.current.weather[0].icon)
                    DispatchQueue.main.async {
                        self.currentWeather = weather
                    }
                } catch NetworkError.badURL {
                    print("Некорректный URL")
                } catch NetworkError.badRequest {
                    print("Некорректный запрос")
                } catch NetworkError.badResponse {
                    print("Некорректный ответ")
                }
            //}
        }
        //print(currentLocale)
        NetworkTimerService.shared.updateLastRequestTime()
        UDService.shared.setLastRequestTimeWith(date: NetworkTimerService.shared.lastRequestTime, key: "Last")
    }
}

enum Measurement: String {
    case metric = "metric"
    case imperial = "imperial"
}

enum Language: String {
    case ru = "ru"
    case en = "en"
}
