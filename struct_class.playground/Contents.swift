//: A UIKit based Playground for presenting user interface
  
import UIKit

//struct 구조체, class 집합체

struct A //JSON을 가지고 올때, 상속이 안됨
{
    var a = 10
}

class B //통상적인 함수들, 상속이 됨
{
    var a = 10
}

class C : B
{
    
}

var strA = A() //값을 복사 - a값을 바꿔도 struct안의 a는 변화 없음
var clsB = B() //값을 참조 - a값을 바꾸면 class안의 a도 바뀜

var strAA = strA
var clsBB = clsB

strA.a = 20
clsB.a = 20

print("\(strAA.a) \(clsBB.a)") //구조체에는 변화없지만 클래스에는 변화있음
