//
//  sliderViewController.swift
//  FirstProject
//
//  Created by 송영욱 on 2021/06/03.
//

import UIKit

class sliderViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let value = sender.value
        valueLabel.text = String(Int(value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = "50"
        
        
        slider.value = 50
        slider.minimumValue = 0
        slider.maximumValue = 100
        // Do any additional setup after loading the view.
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
