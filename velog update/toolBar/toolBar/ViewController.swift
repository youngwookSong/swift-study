//
//  ViewController.swift
//  toolBar
//
//  Created by 송영욱 on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func trashItem(_ sender: Any) {
        print("Delete")
        let sheet = UIAlertController(title: "경고", message: "정말 휴지통으로 보내겠습니까?", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Yes!", style: .destructive, handler: { _ in print("yes 클릭") }))
        sheet.addAction(UIAlertAction(title: "No!", style: .cancel, handler: { _ in print("yes 클릭") }))
        present(sheet, animated: true)
    }
    
    @IBAction func cameraItem(_ sender: Any) {
        print("camera")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

