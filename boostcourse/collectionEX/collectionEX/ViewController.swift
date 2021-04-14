//
//  ViewController.swift
//  collectionEX
//
//  Created by 송영욱 on 2021/04/14.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    //var numberOfCell:Int = 10
    var friends:[Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    //한섹션의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    //셀 지정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: FriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FriendsCollectionViewCell
        //as! -> 캐스팅 벗겨내는 방법 알아내기! (캐스팅 자체가 안좋은 방법!)
        
        let friend:Friend = self.friends[indexPath.row]
        
        cell.nameLabel.text = friend.nameAndAge
        cell.addressLabel.text = friend.fullAddress
        
        return cell
    }
    
    //셀을 선택할 시(어떤 셀이든)
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder:JSONDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name:"friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print("error")
        }
        
        self.collectionView.reloadData()
    }
    
}

