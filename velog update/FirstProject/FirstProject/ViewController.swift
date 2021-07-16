//
//  ViewController.swift
//  FirstProject
//
//  Created by 송영욱 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            //navigation controlle
            navigationController?.navigationBar.topItem?.title = "MainView"
            navigationController?.navigationBar.topItem?.prompt = "메인화면"
            navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로가기"
        
            
            let leftBarButton = UIBarButtonItem.init(title: "left", style: .done, target: self, action: nil)
            navigationItem.leftBarButtonItem = leftBarButton
        
            let rightBarButton = UIBarButtonItem.init(title: "right", style: .done, target: self, action: nil)
            navigationItem.rightBarButtonItem = rightBarButton
            
        }
    
    


}

