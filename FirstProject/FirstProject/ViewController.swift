//
//  ViewController.swift
//  FirstProject
//
//  Created by 송영욱 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func segueBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueShow", sender: self)
    }
    
    @IBAction func modalPresent(_ sender: UIButton) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "modalView")
        newVC?.modalTransitionStyle = .coverVertical
        newVC?.modalPresentationStyle = .automatic
        self.present(newVC!, animated: true, completion: nil)
    }
    
    @IBAction func navPush(_ sender: UIButton) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "navPush")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print("메모리에 View가 Load됨 (viewDidLoad)")
        }
    
    


}

