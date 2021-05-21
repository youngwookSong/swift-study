//
//  first.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import Foundation
import UIKit

class second: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    let course = ["인스타그램 시작하기", "좋아요 누르기", "게시물 작성하기", "댓글 달아보기", "DM 보내기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = course[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        
        img.image = UIImage(named: "insta")
        tableview.delegate = self
        tableview.dataSource = self
        
    }
}
