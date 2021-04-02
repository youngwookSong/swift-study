//
//  ViewController.swift
//  simpleTable
//
//  Created by 송영욱 on 2021/04/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //요거는 tableview 컨트롤러로 안하면 선언을 해줘야됨
    @IBOutlet weak var tableview: UITableView!
    
    let korean:[String] = ["가", "나", "다", "라", "마"]
    let english:[String] = ["a", "b", "c", "d", "e",]
    
    //요 밑에는 필수적인 DataSource protocol ------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //스위치문으로 각 섹션에 해당하는 행의 개수 다르게 반환해줌
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //한줄로 쓰는 if문
        let text:String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    //-----------------------------------------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "한글" : "영어"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //이 두코드는 뷰컨트롤러가 인스턴스로써 딜리게이트와 데이터 소스의 역할을 해주겠다. 꼭 해줘야함
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }


}

