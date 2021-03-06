import UIKit

//나중에 꼭 다시 보기
//구조체에서만 가능
struct Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name.uppercased()
        self.age = age
    }
    
    mutating func changeAge() {
        age = 10
    }
}

var man = Person(name: "Song", age: 24)
man.changeAge()
print(man.age)
