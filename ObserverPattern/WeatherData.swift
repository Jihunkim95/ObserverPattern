//
//  WeatherData.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/07.
//

import Foundation

public class WeatherData: Subject{
    
    private var observers : [Observer] = []
    private var temperature : Double = 0
    private var humidity : Double = 0
    private var pressure : Double = 0
    
  
    
    func resisterObserver(_ o: Observer) {
        observers.append(o)
    }
    
    func removeObserver(_ o: Observer) {
//as AnyObject를 사용하여 관찰자를 클래스 형식으로 변환해서 타입 오류 해결
        if let index = observers.firstIndex(where: { $0 === o as AnyObject}) {
            observers.remove(at: index)
        }
        
    }

    /**중요 : 모든옵저버에게 상태변화를 알려주는 부분
     모두 Observer 인터페이스를 구현하는,
     즉 update()메소드가 있는 객체들이므로 손쉽게 상태 변화 알려줄 수있음
     **/
    func notifyObservers() {
        for observer in observers {
            observer.update()
        }
    }
    
    public func measurementsChanged(){
        notifyObservers()
    }
    
    public func setMeasurements(_ temperature: Double,_ humidity: Double, _ pressure: Double){
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
        
    }
    // WeatherData코드에 있는 게터 메소드를 사용
    public func getTemperature()->Double{
        return temperature
    }
    public func getHumidity()->Double{
        return humidity
    }
    public func getPressure()->Double{
        return pressure
    }
}
