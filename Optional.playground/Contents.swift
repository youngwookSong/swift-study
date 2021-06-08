import UIKit

//옵셔널 바인딩
/*let x : Int? = 10
let y : Int? = nil

if let xx = x {
    print("x = \(xx)")
}

if let yy = y {
    print("y = \(yy)")
}*/

/*let x : Int? = 10
let y : Int? = nil

func opbinding() {
    
    guard let xx = x else {
        return print("x is Optional")
    }
    print(xx)

    guard let yy = y else {
        return print("y is Optional")
    }
    print(yy)
}

opbinding()*/

//옵셔널 체이닝
/*struct Contacts {
    var email : String
    var address : [String : String]
}

struct Person {
    var name : String
    var contacts : Contacts?
    
    init(name : String, email : String, address : String) {
        self.name = name
        contacts = Contacts(email: email, address: ["home" : address])
    }
}

var my : Person? = Person(name: "Song", email: "wook4506@naver.com", address: "ilsan")

//my = nil

if let my_email = my?.contacts?.email {
    print("I have a email : \(my_email)")
}
else {
    print("nono..")
}*/




/*let name1 : String?
let name2 : String?

name1 = "Song"
name2 = "Kim"

if let nameFirst = name1,
   let nameSecond = name2 {
    print(nameFirst, nameSecond)
}*/


//암묵적 언래핑
/*let x : Int? = 1
let y : Int = x!
let z = x
print(x,y,z)
print(type(of: x))
print(type(of: y))
print(type(of: z))*/

/*let a : Int! = 1
let b : Int = a  //이게 되고 1나옴 a!안해도됨
let c : Int = a!
let d = a        //이거는 옵셔널
let e = a + 1    //이게 되고 2나옴 a! + 1안해도 됨

print(a,b,c,d,e)
print(type(of: a))
print(type(of: b))
print(type(of: c))
print(type(of: d))
print(type(of: e))*/

var a : Int? = 1 //암시적으로 벗겨진 옵셔널

a = 8

print(a)

var b : Int! = 1 //암시적으로 벗겨진 옵셔널

b = nil

print(b)
print(b!)

