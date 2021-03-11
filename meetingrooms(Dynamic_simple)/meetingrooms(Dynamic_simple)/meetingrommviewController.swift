//
//  meetingrommviewController.swift
//  meetingrooms(Dynamic_simple)
//
//  Created by 송영욱 on 2021/03/04.
//

import UIKit

class meetingrommviewController: UITableViewController {

    //리스트로 만들것들을 표현 (딕셔너리의 값에 또 딕셔너리 들어감)
    var meetingRooms:[String:[String:Int]] =
        ["Seminar":["Cezanne":40, "Matisse":30, "Renoir":20],
        "Meeting":["Banksy":8, "Riversa":12, "Kahlo":2, "Picasso":6]]
    
    func meetingRoomsAtIndex(index:Int) -> (key:String, value:[String:Int]) {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetingRooms[index]
    }
    //접근 = let a = meetingRoomsAtIndex(section).value
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    //섹션
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count //2개의 섹션 제공
    }
    
    //행
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        /*let categoryValues = Array(meetingRooms.values)[section]
        meetingRooms에 값들만 가져오고 그것의 인덱스들의 개수를 행으로 한다.*/
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        //각 세션에서 첫번째 방의 개수를 비교해 적은 섹션이 위에 오도록
        let rowCount = orderedMeetingRooms[section].1.count //방의 개수 저장
        return rowCount //각 요소의 개수만큼 행 반환
    }

    //표현
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) //identyfier를 지정해준걸로 바꿔야함
        
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        //let categoryValue = Array(meetingRooms.values)[indexPath.section] //미팅룸이냐 세미냐냐

        let categoryValue = orderedMeetingRooms[indexPath.section].1
        let orderedCategoryValue = categoryValue.sorted(by: {$0.1 < $1.1}) //0번째 인덱스의 value가 1번째 인덱스의 value보다 작아야한다.
        
        let roomName = orderedCategoryValue[indexPath.row].0 //미팅룸안에서의 이름들 가져옴
        let capacity = orderedCategoryValue[indexPath.row].1 //미팅룸안에서의 값들 가져옴
        
        cell.textLabel!.text = roomName //cell의 텍스트라벨에는 미팅룸안 이름들 넣고
        cell.detailTextLabel!.text = "\(capacity)" //cell의 오른쪽 디테일에는 미팅룸안 값들을 넣는다.

        return cell
    }
    
    //타이틀 헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        return  orderedMeetingRooms[section].0 //key
    }
    
    //타이틀 푸터
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        let rowCount = orderedMeetingRooms[section].1.count //각 요소의 개수
        
        return "\(rowCount) rooms"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
