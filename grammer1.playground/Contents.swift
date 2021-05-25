import UIKit

/*let name : [String] = ["song", "kim", "park", "chang" ]

var i : Int = 0
while i < 4 {
    print("name is \(name[i])")
    i += 1
}

var j : Int = 0
while j < 5 {
    print("\(j)")
    j += 1
}*/

/*var name : Array<String> = ["song", "kim", "kang", "park", "choi"]
var number : [Int] = [10,8,3,7] //이케 선언해도 됨

name += ["lee"] //배열에 요소 추가
number.append(99) //append를 이용하여 배열에 요소 추가

print(name[0])    //배열은 이케 접근
print(name[3])
print(name.first!) //첫번째 요소 접근
print(name.last!)  //마지막 요소 접근

let Backup = name //배열 복사
print(Backup)*/

/*var namedic:[String:Int] = ["song":4, "kim":8, "kang":15, "park":8, "choi":4]

namedic["dong"]=10 //딕셔너리 추가

print(namedic.keys) //딕셔너리의 키값들
print(namedic.values) //딕셔너리의 값들

print(namedic["song"])
print(namedic["kang"])

let namestr = [String](namedic.keys) //딕셔너리의 키를 배열로 가져옴
print(namestr)*/

/*let subway : Set = ["시청", "을지로", "방배", "용산", "이촌", "성수"]
var subway2 : Set = ["용산", "대화", "오금", "대치", "강남", "성수"]

//교집합을 새로운 set으로 만들어줌
let transfer = subway2.intersection(subway)
print(transfer)

//subway2에서 차집합을 새로운 set으로 만들어줌
let nottransfer = subway2.subtracting(subway)
print(nottransfer)

//합집합을 새로운 set으로 만들어줌
let union = subway2.union(subway)
print(union)

subway2.insert("군자")
print(subway2)
subway2.remove("군자")
print(subway2)*/

/*func add (a:Int, b:Int) -> Int {
    var sum : Int
    sum = a + b
    return sum
}

print(add(a: 4, b: 5))*/

/*func string_ex (name:String, age:Int, height:Double) -> String {
    return "my name is \(name), age is \(age), height is \(height)"
}

let sentence = string_ex(name: "Song", age: 24, height: 182)
print(sentence)*/

/*var a : String? = "abc"
var b : String

b = a!

print(b)*/



/*var c : Int?

c = 5
c = nil

print(c!)*/

/*class Name {
    var name = "Song"
    
    func my_name() {
        print("my name is \(name)")
    }
}

class YourName : Name {
    var yourName = "Kim"
    
    func ourName() {
        print("my name is \(name) and your name is \(yourName)")
    }
}*/

/*class Name {
    var name : String
    var age : Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    func my_name() {
        print("my name is \(name) and \(age) year's old")
    }
}

let name1 : Name = Name(name: "song", age: 24)
let name2 : Name = Name(name: "kim", age: 25)

name1.my_name()
name2.my_name()*/

/*struct Name {
    var name: String = "kim"
    var age: Int
    
    func my_name() {
        print("my name is \(name) and \(age) year's old")
    }
    
    init(name: String) {
        self.name = name
        self.age = 24
    }
}

var song : Name = Name(name: "song")

print(song.name)
song.my_name()*/


/*class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name)이 초기화됨")
    }
    deinit {
        print("\(name)이 해제됨")
    }
}

var reference1: Person? = Person(name: "Song")

var reference2: Person? = reference1
var reference3: Person? = reference1

reference1 = nil
reference2 = nil

reference3 = nil*/







