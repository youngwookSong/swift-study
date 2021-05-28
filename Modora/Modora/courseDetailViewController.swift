//
//  courseDetailViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/28.
//

import UIKit

class courseDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let course1 = [["카카오톡 시작하기", "메세지 보내기", "QR켜기", "사진 보내기", "그룹채팅 만들기"],["안녕하세요 여러분!", "프로필 설정 보내기", "결재하기", "사진 보내기", "오픈채팅 만들기"],["카카오톡 시작하기", "메세지 보내기", "QR켜기", "사진 보내기", "그룹채팅 만들기"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"]]
    
    /*let course1 = [["카카오톡 시작하기", "메세지 보내기", "QR켜기", "사진 보내기", "그룹채팅 만들기"],["인스타그램 시작하기", "좋아요 누르기", "게시물 작성하기", "댓글 달아보기", "DM 보내기"],["페이스북 시작하기", "게시물 등록하기", "댓글 작성하기", "게시물 공유하기", "메신저 사용하기"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"]]*/
    
    var index : Int?
    var imgName : String?
    var titleLabel_send : String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course1[index!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = course1[index!][indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        img.image = UIImage(named: imgName!)
        titleLabel.text = titleLabel_send!

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
