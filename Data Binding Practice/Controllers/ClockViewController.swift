//
//  ViewController.swift
//  Data Binding Practice
//
//  Created by 김영현 on 11/19/23.
//


//  View
import UIKit
import Combine

class ClockViewController: UIViewController {

    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observerTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    // 뷰 모델 인스턴스 생성
    private var viewModel = ClockViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBindings()
        startTimer()
    }
    
    // 1초마다 뷰 모델의 checkTime 함수를 통해 시간 update
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    // 뷰 모델의 didChangeTime 클로저 프로퍼티를 라벨의 text 값을 뷰 모델의 시간 값으로 설정해주는 식으로 설정
    // closureTime의 didSet안에 있는 didChangeTime 때문에 didChangeTime 값이 바뀔때 마다 클로져 호출
    func setBindings() {
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
        viewModel.observerTime.bind { [weak self] time in
            self?.observerTimeLabel.text = time
        }
        viewModel.$combineTime
            .compactMap { String($0) }
            .assign(to: \.text, on: combineTimeLabel)
            .store(in: &cancellables)
    }

}
// 강한 참조 순환 문제가 생길 수 있으므로 weak을 통해 메모리 누수 문제 방지
