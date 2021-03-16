//
//  newsDetailController.swift
//  newsapp
//
//  Created by 송영욱 on 2021/03/13.
//

import UIKit

class newsDetailController : UIViewController
{
    
    @IBOutlet weak var imagemain: UIImageView!
    @IBOutlet weak var labelmain: UILabel!
    
    //각 행에 해당하는 image url하고 description이 있어야함
    var imageUrl : String?
    var desc : String?
    
    //화면에 보여주기
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = imageUrl
        {
            //이미지 보여줌 data를 씀
           if let data = try? Data(contentsOf: URL(string: image)!)
           {
                DispatchQueue.main.async
                {// data는 백그라운드이기때문에 main에서 놓으라는 명령이 필요
                    self.imagemain.image = UIImage(data: data)
                }
           }
        }
        
        if let d = desc
        {
            //본문 보여줌
            self.labelmain.text = d
        }        
    }
}
