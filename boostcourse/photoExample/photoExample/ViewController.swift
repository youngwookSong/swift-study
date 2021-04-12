//
//  ViewController.swift
//  photoExample
//
//  Created by 송영욱 on 2021/04/12.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        
        //접근 허용하는거 이거는 앱 처음에만 실행됨
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("authorized")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableview.reloadData()
            }
            
        case .denied:
            print("denied")
            
        case .notDetermined:
            print("아직 응답없음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status{
                case .authorized:
                    print("authorized")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableview.reloadData()
                    }
                    
                case .denied:
                    print("denied")
                default: break
                }
            })
            
        case .restricted:
            print("접근제한")
            
        case .limited:
            return
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        //이거 왜 크기가 안바뀌냐...
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in cell.imageView?.image = image
                                    print("hihi")
        })
        return cell
    }


}

