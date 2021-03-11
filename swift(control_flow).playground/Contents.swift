//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

var namedic:[String:Int] = ["song":4, "kin":8, "dgdg":7, "sdgsdg":4]
let name:Set = ["song", "kim", "park", "chang" ]

if name.count > 0 {
    print("이름은 \(name) 입니다.")
}
else {
    print("no name")
}

for stat in name{
    print("name is \(stat)")
}

for i in stride(from: 0, to: 5, by: 1) //이케 써서 제어할 수도 있겠다.
{
    print("\(i)")
}

for i in 0...5 //이케 써서 제어할 수도 있겠다.
{
    print("\(i)")
}

for (a, b) in namedic
{
    print("key:\(a)")
    print("values:", b)       //위처럼 쓰나 밑처럼 쓰나 똑같은듯
    switch b {
    case 4:
        print("value is \(b)")
    case 8:
        print("value is \(b)")
    case 5...7:                   //값의 범위 이케 표현가능
        print("value is \(b)")
    case _ where b>9:             //조건 넣을때
        print("value is \(b)")
    default:
        print("value is not 4 or 8")
    }
}

//-------------------------------------------optional(Nil)------------------------------------
var pp:String = "hello"
var title:String? = nil //타입 뒤에 물음표 넣어서 optional을 만듬 (없을 수 있다!)
title = "storyboard"  //optional로 만든 변수는 이케 나중에 값을 넣을 수 있음
var ratings:[Int]? = nil

//optional 변수를 사용하는 방법
//1. 변수 뒤에 !붙이기 -> 값의 존재를 확신할 때
print("i'm \(pp) \nand we're \(title!)")

//2. if let, if var 사용
if let let_title = title //title 값이 있다면
{
    print(let_title)
}

if let let_rating = ratings // ratings는 nil이니까 조건문에 안들어감
{
    print(let_rating)
}

//3. 변수 선언시 ?가 아니라 !를 쓰자
var title_2:String! = nil
title_2 = "storyboard"
print("i'm \(pp) \nand we're \(title_2!)") //이거 왜 오류 뜨냐,, !안써도 된다며...

//이케 쓰면 되는데 왜 구지 optional을 쓰는걸까..?
var tit:Int
tit = 9

