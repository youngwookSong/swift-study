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
    
    let course = [["김승환이 알려주는 카카오톡 A-Z", "구자혁만 따라와!", "박지용의 카카오톡 마스터", "동쌤이 알려주는 카카오톡"],["송영욱의 인스타 배우기", "용짱이 알려주는 인스타그램", "나도 할 수 있는 인스타", "지상이의 쉬운 인스타 따라하기"],["현우의 페북스타 도전기", "문쌤이 알려주는 페북", "구자혁의 페북 가이드", "박지용과 함께 페북스타 되기"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"]]
    let course_sub = [["어르신 맞춤형 카카오톡 강의", "트로트 가수 요요미와 함께 배우는 카카오톡", "당신도 이제 마스터할 수 있다.", "모든 일은 처음부터 시작이다! 이제 당신 차례."],["어르신 맞춤형 인스타그램 강의", "트로트 가수 요요미와 함께 배우는 인스타", "당신도 이제 마스터할 수 있다.", "모든 일은 처음부터 시작이다! 이제 당신 차례."],["어르신 맞춤형 페이스북 강의", "트로트 가수 요요미와 함께 배우는 페이스북", "페이스북, 당신도 이제 마스터할 수 있다.", "모든 일은 처음부터 시작이다! 이제 당신 차례."],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"],["--------", "--------", "--------", "--------", "--------"]]
    
    var index : IndexPath?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course[index!.row].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customcell
        
        cell.textLabel?.text = course[index!.row][indexPath.row]
        cell.detailTextLabel?.text = course_sub[index!.row][indexPath.row]
        //cell.cellLabel.text = "HI"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        
        img.image = UIImage(named: image[index!.row])
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courseSegue"
        {
            if let destination = segue.destination as? courseDetailViewController
            {
                if let selectdeIndex = self.tableview.indexPathForSelectedRow?.row
                {
                    destination.index = selectdeIndex
                    destination.imgName = image[index!.row]
                    destination.titleLabel_send = course[index!.row][selectdeIndex]
                }
            }
        }
    }
}
