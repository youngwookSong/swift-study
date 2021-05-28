//
//  ViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import UIKit

class ViewController: UIViewController {
    
    var images = ["kakao","insta","face"]
    var images_rec = ["인기1","인기2","인기3.jpg"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageCon: UIPageControl!
    
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var pageCon2: UIPageControl!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var subimgview1: UIImageView!
    @IBOutlet weak var subimgview2: UIImageView!
    
    @IBOutlet weak var subimgview1_1: UIImageView!
    @IBOutlet weak var subimgview2_2: UIImageView!
    
    @IBAction func pageConAction(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageCon.currentPage])
        
        //양옆 사진들 보여주는거
        if (pageCon.currentPage == 0) {
            subimgview1.image = UIImage(named: "")
            subimgview2.image = UIImage(named: images[pageCon.currentPage + 1])
        }
        else if (pageCon.currentPage == images.count - 1) {
            subimgview1.image = UIImage(named: images[pageCon.currentPage - 1])
            subimgview2.image = UIImage(named: "")
        }
        else {
            subimgview1.image = UIImage(named: images[pageCon.currentPage - 1])
            subimgview2.image = UIImage(named: images[pageCon.currentPage + 1])
        }
        
        
    }
    @IBAction func pageCon2Action(_ sender: UIPageControl) {
        imageView2.image = UIImage(named: images_rec[pageCon2.currentPage])
        if (pageCon2.currentPage == 0) {
            subimgview1_1.image = UIImage(named: "")
            subimgview2_2.image = UIImage(named: images_rec[pageCon2.currentPage + 1])
        }
        else if (pageCon2.currentPage == images_rec.count - 1) {
            subimgview1_1.image = UIImage(named: images_rec[pageCon2.currentPage - 1])
            subimgview2_2.image = UIImage(named: "")
        }
        else {
            subimgview1_1.image = UIImage(named: images_rec[pageCon2.currentPage - 1])
            subimgview2_2.image = UIImage(named: images_rec[pageCon2.currentPage + 1])
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageCon.numberOfPages = images.count
        pageCon.currentPage = 0
        
        pageCon2.numberOfPages = images_rec.count
        pageCon2.currentPage = 0
    
        imageView.image = UIImage(named: images[0])
        imageView2.image = UIImage(named: images_rec[0])
        imageView3.image = UIImage(named: "금융4")
        
        subimgview2.image = UIImage(named: images[1])
        subimgview2_2.image = UIImage(named: images_rec[1])
        
        //tapGesture는 맨위 이미지 뷰에만 넣음
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchToPickPhoto))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true //요게 있어야되네!
        
    }
    
    @objc func touchToPickPhoto() {
        print("touch")
        //모달로 화면 바꾸기 (코드) -> 스토리보드 아이디가 있어야하
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "pgViewController")
        vcName?.modalTransitionStyle = .coverVertical
        self.present(vcName!, animated: true, completion: nil)
    }


}

