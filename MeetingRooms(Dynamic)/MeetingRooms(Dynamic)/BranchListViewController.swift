//
//  BranchListViewController.swift
//  MeetingRooms(Dynamic)
//
//  Created by 송영욱 on 2021/03/04.
//

import UIKit

class BranchListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationController?.isToolbarHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    @IBAction func locationturnOn(_ sender: Any) {
        let locationAlert = UIAlertController(title:"위치 정보 요청", message: "위치 정보를 기반으로 가까운 지점을 자동으로 선택할 수 있습니다. 또는 지도앱에서 지점의 위치 정보를 제공해 드립니다. 선택하신 기능이 계속 제공됩니다. 환경설정에서 제공되는 기능을 변경할 수 있습니다.", preferredStyle: .actionSheet) //.alert는 대화상자 형태. 요건 밑에서 나옴
        
        let locationAction = UIAlertAction(title:"위치정보 켜기", style: .default, handler: {(action:UIAlertAction) -> Void in print("위치정보 켜기 선택") //선택하면 프린트 된다.
        })
        
        let openMapAction = UIAlertAction(title:"지도앱에서 열기", style: .default, handler: {(action:UIAlertAction) -> Void in print("지도앱에서 열기 선택")
        })
        
        locationAlert.addAction(locationAction)
        locationAlert.addAction(openMapAction)
        
        self.present(locationAlert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let rowCount = datacenter.branches.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath)

        let branch = datacenter.branches[indexPath.row]
        cell.textLabel?.text = branch.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ServiceSegue"
        {
            if let destination = segue.destination as? ServiceListViewController
            {
                if let selectdeIndex = self.tableView.indexPathForSelectedRow?.row
                {
                    destination.branch = datacenter.branches[selectdeIndex] as Branch
                }
            }
        }
    }
    //요 부분 어렵네
    //여기 branch를 service branch로 옮겨주는 역할

}
