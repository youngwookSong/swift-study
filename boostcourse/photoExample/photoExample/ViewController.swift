//
//  ViewController.swift
//  photoExample
//
//  Created by 송영욱 on 2021/04/12.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PHPhotoLibraryChangeObserver {
    
    @IBOutlet weak var tableview: UITableView!
    
    //이미지 저장소
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    //편집할수 있게 할것이냐 (delegate)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //편집을 한다면 (delegate)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let asset:PHAsset = self.fetchResult[indexPath.row]
            
            //삭제를 할것이다 (스와이프 해서 삭제)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
    
    //사진이 바뀐다면 (PHPhotoLibraryChangeObserver) 여기선 삭제된다면!
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.tableview.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    //자체 메소드
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
        
        PHPhotoLibrary.shared().register(self)
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
        
        let options: PHImageRequestOptions = PHImageRequestOptions()
        options.resizeMode = .exact
        
        return cell
    }
    
    //데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextview:imageZoomViewController = segue.destination as? imageZoomViewController else {
            return
        }
        
        guard let cell:UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        guard let index:IndexPath = self.tableview.indexPath(for: cell
        ) else {
            return
        }
        
        nextview.asset = self.fetchResult[index.row]
    }

}

