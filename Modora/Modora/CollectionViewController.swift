//
//  CollectionViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/20.
//

import UIKit

private let reuseIdentifier = "ccell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var index : Int?
    var main_img : [UIImage?] = []
    var main_label : [String] = []
    
    let image_bank = [UIImage(named: "금융1"),UIImage(named: "금융2"),UIImage(named: "금융3"),UIImage(named: "금융3"),UIImage(named: "금융5"),UIImage(named: "금융6"),UIImage(named: "금융7"),UIImage(named: "금융8"),UIImage(named: "금융9")]
    
    let image_sns = [UIImage(named: "kakao"),UIImage(named: "insta"),UIImage(named: "face"),UIImage(named: "sns1"),UIImage(named: "sns2.jpg"),UIImage(named: "sns3"),UIImage(named: "sns4"),UIImage(named: "sns5"),UIImage(named: "sns6.jpg")]
    
    let label_sns = ["카카오톡", "인스타그램", "페이스북", "트위터","스냅챗","네이버밴드","핀터레스트","클럽하우스","틱톡"]
    
    let label_bank = ["KB국민은행", "하나 1QBank", "토스", "카카오페이","Sol 신한은행","우리은행 WON","농협 NHBank","기업 i-ONE Bank","CitiBank"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(index!)
        
        if (index! == 0) {
            main_img = image_bank
            main_label = label_bank
        }
        
        if (index! == 1) {
            main_img = image_sns
            main_label = label_sns
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return main_img.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.imageview.image = main_img[indexPath.row]
        cell.label.text = main_label[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        //self.dismiss(animated: true, completion: nil)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - 1 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        
        /*print("collectionView width=\(collectionView.frame.width)")
        print("cell하나당 width=\(width)")
        print("root view width = \(self.view.frame.width)")*/

        let size = CGSize(width: width, height: width)
        return size
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"
        {
            if let destination = segue.destination as? detailViewController
            {
                if let idx = self.collectionView.indexPathsForSelectedItems?.first
                {
                    destination.index = idx
                }
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
