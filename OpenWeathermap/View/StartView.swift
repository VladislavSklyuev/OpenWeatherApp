//
//  StartView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 13.12.2023.
//

import SwiftUI
import CoreLocation

struct StartView: View {
    @StateObject var locationManager = LocationService()
    
    var body: some View {
        if locationManager.status == .authorizedWhenInUse {
            MainView().preferredColorScheme(.dark)
        } else {
            Text("Добро пожаловать в погодное приложение!").preferredColorScheme(.dark)
                .onAppear(perform:locationManager.locationManager.requestWhenInUseAuthorization)
        }
    }
}

#Preview {
    StartView()
}

//extension StartView: NSObject, CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        authorizationStatus = manager.authorizationStatus
//    }
//}
