//
//  NetworkCheck.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 12.12.2023.
//

import Foundation
import Network

final class NetworkCheckService: ObservableObject {
    static let shared = NetworkCheckService()
    private let monitor: NWPathMonitor
    @Published var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?
    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")

    private init() {
        monitor = NWPathMonitor()
        startMonitoring()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status != .unsatisfied
            }
            
            self?.isExpensive = path.isExpensive
            self?.currentConnectionType = NWInterface.InterfaceType.allCases.filter { path.usesInterfaceType($0) }.first
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [.other, .wifi, .cellular, .loopback, .wiredEthernet]
}
