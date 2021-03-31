//
//  ViewController.swift
//  login
//
//  Created by 송영욱 on 2021/03/31.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //여기 위의 딜리게이트를 control + command + 클릭해서 무슨 함수가 있는지 보자

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    lazy var imagePicker: UIImagePickerController = {//사용자 앨범 접근
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self //이렇게 호출해서 밑에 delegate메서드 호출 가능!!!
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton)
    {
        //이미지를 선택할 수 있는 걸 모달로 올려줌
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    //UIImagePickerControllerDelegate에서 가져온 함수
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        //취소 누르면 호출되는 메서드. dismiss하기
        self.dismiss(animated:true,completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        //사진 선택하면 호출되는 메서드
        //사진에서 선택에 맞는 키를 가져오고 그 키에 맞는 사진을 가져와서 imageView에 넣는다.
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            //imageview에다가 넣어주기
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated:true,completion:nil)
    }
    

}

