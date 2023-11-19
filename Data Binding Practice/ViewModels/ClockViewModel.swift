//
//  ClockViewModel.swift
//  Data Binding Practice
//
//  Created by 김영현 on 11/19/23.
//

//  View Model
import Foundation

class ClockViewModel {
    
    var didChangeTime: ((ClockViewModel) -> Void)?
    
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    init() {
        closureTime = Clock.currentTime()
    }
    
    func checkTime() {
        closureTime = Clock.currentTime()
    }
    
}
