//
//  first.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import Foundation
import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    let image = ["kakao","insta","face","empty","empty","empty","empty","empty","empty"]
    let course = [["카카오톡 시작하기", "메세지 보내기", "QR켜기", "사진 보내기", "그룹채팅 만들기"],["인스타그램 시작하기", "좋아요 누르기", "게시물 작성하기", "댓글 달아보기", "DM 보내기"],["페이스북 시작하기", "게시물 등록하기", "댓글 작성하기", "게시물 공유하기", "메신저 사용하기"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"]]
    var index : IndexPath?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = course[index!.row][indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        
        img.image = UIImage(named: image[index!.row])
        tableview.delegate = self
        tableview.dataSource = self
        
    }
}
