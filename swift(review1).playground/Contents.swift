//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//----any 타입
var someAny:Any = 100
print(someAny)
someAny = "어떤 타입도 수용 가능"
print(someAny)

//let someDouble:Double = someAny  ->  이러면 컴파일 에러

//------anyobject 타입
class SomeClass{}
var someAnyobject:AnyObject = SomeClass()

//--------------------------------
func mix(n name:String, a:Int, b:[Int], freinds:String...) -> ([Int],Int)
{
    var sum:Int = 0
    var array:[Int] = b
    sum += a
    print("너의 이름은 \(name)")
    print("안녕 \(freinds)")
    for i in 1...3
    {
        sum = sum + i
        array += [sum]
    }
    
    return (array,sum)
}

let (a,b) = mix(n: "song", a: 100, b: [1,2,3], freinds: "k","b", "G")
print(a)
print(b)

//옵셔널 마스터ㅓㅓㅓㅓㅓㅓ
var test1:Int
var test2:Int? //int와 int?는 아예 다른 타입이다ㅏ
test2 = 30
print(test2!) //int?인 test2에 nil일 경우 !사용하면 에러 발생 그래서 옵셔널 바인딩사용

if let tt = test2
{
    print("num is \(tt)")
}
else
{
    print("num is nil")
}

//암시적 추출 옵셔널
var myphone:String! = "iphone"
print(myphone as Any)

myphone = nil

if let phone = myphone
{
    print("my phone is \(phone)")
}
else
{
    print("myphone == nil")
}

var num:Int? = 2
print(num!)
num = nil
print(num as Any)

var num2:Int! = 2
print(num2!)
num2 = nil
print(num2 as Any)
