import UIKit

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
