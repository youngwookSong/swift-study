import UIKit

class Name { //슈퍼 클래스
    var name = "Song"
    
    func myName() {
        print("my name is \(name)")
    }
}

class ourName : Name {  //하위 클래스
    var yourName = "Kim"
    
    override func myName() {
        super.myName()
        print("my name is \(name) and your name is \(yourName)")
    }
}

let song : ourName = ourName()
song.myName()

//나중에 더 복잡한 오버라이드 공부해보기

