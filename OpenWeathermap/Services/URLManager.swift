//
//  URLManager.swift
//  WeatherApp
//
//  Created by Владислав Склюев on 18.07.2023.
//

import Foundation

class URLManager {
    static let shared = URLManager(); private init() { }
    
    private let gateway = "https://"
    private let server = "api.openweathermap.org"
    private let appid = "b9c81050cef9855eeaca27cf97ae5d26"
    
    func createUrl(method: Endpoint, city: String) -> URL? {
        var str = gateway + server + method.rawValue + "?" 
        let params = ["q": city,
                      "appid": appid,
                      "units": "metric",
                      "lang": "ru"
        ]
        
        for (name, value) in params {
            str += "\(name)=\(value)&"
        }
        str.removeLast()
        print(str)
        let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall/timemachine?lat=39.099724&lon=-94.578331&dt=1643803200&appid=1bc59b3eccdc14e6551993e7be4ce816")
        return url
        
    }
    
}

enum Endpoint: String {
    case currentWeather = "/data/2.5/weather"
    case oneCall = "/data/2.5/onecall"
}

//https:// api.openweathermap.org /data/2.5/weather ? q=пермь&appid=b9c81050cef9855eeaca27cf97ae5d26&units=metric&lang=ru
//https://run.mocky.io /v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3
