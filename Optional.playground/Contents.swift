import UIKit

/*let x : Int? = 10
let y : Int? = nil

if let xx = x {
    print("x = \(xx)")
}

if let yy = y {
    print("y = \(yy)")
}*/

let x : Int? = 10
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

opbinding()


/*let name1 : String?
let name2 : String?

name1 = "Song"
name2 = "Kim"

if let nameFirst = name1,
   let nameSecond = name2 {
    print(nameFirst, nameSecond)
}*/







/*let x : Int? = 1
let y : Int = x!
let z = x
print(x,y,z)
print(type(of: x))
print(type(of: y))
print(type(of: z))

let a : Int! = 1
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
