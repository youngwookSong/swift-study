//: A UIKit based Playground for presenting user interface
  
import UIKit

struct A { //구조체 (상속이 안됨)
    var a = 10
}

class B { //클래스 (상속이 됨)
    var a = 10
}

var str_1: A = A() //값을 복사 - a값을 바꿔도 struct안의 a는 변화 없음
var cls_1: B = B() //값을 참조 - a값을 바꾸면 class안의 a도 바뀜

var str_2 = str_1
var cls_2 = cls_1

str_1.a = 20
cls_1.a = 20

print("\(str_2.a) \(cls_2.a)") //구조체에는 변화없지만 클래스에는 변화있음
