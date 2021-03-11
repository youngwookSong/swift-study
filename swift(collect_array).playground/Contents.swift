//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import Foundation

//-------------------------------------------var, let-------------------------------------------
var str:String = "hello world" //변수(변경 가능)
print("\(str)") //콘솔 창에 뜨게할 수 있음

let num:Int = 200 //상수(변하지 않는 값, 변경 X),
var num2 = 100    // :Int는 생략가능(Int다!)

num2 += 10
//num2 += 20.5 이케 float은 더할 수 없음
print(num2)

//-------------------------------------------String과 Int-------------------------------------------
let name:String = "youngwook"
var greeting = "Hello"

greeting += " " + name
print("안녕 \(greeting)")

name.count // 메소드들 이용할 수 있다.
greeting.count

let url = "www.codershigh.com"
let hasprotocol = url.hasPrefix("http://") //url에 저 string이 붙어있는가

var maxspeed:Int = 200
maxspeed += Int(20.5) //형 변환 가능

let intMax = Int.max //가장 큰 정수
let UintMax = UInt.max //가장 큰 양의 정수
let intMin = Int.min //가장 작은 정수
let UintMin = UInt.min //가장 작은 양의 정수

let pi = 3.14 //double(소수)
let divider = 2 //int(정수)
let halfpi = pi/Double(divider) //이케 더블로 만들어준다음(같은 형으로) 연산해야됨

//-------------------------------------------튜플-------------------------------------------
let time1 = (9,0,48)
let time2:(h:Int, m:Int, s:Int) = (11,51,5) //typealias 사용
let duration = (time1, time2)

time1.0 //이케 요소 접근 가능
time2.h //이케 요소 접근 가능
time2.m //이케 요소 접근 가능
duration.0.2 //이케 2차원 튜플 접근 가능 아니면 밑에 방법으로

let(start, end) = duration
end.h                        //이케도 쓸 수 있다.

typealias  Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time) //이케 만들고 많이 쓸 수 있음

let today:Duration = ((9,10,23), (17,8,21)) //-> 위에 타입얼라이언스의 개수와 맞아야됨
//let today = Duration((9,10,23), (17,8,21)) 이케 쓰는 것도 가능
print("We studied until \(today.end.h)!")

//-------------------------------------------배열-------------------------------------------
var meetingRooms:Array<String> = ["song", "kin", "dgdg", "sdgsdg"]
var groups:[Int] = [10,8,3,7] //이케 선언해도 됨

meetingRooms += ["park"] //배열에 요소 추가

let maxSpeed:Int = 200
var currentSpeed:Int = 110
currentSpeed += 10

var speedHistory:[Int] = []
speedHistory += [maxspeed] //배열에 요소 추가
let gpsSpeed0901 = 114.1
speedHistory.append(Int(gpsSpeed0901)) //append를 사용할 수 잇구나!

speedHistory[0] //배열은 이케 접근
speedHistory.first //첫번째 요소 이케 접근 가능
speedHistory.last

let historyBackup = speedHistory //배열 복사
historyBackup

//-------------------------------------------dictionary-------------------------------------------
var namedic:[String:Int] = ["song":4, "kin":8, "dgdg":8, "sdgsdg":4]

namedic["dong"]=10 //딕셔너리 추가
namedic["song"]

namedic.keys //딕셔너리의 키값들
namedic.values //딕셔너리의 값들

let namestr = [String](namedic.keys) //딕셔너리의 키를 배열로 가져옴

//-------------------------------------------set-------------------------------------------
let subway:Set = ["시청", "을지로", "방배", "용산", "이촌", "성수"]
var subway2:Set = ["용산", "대화", "오금", "대치", "강남", "성수"]

let transfer = subway2.intersection(subway) //교집합을 새로운 set으로 만들어줌
let nottransfer = subway2.subtracting(subway) //subway2에서 교집합이 아닌거만 set으로 만들어줌
let union = subway2.union(subway) //합집합을 만들어줌

subway2.insert("군자") //이거 인덱스 찾아서 넣는거는 어케하는지 알아보기
subway2
subway2.remove("군자") //이것도 인덱스 찾아서 넣는거는 어케하는지 알아보기
subway2


