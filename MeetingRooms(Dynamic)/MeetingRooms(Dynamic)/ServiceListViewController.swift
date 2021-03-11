//
//  ServiceListViewController.swift
//  MeetingRooms(Dynamic)
//
//  Created by 송영욱 on 2021/03/04.
//

import UIKit

class ServiceListViewController: UITableViewController {
    
    var branch:Branch?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = branch?.name //servicelistviewcontroller의 타이틀을 해당 브랜치의 이름으로 정의
        self.navigationItem.title = "\(branch!.name) 정보" //이게 찐느낌?! 이게 이김
        self.navigationController?.isToolbarHidden = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rowcount = branch?.services?.count else{
            return 0 //rowcount에 값이 있으면 나오고 없으면 0리턴
        }//branch는 위에 정의
        return rowcount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)

        guard let service = branch?.services?[indexPath.row] else{
            return cell
        }
        
        cell.textLabel?.text = service.name //!인지 ?인지 헷갈림
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
        if segue.identifier == "MeetingRoomSegue"
        {
            if let destination = segue.destination as? MeetingRoomListViewController
            {
                if let selectdeIndex = self.tableView.indexPathForSelectedRow?.row
                {
                    destination.service = branch?.services?[selectdeIndex]
                }
            }
        }
        
        /*if segue.identifier == "MeetingRoomSegue"
        {
            guard let destination = segue.destination as? MeetingRoomListViewController, let selectedIndex = self.tableView.indexPathForSelectedRows?.row, let service = branch?.services?[selectedIndex] else {
                return
            }
            destination.service = service
        }*/ //위에랑 같은 코드인데 계속 오류나네..
    }
    

}
