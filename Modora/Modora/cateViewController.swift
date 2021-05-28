//
//  cateViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import UIKit

class cateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cate = ["금융", "SNS", "헬스","비즈니스", "게임", "사진 및 비디오", "생산성", "라이프 스타일", "날씨"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cate[indexPath.row]
        //cell.imageView = UIImageView(named: "doc.text.below.ecg.fill.rtl")
        return cell
    }
    

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

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
