//
//  ViewController.swift
//  AlertEX
//
//  Created by 송영욱 on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {
    
    //Alert로 열기
    @IBAction func showAlert(_ sender: UIButton)
    {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    //action sheet로 열기
    @IBAction func showActionSheet(_ sender: UIButton)
    {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style:UIAlertController.Style)
    {
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction:UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:  UIAlertAction) in print("OK pressed")
        })
        //hander는 이 버튼이 선택되었을때 실행하는것
        
        //cancel 스타일은 여기서 하나만 쓸 수 있음
        let cancelAction:UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        
        //handler를 변수로 따로 만들었따.-----------------
        let handler: (UIAlertAction) -> Void
        handler = {(action: UIAlertAction) in
            print(action.title ?? "")
            //??은 default value를 줄때 씀
        }
        
        let someAction:UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction:UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.destructive, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        //textfield값 저장 방법
        let textAction:UIAlertAction
        textAction = UIAlertAction(title: "텍스트 저장, 출력", style: UIAlertAction.Style.destructive, handler: {_ in guard let field = alertController.textFields?.first, let text = field.text, !text.isEmpty else{ return }
            print(text)
        })
        
        //textfield는 alert일때만 가능!!!
        if style == .alert
        {
            alertController.addAction(textAction)
            alertController.addTextField(configurationHandler: nil)
            
            //이르케 텍스트 필드 접근 가능
            alertController.textFields?.first?.placeholder = "플레이스 홀더"
            alertController.textFields?.first?.textColor = UIColor.red
        }
        
        self.present(alertController, animated: true, completion: {
            print("Alert controller shown")
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

