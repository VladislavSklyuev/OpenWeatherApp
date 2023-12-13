//
//  NetworkTimer.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 12.12.2023.
//

import Foundation

class NetworkTimerService: ObservableObject {
    static let shared = NetworkTimerService()
    @Published var lastRequestTime: Date?
    @Published var timeSinceLastRequest: TimeInterval = 0.0
    
    private init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if let lastRequestTime = self.lastRequestTime {
                self.timeSinceLastRequest = Date().timeIntervalSince(lastRequestTime)
            }
        }
    }
    
    func updateLastRequestTime() {
        lastRequestTime = Date()
    }
}
