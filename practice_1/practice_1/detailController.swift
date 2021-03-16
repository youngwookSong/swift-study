//
//  detailController.swift
//  practice_1
//
//  Created by 송영욱 on 2021/03/11.
//

import Foundation
import UIKit
import WebKit

class detailController: UIViewController {
    
    @IBOutlet weak var WebViewmain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebViewmain.load(urlReq)
        }
        
    }
}
