//
//  ModalViewController.swift
//  login
//
//  Created by 송영욱 on 2021/03/31.
//

import UIKit

class ModalViewController: UIViewController, UIGestureRecognizerDelegate {

    //tap gesture recognize 추가하면 할 수 있는 액션
    @IBAction func taptap(_ sender: UITapGestureRecognizer) {
        //뷰에 아무대나 탭하면 키보드 닫아줌
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)*/
        //이것 델리게이트 써서 탭 제스쳐 구현 방법 -> 메소드들을 추가해 더 정교한 컨트롤 가능
    }
    
    @IBAction func dismissmodal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //GestureREcognizeDelegate 메소드
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
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
