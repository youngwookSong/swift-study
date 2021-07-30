//
//  switchViewController.swift
//  toolBar
//
//  Created by 송영욱 on 2021/07/30.
//

import UIKit

class switchViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func switchChange(_ sender: Any) {
        if mySwitch.isOn {
            label.text = "스위치 켜짐"
        }
        
        else {
            label.text = "스위치 꺼짐"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.setOn(false, animated: true)
    }
    
}
