//
//  Observer.swift
//  ObserverPattern
//
//  Created by 김지훈 on 2023/09/07.
//

import Foundation

//AnyObject프로토콜을 사용하여 관찰자를 클래스로 제한한다.
protocol Observer: AnyObject {
    func update()
}
