//
//  ViewController.swift
//  myFriendsJson
//
//  Created by 송영욱 on 2021/04/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend:Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableview.dataSource = self
        
        //decoder
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        //asset 가져오기
        guard let dataAsset:NSDataAsset = NSDataAsset(name: "friends") else{
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableview.reloadData()
    }


}

