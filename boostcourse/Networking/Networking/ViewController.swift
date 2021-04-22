//
//  ViewController.swift
//  Networking
//
//  Created by 송영욱 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
                self.friends = apiResponse.results
                
                //백그라운드로 실행되고 있었음
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            } catch(let err) {
                print(err.localizedDescription)
            }
        }
    
        //dataTask를 호출하고 서버에 요청한다.
        dataTask.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil
        
        //이미지를 다운받는 도중에도 다른 작업 할 수 있도록 (비동기화)
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                
                //재사용하기 위해
                if let index: IndexPath = tableView.indexPath(for: cell)
                {
                    if index.row == indexPath.row
                    {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
                
            }
        }
        
        
        
        return cell
    }


}

