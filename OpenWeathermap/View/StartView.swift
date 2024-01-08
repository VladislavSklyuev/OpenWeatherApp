//
//  StartView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 13.12.2023.
//

import SwiftUI
import CoreLocation

struct StartView: View {
    @ObservedObject var locationManager = LocationService()
    
    var body: some View {
        if locationManager.status == .authorizedWhenInUse {
            MainView()
        } else {
            Text("Добро пожаловать в погодное приложение!").preferredColorScheme(.dark)
                .onAppear(perform:locationManager.locationManager.requestWhenInUseAuthorization)
        }
    }
}
