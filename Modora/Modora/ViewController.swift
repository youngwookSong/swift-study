//
//  ViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import UIKit

class ViewController: UIViewController {
    
    var images = ["IMG_0776.JPG","IMG_2925.JPG","IMG_2468.JPG"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageCon: UIPageControl!
    
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var pageCon2: UIPageControl!
    
    @IBAction func pageConAction(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageCon.currentPage])
    }
    @IBAction func pageCon2Action(_ sender: UIPageControl) {
        imageView2.image = UIImage(named: images[pageCon.currentPage])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageCon.numberOfPages = images.count
        pageCon.currentPage = 0
        
        pageCon2.numberOfPages = images.count
        pageCon2.currentPage = 0
        
        imageView.image = UIImage(named: images[0])
        imageView2.image = UIImage(named: images[0])
        
    }


}

