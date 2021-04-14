//
//  imageZoomViewController.swift
//  photoExample
//
//  Created by 송영욱 on 2021/04/13.
//

import UIKit
import Photos

//option누르고 확대 축소하기

class imageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    var asset:PHAsset!
    //이미지 요청하는 것
    let imageManager:PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView:UIImageView!
    
    //scrollviewdelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: {image, _ in
                                    self.imageView.image = image
                                  })

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
