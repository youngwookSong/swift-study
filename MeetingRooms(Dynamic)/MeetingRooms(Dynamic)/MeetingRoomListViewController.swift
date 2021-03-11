//
//  MeetingRoomListViewController.swift
//  MeetingRooms(Dynamic)
//
//  Created by 송영욱 on 2021/02/27.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {

    var service:Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = service?.name
    }

    // MARK: - Table view data source
    
    //섹션
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //행
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        /*let categoryValues = Array(meetingRooms.values)[section]
        meetingRooms에 값들만 가져오고 그것의 인덱스들의 개수를 행으로 한다.*/
        guard let rowCount = service?.items?.count else {
            return 0
        }
        return rowCount //각 요소의 개수만큼 행 반환
    }

    //표현
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) //identyfier를 지정해준걸로 바꿔야함
        
        guard let meetingRoomm = service?.items?[indexPath.row] else{
            return cell
        }
        
        cell.textLabel!.text = meetingRoomm.name
        cell.detailTextLabel!.text = String(meetingRoomm.capacity)
        return cell
    }
    
    /*//타이틀 헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        return  orderedMeetingRooms[section].0 //key
    }
    
    //타이틀 푸터
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        let rowCount = orderedMeetingRooms[section].1.count //각 요소의 개수
        
        return "\(rowCount) rooms"
    }*/
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReservationSegue"
        {
            if let destination = segue.destination as? ReservationListViewController
            {
                if let selectdeIndex = self.tableView.indexPathForSelectedRow?.row
                {
                    destination.meetingRoom = service?.items?[selectdeIndex]
                }
            }
        }
    }
}
