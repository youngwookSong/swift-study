//
//  ViewController.swift
//  practice_1
//
//  Created by 송영욱 on 2021/03/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBAction func click_button(_ sender: Any)
    {
        //스토리보드에서 드래그로 연결하지 않고 코드로 연결하는 법
        //스토리보드에서 컨트롤러 찾고 컨트롤러 이동(storyboard id 찾기)
        if let controller = self.storyboard?.instantiateViewController(identifier: "detailController")
        {
            self.navigationController?.pushViewController(controller, animated: true)
            //animated는 스무스하게 이동하게 해주는거
        }
    }
    @IBAction func click_tableview(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "tableviewController")
        {
            self.navigationController?.pushViewController(controller, animated: true)
            //animated는 스무스하게 이동하게 해주는거
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

