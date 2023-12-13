//
//  SearchViewModel.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 11.12.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var cityName = ""
    @Published var currentGeo = GeoDict()
    @Published var currentWeather: WeatherData?
    @Published var showAlertSearchFalse = false
    @Published var showAlertFalseRequest = false
    @Published var showAlertFalseResponse = false
    @Published var showAlertFalseURL = false
    
    func fetchGeo(the: String) {
        Task {
            do {
                let geo = try await NetworkService.shared.getCurrentGeo(city: the)
                DispatchQueue.main.async {
                    self.currentGeo = geo
                    self.cityName = ""
                }
            } catch NetworkError.badURL {
                DispatchQueue.main.async {
                    self.showAlertFalseURL.toggle()
                }

            } catch NetworkError.badRequest {
                DispatchQueue.main.async {
                    self.showAlertFalseRequest.toggle()
                }
            } catch NetworkError.badResponse {
                DispatchQueue.main.async {
                    self.showAlertFalseResponse.toggle()
                }
            } catch NetworkError.errorDecoding {
                DispatchQueue.main.async {
                    self.showAlertSearchFalse.toggle()
                }
            }

        }
    }

    func fetchWeather() {
        
        Task {
                do {
                    let weather = try await NetworkService.shared.getFoundWeather(lat: currentGeo[0].lat, lon: currentGeo[0].lon, measurement: Locale.current.identifier == "ru_RU" ? .metric : .imperial)
                    DispatchQueue.main.async {
                        self.currentWeather = weather
                        self.cityName = ""
                    }
                } catch {
                    print(error)
                }
        }
    }
}
