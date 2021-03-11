//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

//-------------------------------------------function------------------------------------
var ratings:[Double]? = nil
ratings = [4.5, 3.0, 5.0, 2.5]

//함수 만들기. -> 다음은 리턴할 요소들. (튜플)
func ratingRecord(history:[Double]) -> (average:Double, min:Double, max:Double)
{
    var sum = 0.0, min = history[0], max = history[0]
    
    for i in history
    {
        if i < min
        {
              min = i
        }
        if i > max
        {
            max = i
        }
        sum += i
    }
    
    let average = sum / Double(history.count)
    return (average, min, max) //튜플로 리턴
}

func print_so(i:Int) -> Int
{
    var s = 0
    print("sosososo")
    s += i
    
    return s
}

let record = ratingRecord(history: ratings!) // 이케 써야되네;; 바뀌었나봄
print(record)
let a = print_so(i:7)

//-------------------------------------------func(실습)------------------------------------

typealias Time = (minute:Int, second:Int)

let lunch = (16, 37)
let walk = (18, 48)

func addTime(time1:Time, time2:Time) -> (m:Int, s:Int)  {
    let secondSum = time1.second + time2.second
    let second = secondSum % 60
    let minute = time1.minute + time2.minute + (secondSum / 60)

    return (minute, second)
}
//atNoon의 값은 (35, 25) 이어야 합니다.
let atNoon = addTime(time1:lunch, time2:walk)
print(atNoon)
print(atNoon.m, atNoon.s)

//-------------------------------------------structure------------------------------------

struct Task
{
    var title:String
    var time:Int?
    
}

var calltask = Task(title:"call to randy", time:10*60) //구조체를 이용한 변수 선언

var reportTask = Task(title: "report task")
reportTask.time = nil

var todayTask:[Task] = [] //배열 안 구조체
todayTask += [calltask, reportTask]
todayTask[1].time = 9*60

print(todayTask)

//optional변수와 그냥 변수의 차이
//optional변수는 선택! 없어도 상관없음. 위에 구조체에서 선언을 안해줘도 됨
//but 그냥 변수는 위에 구조체에서 반드시 선언을 해줘야함 nil값이 아니기 때무
