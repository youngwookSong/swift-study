//
//  request.swift
//  Networking
//
//  Created by 송영욱 on 2021/04/22.
//

import Foundation

//notification으로 정보가져와서 다른 파일에다가 쓸 수 있게 하기 -> 코드 분산
//viewcontroller안에 다쓰면 복잡하니까
//값 전달하는 느낌. 무엇을 실행하는 느낌

//처리할 애의 이름 설정
let DidRecievedNotification : Notification.Name = Notification.Name("DidRecievedNotification")

func requestFriends()
{
    //url불러오기
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else
    {return}
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data:Data?, responds: URLResponse?, error: Error?) in
        
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        //데이터 받아오기
        guard let data = data else {return}
        
        //데이터 JSON으로 호출 friends배열 안에다가 넣어줌
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            //이케 전달해서 액션을 취하겠다. 처리해달라는 신호
            NotificationCenter.default.post(name:DidRecievedNotification, object:nil, userInfo:["friends":apiResponse.results])
            
            /*self.friends = apiResponse.results
            
            //백그라운드로 실행되고 있었음
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }*/

        } catch(let err) {
            print(err.localizedDescription)
        }
    }

    //dataTask를 호출하고 서버에 요청한다.
    dataTask.resume()
}
