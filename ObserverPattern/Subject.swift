//
//  Subject.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/07.
//

import Foundation

protocol Subject {
    //Obersever 프로토콜을 인자로 받아 등록하고 제거.
    func resisterObserver(_ o : Observer)
    func removeObserver(_ o : Observer)
    //주제의 상태가 변경되었을 때, 모든 변경내용을 알릴려고 호출.
    func notifyObservers()
}
