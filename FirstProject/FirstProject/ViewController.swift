//
//  ViewController.swift
//  FirstProject
//
//  Created by 송영욱 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBAction func myButtonAction(_ sender: UIButton) {
        if let secondView = self.storyboard?.instantiateViewController(identifier: "secondView") as? secondViewController {
            present(secondView, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "HI Song!"
        
    }
    
    


}

