//
//  UDService.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 13.12.2023.
//

import Foundation
class UDService {
    static let shared = UDService(); private init() { }
    private let ud = UserDefaults.standard
    
    
    func saveCurrentWeather(data: Data, key: String) {
        ud.setValue(data, forKey: key)
    }

    func setLastRequestTimeWith(date: Date?, key: String) {
        ud.setValue(date, forKey: key)
    }
    
    func getCurrentWeather(key: String) -> Data? {
        if let currentWeather = ud.object(forKey: key) as? Data {
            return currentWeather
        }
        return nil
    }

    func getLastRequestTimeWith(key: String) -> Date? {
        if let requestTime = ud.object(forKey: key) as? Date {
            return requestTime
        }
       return nil
    }
    
}
