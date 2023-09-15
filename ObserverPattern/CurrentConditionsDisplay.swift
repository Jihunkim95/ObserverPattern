//
//  CurrentConditionsDisplay.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/07.
//

import Foundation

public class CurrentConditionsDisplay : Observer, DisplayElement{
    
    var temperature : Double = 0
    var humidity : Double = 0
    var pressure : Double = 0
    
    let weatherData : WeatherData
    
    init(weatherData : WeatherData){
        self.weatherData = weatherData
        //CurrentConditionDisplay에서 날씨데이터를 등록
        weatherData.resisterObserver(self)
    }
    //update가 호출되면 온도,습도,기압을 저장하고,display호출
    func update() {
        self.temperature = weatherData.getTemperature()
        self.humidity = weatherData.getHumidity()
        self.pressure = weatherData.getPressure()
        display()
    }
    //최근에 받은 데이터 출력
    func display() {
        print("온도 : \(temperature),습도 : \(humidity),기압: \(pressure)")
    }
    
}
