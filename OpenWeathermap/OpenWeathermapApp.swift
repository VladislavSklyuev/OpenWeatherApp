//
//  OpenWeathermapApp.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 07.12.2023.
//

import SwiftUI

@main
struct OpenWeathermapApp: App {
    @ObservedObject var network = NetworkCheckService.shared
    var loc = LocationService()
    var body: some Scene {
        WindowGroup {
            if network.isConnected {
                StartView()
                //MainView().preferredColorScheme(.dark)
            } else {
                CacheWeatherView().preferredColorScheme(.dark)
            }
        }
    }
}


