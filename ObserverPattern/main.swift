//
//  main.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/07.
//

import Foundation

print("Hello, World!")

//WeatherData 객체 생성
let weatherData = WeatherData()


let currentDisplay = CurrentConditionsDisplay(weatherData: weatherData)

let heatIndexDisplay = HeatIndexDisplay(weatherData: weatherData)

let statisticsDisplay = StatisticsDisplay(weatherData: weatherData)

weatherData.setMeasurements(25.0, 60.0,101.2)
weatherData.setMeasurements(28.5, 55.5, 101.0)
