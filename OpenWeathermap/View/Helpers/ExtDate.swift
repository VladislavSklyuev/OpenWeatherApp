//
//  ExtDate.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 10.12.2023.
//

import Foundation

struct ExtDate {
    func convert(unixTimestamp: TimeInterval, dateFormat: String) -> String {
        let date = Date(timeIntervalSince1970: unixTimestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func convert3(unixTimestamp: TimeInterval) -> String {
        if unixTimestamp <= 59 {
            return Locale.current.identifier == "ru_RU" ? "менее минуты назад" : "Less than a minute ago"
        } else if unixTimestamp >= 60 && unixTimestamp <= 3599  {
            let min = String(Int(unixTimestamp / 60))
            return ("\(min) \(Locale.current.identifier == "ru_RU" ? "мин назад" : "minutes ago")")
        } else if unixTimestamp >= 3600 && unixTimestamp <= 86399 {
            let hour = String(Int(unixTimestamp / 3600))
            return ("\(hour) \(Locale.current.identifier == "ru_RU" ? "часов назад" : "hours ago")")
        }
        return Locale.current.identifier == "ru_RU" ? "Больше дня назад" : "More than a day ago"
    }
}
