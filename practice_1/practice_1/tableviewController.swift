//
//  tableviewController.swift
//  practice_1
//
//  Created by 송영욱 on 2021/03/12.
//


import Foundation
import UIKit

class tableviewController : UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var Tableviewmain: UITableView!
    
    //행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //무엇을 보여줄거냐 셀이 10번 반복
    //indexpath 는 row의 인덱스 번호
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //이건 그냥 tableview를 넣었을때 -> 이건 연습용
        /*let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        cell.textLabel?.text = "\(indexPath.row)" // row의 인덱스 번호(0~9)
        return cell*/
        
        //이건 그냥 tableviewcell 넣엇을때 -> 이게 실전에서 많이 쓰임 type1의 스위프트 클래스 파일을 만들어야함
        let cell = Tableviewmain.dequeueReusableCell(withIdentifier: "type1", for: indexPath) as! Type1 //Type1 클래스안에는 라벨이 있다. 그것을 as로 불러옴
        cell.labeltext.text = "\(indexPath.row)"
        //as? as! -> 부모 자식 친자 확인. 위에서는 dequeueReusableCell의 자식인 type1을 찾고 싶을때
        
        //이건 따로 label 만들지 않고 style에서 right detail로 하면 이케 바로 쓸 수 있다.
        /*cell.textLabel?.text = "\(indexPath.row)"
        cell.detailTextLabel?.text = "\(indexPath.row)"*/
        
        return cell
    }
    
    //각 행들을 눌렀다면!!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click: \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self는 클래스안의 함수들
        Tableviewmain.delegate = self
        Tableviewmain.dataSource = self
    }
}
