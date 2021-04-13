//
//  ViewController.swift
//  AsyncEX_operation
//
//  Created by 송영욱 on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func button(_ sender: UIButton) {
        //이미지 다운로드 -> 이미지 뷰에 셋팅
        //https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        
        let imageURL:URL = URL(string:  "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
        let imageData:Data = try! Data.init(contentsOf: imageURL)
        let image:UIImage = UIImage(data: imageData)!
        
        self.imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

