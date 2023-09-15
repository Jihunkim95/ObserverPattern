//
//  HeatIndexDisplay.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/08.
//

import Foundation

public class HeatIndexDisplay : Observer,DisplayElement {
    
    var temperature : Double = 0
    var humidity : Double = 0
    var pressure : Double = 0
    var HeatIndex : Double = 0
    
    let weatherData : WeatherData
    
    init(weatherData : WeatherData){
        self.weatherData = weatherData
        //CurrentConditionDisplay에서 날씨데이터를 등록
        weatherData.resisterObserver(self)
    }
    
    func update() {
        self.temperature = weatherData.getTemperature()
        self.humidity = weatherData.getHumidity()
        self.pressure = weatherData.getPressure()
        self.HeatIndex = computeHeatIndex(temperature,humidity)

        display()
    }
    
    func display() {
        print("체감 온도 :\(HeatIndex)")
    }
    
    func computeHeatIndex(_ t: Double,_ rh: Double) -> Double {
        let index = Double(16.923 + (0.185212 * t) + (5.37941 * rh) - (0.100254 * t * rh) +
                          (0.00941695 * (t * t)) + (0.00728898 * (rh * rh)) +
                          (0.000345372 * (t * t * rh)) - (0.000814971 * (t * rh * rh)) +
                          (0.0000102102 * (t * t * rh * rh)) - (0.000038646 * (t * t * t)) +
                          (0.0000291583 * (rh * rh * rh)) + (0.00000142721 * (t * t * t * rh)) +
                          (0.000000197483 * (t * rh * rh * rh)) - (0.0000000218429 * (t * t * t * rh * rh)) +
                          (0.000000000843296 * (t * t * rh * rh * rh)) -
                          (0.0000000000481975 * (t * t * t * rh * rh * rh)))
        return index
    }

}
