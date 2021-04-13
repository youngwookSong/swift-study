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
        
        //사진 가져오는 작업 = 동기 (Async) 메소드 -> 요 작업이 끝나기 전까지는 아무것도 안함 (끝나길 기다림)
        //그래서 다운로드 버튼 누르면 회색으로 띄고 아무것도 못함 (freeze됨)
        /*let imageData:Data = try! Data.init(contentsOf: imageURL)
        let image:UIImage = UIImage(data: imageData)!
        
        self.imageView.image = image*/
        
        //addOperation으로 백그라운드 실행하기
        //하나의 스레드를 추가로 만드는 느낌 (버튼 눌러도 다른 동작할 수 있음!)
        OperationQueue().addOperation {
            let imageData:Data = try! Data.init(contentsOf: imageURL)
            let image:UIImage = UIImage(data: imageData)!
            
            //UI관련은 main에서 해줘야함
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

