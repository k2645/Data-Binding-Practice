//
//  ViewController.swift
//  Data Binding Practice
//
//  Created by 김영현 on 11/19/23.
//


// View
import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observerTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
        }
    }

}

