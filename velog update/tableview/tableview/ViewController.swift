//
//  ViewController.swift
//  tableview
//
//  Created by 송영욱 on 2021/07/16.
//
//나중에 static도 구현해보기
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let img = ["suit.diamond", "suit.heart", "suit.club", "suit.spade", "hexagon"]
    let label = ["1","2","3","4","5"]
    
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myTableViewCell
        
        cell.myImage.image = UIImage(systemName: img[indexPath.row])
        cell.myLabel.text = label[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //위임자 지정
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            if let destination = segue.destination as? nextViewController {
                if let selectdeIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.prepareImage = img[selectdeIndex]
                    destination.prepareLabel = label[selectdeIndex]
                }
            }
        }
    }
}

