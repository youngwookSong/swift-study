//
//  nextViewController.swift
//  tableview
//
//  Created by 송영욱 on 2021/07/19.
//

import UIKit

class nextViewController: UIViewController {
    
    var prepareImage: String?
    var prepareLabel: String?

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image =  UIImage(systemName: prepareImage!)
        label.text = prepareLabel!

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
