//
//  ViewController.swift
//  newsapp
//
//  Created by 송영욱 on 2021/03/12.
//
//http 통신 - urlsession
//JSON 데이터 형태 {"키" : "값", "key" : "value"} or {["배","열","형태"]} 딕셔너리 형태
/*
{
    [
        {"키" : "값"},
        {"키" : "값"},
        {"키" : "값"}
    ]
}

 status": "ok",
 "totalResults": 34,
 -"articles": [
 -{
     -"source": {
     "id": null,
     "name": "Donga.com"
     },
     "author": null,
     "title": "변창흠, ‘LH사태 책임론’에 “자리 연연 않는다…결정에 따를 것” - 동아일보",
     "description": "최근 한국토지주택공사(LH) 직원들의 땅 투기 의혹과 관련해 사퇴 압박을 받고 있는 변창흠 국토교통부 장관이 12일 “제 역할이 충분히 평가되지 못했을 때 언제든지 자리에 연연하…",
     "url": "https://www.donga.com/news/Politics/article/all/20210312/105849712/2",
     "urlToImage": "https://dimg.donga.com/a/600/0/90/5/wps/NEWS/IMAGE/2021/03/12/105849747.2.jpg",
     "publishedAt": "2021-03-12T03:41:00Z",
     "content": null
 },
 
 articles[0]을 나타낸거고 articles[0]["title"] 로 접근가능
*/

import UIKit

class ViewController : UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableviewmain: UITableView!
    
    var newsData : Array<Dictionary<String, Any>>? //Any형은 아무거나. newsData에 딕셔너리 형식으로 타이틀, 기사를 넣음
    
    func getNews()
    {
        print("aa")
        //1.news api에서 키 발급받아 url주소 복붙
        //2.http통신을 통해 data에 json 데이터가 들어옴
        //3.https로 해줘야함 http를 사용하려면 따로 설정 해야됨
        //4.테이블뷰의 데이터 매칭 <-- 통보를 해야됨, 그리기
        //5.네트워크 통신시 UI -> main , network -> back 그래서 DispatchQueue로 main으로 올려줘야됨
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=8196bb4b17ec477883cd8bd4d358619b")!)
        { (data, response, error) in
            if let datajson = data
            {
                print(datajson) //byte형식으로 나온다
                
                //json으로 변환하기
                do
                { //오류 있을시 캐치 하겟다. try는 값이 없을 수도 있을때 한번 트라이 해보겠다.
                    let json = try JSONSerialization.jsonObject(with: datajson, options: []) as! Dictionary<String, Any>
                    //print(json)
                    
                    //articles만 가져오기 위해 변수 저장 전체 json내용은 인터넷 참고
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles) //as로 어레이라고 확인!
                    self.newsData = articles //데이터뷰에서 표시하기 위해 따로 변수에 저장
                    
                    DispatchQueue.main.async {
                        self.tableviewmain.reloadData() //이케 통보를 해야됨
                    }
                    
                    /*//articles의 title만 가져오기 --> 이거는 그냥 볼려고
                    for (idx, value) in articles.enumerated() //articles에서 인덱스와 값들을 찾아온다.
                    {
                        if let v = value as? Dictionary<String, Any> //가져온 value가 만약 딕셔너리 형태라면
                        {
                            print(v["title"]) //이러면 타이틀만 다 가져옴
                            print(v["description"]) //이러면 기사만 다 가져옴
                        }
                    }*/
                }
                catch {}
            }
        }
        task.resume() //감시했다가 실행
    }
    
    //행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData
        {
            return news.count
        }
        else
        {
            return 0
        }
    }
    
    //무엇을 보여줄거냐 셀이 위의 카운트만큼 반복
    //indexpath 는 row의 인덱스 번호
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewmain.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        
        let idx = indexPath.row
        
        if let news = newsData
        {
            let row = news[idx] //첫번쨰 기사 두번째 기사 이렇게 받아와야함
            if let r = row as? Dictionary<String, Any> //가져온 value가 만약 딕셔너리 형태라면
            {
                if let title = r["title"] as? String //만약에 스트링이면(as) nil일수 있으니까 바인딩
                {
                    cell.textLabel?.text = title
                }
                
            }
        }
        
        
        return cell
    }
    
    //part2
    //1.디테일 화면 만들기(이미지, 기사 표현. navigation으로. 각행을 눌렸을때 나와야됨
    //2.각 행에 대한 값을 디테일 화면에다 보내야함 (segue로 연결)
    //3.화면 이동 
    
    //각 셀 눌렀을때 (이동) -> 방법 1 (이동은 수동!)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click: \(indexPath.row)")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "newsDetailController") as! newsDetailController
        
        //값 세팅
        if let news = newsData
        {
            let row = news[indexPath.row]
            print("row::\(row)")
            if let r = row as? Dictionary<String, Any> {
                if let imageUrl = r["urlToImage"] as? String
                {
                    controller.imageUrl = imageUrl
                }
                if let desc = r["description"] as? String
                {
                    controller.desc = desc
                }
            }
        }
        
        //이동! (수동으로)
        showDetailViewController(controller, sender: nil) //이거는 모달로 올라오네
    }
    
    //세그웨이로 이동 -> 방법2 (이동은 자동!, 네비게이션 이동) //override는 UIviewcontroller라는 부모에 prepare 함수가 있어서 갖다 쓰겠다는 소리
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "newsDetailsegue" == id
        {
            if let controller = segue.destination as? newsDetailController
            {
                if let news = newsData
                {
                    if let indexPath = tableviewmain.indexPathForSelectedRow
                    {
                        let row = news[indexPath.row]
                        print("row::\(row)")
                        if let r = row as? Dictionary<String, Any>
                        {
                            if let imageUrl = r["urlToImage"] as? String
                            {
                                controller.imageUrl = imageUrl
                            }
                            
                            if let desc = r["description"] as? String
                            {
                                controller.desc = desc
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableviewmain.delegate = self
        tableviewmain.dataSource = self
        
        getNews()
    }


}

