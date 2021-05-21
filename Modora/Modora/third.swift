//
//  first.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import Foundation
import UIKit

class third: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    let course = ["페이스북 시작하기", "게시물 등록하기", "댓글 작성하기", "게시물 공유하기", "메신저 사용하기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = course[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        
        img.image = UIImage(named: "face")
        tableview.delegate = self
        tableview.dataSource = self
        
    }
}
