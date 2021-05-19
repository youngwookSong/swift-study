//
//  pgViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import UIKit

class pgViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var currentIndex : Int = 0 {
            didSet{
                //changeBtnColor()
                print(currentIndex)
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "PageViewController" {
                print("Connected")
                guard let vc = segue.destination as? pageViewController else {return}
                let pageViewController = vc
                
                pageViewController.completeHandler = { (result) in
                    self.currentIndex = result
                }
                
            }
            
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
