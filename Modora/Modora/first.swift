//
//  first.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import Foundation
import UIKit

class first: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    let course = ["카카오톡 시작하기", "메세지 보내기", "QR켜기", "사진 보내기", "그룹채팅 만들기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = course[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        
        img.image = UIImage(named: "kakao")
        tableview.delegate = self
        tableview.dataSource = self
        
    }
}
