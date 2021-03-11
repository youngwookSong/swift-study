//
//  ViewController.swift
//  moneyconverter
//
//  Created by 송영욱 on 2021/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyFeild: UITextField!
    
    @IBOutlet weak var targetmoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertmoney(_ sender: Any) {
        
        //Currency는 money파일의 enum
        //guard는 if let과 같은거. 값이 있다면! (뒤에 else붙음)
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else{
            print("Source Currency ERROR")
            return
        }
        
        //필드에 입력값이 없다면
        guard let sourceAmount = Double(sourceMoneyFeild.text!) else{
            targetmoneyLabel.text = "ERROR"
            return
        }
        
        //위에 꺼의 if let 버전
        /*if let sourceMoney = Double(sourceMoneyFeild.text!) //입력값에 값이 있다면!
        {
            targetMoneyString = "\(sourceMoney * ratio)"
        }
        else
        {
                targetMoneyString = "ERROR"
        }*/
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency) //Money 구조체
        
        //여긴 단순한 컨버터 코드
        /*let ratio:Double
        switch currencySegment.selectedSegmentIndex {
        case 0:
            ratio = 0.00085
        case 1:
            ratio = 1178.5
        default:
            ratio = 1.0
        }*/
        
        var targetMoneyString:String = ""
        for i in 0...3
        {
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
        targetmoneyLabel.text = targetMoneyString
    }
    
}

