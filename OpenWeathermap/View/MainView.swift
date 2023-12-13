//
//  MainView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 07.12.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                CurrentWeatherView().tabItem { Label("", systemImage: "location") }
                SearchWeatherView().tabItem { Label("", systemImage: "list.dash") }
            }
    }
}

#Preview {
    MainView()
}
