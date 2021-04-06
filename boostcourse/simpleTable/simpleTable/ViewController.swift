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
    var dates:[Date] = []
    
    let dateFormatter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func dateButton(_ sender: UIButton) {
        dates.append(Date()) //동적 데이터 추가
        
        //테이블 뷰 리로딩
        //self.tableview.reloadData() -> 이건 전체의 테이블을 다시 리로드(비효율적!)
        self.tableview.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        //인덱스2의 섹션만 리로드! 애니메이션 있게
    }
    //요 밑에는 필수적인 DataSource protocol ------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //스위치문으로 각 섹션에 해당하는 행의 개수 다르게 반환해줌
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section < 2{
            let cell:UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //0,1번 섹션은 위에꺼 가져오는거
            
            //한줄로 쓰는 if문
            let text:String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            
            return cell
        }
        else{
            //마지막 섹션은 따로 만든 (커스텀마이징한) 셀을 쓴다.
            let cell:customTableViewCell = tableview.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customTableViewCell //타입 캐스팅
            
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
    }
    //-----------------------------------------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2{
            return section == 0 ? "한글" : "영어"
        }
        else{
            return "시간"
        }
    }
    
    //cell에 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section < 2
        {
            return 50
        }
        else{
            return 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //이 두코드는 뷰컨트롤러가 인스턴스로써 딜리게이트와 데이터 소스의 역할을 해주겠다. 꼭 해줘야함
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }


}

