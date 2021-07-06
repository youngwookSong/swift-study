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
        print("my name is \(name) and your name is \(yourName)")
    }
}

let song : ourName = ourName()
song.myName()

