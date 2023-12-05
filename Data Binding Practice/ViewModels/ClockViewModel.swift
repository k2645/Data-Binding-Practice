//
//  ClockViewModel.swift
//  Data Binding Practice
//
//  Created by 김영현 on 11/19/23.
//

//  View Model
import Foundation
import Combine

class ClockViewModel {
    
    // 클로저 변수를 생성
    var didChangeTime: ((ClockViewModel) -> Void)?
    var observerTime: Observable<String> = Observable("Observable")
    @Published var combineTime: String = "Combine"
    
    // 감시자 프로퍼티를 통해 closureTime 값이 바뀌는 것을 감지하고 감지될 때 마다 didChangeTime 클로저를 실행
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    init() {
        closureTime = Clock.currentTime()
        observerTime.value = Clock.currentTime()
    }
    
    // clock 모델의 currentTime 함수를 통해 현재 시간 update
    func checkTime() {
        closureTime = Clock.currentTime()
        observerTime.value = Clock.currentTime()
        combineTime = Clock.currentTime()
    }
    
}

