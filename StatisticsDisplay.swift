//
//  StatisticsDisplay.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/08.
//

import Foundation

public class StatisticsDisplay : Observer,DisplayElement {
    var temperature : Double = 0
    //wheather데이터가 Subject이므로
    var weatherData : WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        weatherData.resisterObserver(self)
    }

    // 온도 배열
    private var arrTemperature: [Double] = []
    // 총 합 계산
    private var total: Double {
        arrTemperature.append(weatherData.getTemperature())
        return arrTemperature.reduce(0, +)
    }
    // 평균 계산
    var average: Double {
        guard !arrTemperature.isEmpty else { return 0.0 }
        return total / Double(arrTemperature.count)
    }

    //update가 호출되면 온도,습도,기압을 저장하고,display호출 ..
    //평균값도 구해야하는데..
    func update() {
        self.temperature = average
        
        display()
    }
    //최근에 받은 데이터 출력
    func display() {
        print("평균/최고/최저 온도 : \(temperature)")
    }
}
