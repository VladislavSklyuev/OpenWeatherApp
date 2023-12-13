//
//  ExtString.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 10.12.2023.
//

import Foundation

struct ExtString {
    func convert(temp: Double) -> String {
        let temp = String(format: "%.f",temp)
        return temp
    }
}

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
