//
//  ForecastModels.swift
//  WeatherForecast
//
//  Created by Алексей Гвоздков on 18.05.2025.
//

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let date: String
    let day: DayWeather
}

struct DayWeather: Codable {
    let avgtempC: Double
    let maxwindKph: Double
    let avghumidity: Double
    let condition: WeatherCondition

    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case maxwindKph = "maxwind_kph"
        case avghumidity
        case condition
    }
}

struct WeatherCondition: Codable {
    let text: String
    let icon: String
}
