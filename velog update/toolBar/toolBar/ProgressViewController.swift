//
//  ProgressViewController.swift
//  toolBar
//
//  Created by 송영욱 on 2021/07/29.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func resetButton(_ sender: Any) {
        secondsPassed = 0
    }
    
    var timer = Timer()
    var secondsPassed = 0
    let time = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.time {
                print ("\(self.secondsPassed) seconds")
                self.secondsPassed += 1
                
                let percent = Float(self.secondsPassed) / Float(self.time)
                self.progressView.progress = percent
                self.label.text = "\(self.secondsPassed)초 경과"
            }
            
            else {
                self.label.text = "\(self.time)초 경과 완료"
            }
        }
    }


}
