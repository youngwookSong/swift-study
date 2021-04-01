//
//  SecondViewController.swift
//  login
//
//  Created by 송영욱 on 2021/03/31.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium //요건 날짜 스타일 short, medium, long 스타일이 있음
        formatter.timeStyle = .short //요건 시간 스타일 이 코드 없으면 시간은 안나옴
        //formatter.dateFormat = "yyyy/mm/dd hh:mm:ss" 이렇게 우리가 지정해줄 수도 있음
        return formatter
    }()
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        //값이 바뀔때마다
        print("value change")
        
        //해당하는 요소의 날짜 가져오기
        let date:Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.label.text = dateString
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이건 위에 datePickerValueChanged 액션 메소드를 연결하지 않고 이렇게 사용하면 되게 하는거. 그냥 인터페이스 연결하는게 속 편할듯
        //self.datePicker.addTarget(self, action: #selector(self.datePickerValueChange(_:)), for: UIControl.Event.valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func popToPrew()
    {
        self.navigationController?.popViewController(animated: true)
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
