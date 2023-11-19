//
//  ViewController.swift
//  Data Binding Practice
//
//  Created by 김영현 on 11/19/23.
//


//  View
import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observerTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    private var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBindings()
        startTimer()
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    func setBindings() {
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
    }

}

