//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

//-------------------------------------------class-------------------------------------------
//같은 단어 선택 -> command + control + E
struct Task
{
    var title:String
    var time:Int?
    
    var owner:Employee        //주인은 무조건 있다
    var participant:Employee? //참가자가 없을 수도 있으니까 optional로 선언
}

class Employee
{
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
}

let me:Employee = Employee()
me.name = "Alex"
me.phoneNumber = "010-2424-1152"

let toby = Employee()
toby.name = "Toby"
toby.phoneNumber = "010-8481-2848"

var call = Task(title:"call", time: 10*60, owner: me, participant: nil)
var report = Task(title:"report", time: 15*60, owner: me, participant: toby)
call.participant?.phoneNumber //?는 값이 없을때. !는 값이 있을때

//-------------------------------------------enumerations-------------------------------------------

struct Task2
{
    var title:String
    var time:Int?
    
    var owner:Employee        //주인은 무조건 있다
    var participant:Employee? //참가자가 없을 수도 있으니까 optional로 선언
    
    var type:TaskType
    enum TaskType {  //약간 스위치문 같은 거
        case call
        case report
        case meet
        case support
        
        var typeTitle:String{
            get{
                let titleString:String
                switch self {
                case .call:
                    titleString = "Call"
                case .report:
                    titleString = "report"
                case .meet:
                    titleString = "meet"
                case .support:
                    titleString = "support"
                }
                return titleString
            }
        }
    }
}

var ttt = Task2(title:"call", time:600, owner: me, participant: toby, type: .call)
var tttt = Task2(title:"report", time:700, owner: me, participant: toby, type: Task2.TaskType.report)


enum Fuel {
    case Gasoline // 휘발유
    case Diesel // 경유
    case LPG // 가스
}

// 빈 칸을 enum을 써서 채워보세요
let mini01Fuel = Fuel.Diesel
let mini02Fuel = Fuel.Gasoline

print("mini01은 연료로 \(mini01Fuel)을 쓰고, mini02는 연료로 \(mini02Fuel)을 씁니다")

//-------------------------------------------초기화 작업-------------------------------------------
struct Task3
{
    var title:String
    var time:Int?
    
    var owner:Employee        //주인은 무조건 있다
    var participant:Employee? //참가자가 없을 수도 있으니까 optional로 선언
    
    var type:TaskType
    enum TaskType
    {  //약간 스위치문 같은 거
        case call
        case report
        case meet
        case support
        
        var typeTitle:String
        {
            get
            {
                let titleString:String
                switch self
                {
                    case .call:
                        titleString = "Call"
                    case .report:
                        titleString = "report"
                    case .meet:
                        titleString = "meet"
                    case .support:
                        titleString = "support"
                }
                return titleString
            }
        }
    }

    init(type:TaskType, owner:Employee) {  //초기화
        self.type = type
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
        self.participant = nil
    }
}

class Employee2
{
    var name:String?
    var phoneNumber:String?
    var boss:Employee2?
    
    init(name:String, phone:String) {        //class는 이케 초기화를 무조건 시켜줘야함. 위에서는 다 optional이라서 상관없음
        self.name = name
        self.phoneNumber = phone
    }
}

var init_call = Task3(type: .call, owner: me)
var init_report = Task3(type: .report, owner: me)

let toto = Employee2(name: "toto", phone:"12131")
let boss = Employee2(name:"boss", phone: "141141")
toto.boss = boss

//-------------------------------------------메소드-------------------------------------------

class Employee3
{
    var name:String?
    var phoneNumber:String?
    var boss:Employee3?
    
    init(name:String, phone:String) {        //class는 이케 초기화를 무조건 시켜줘야함. 위에서는 다 optional이라서 상관없음
        self.name = name
        self.phoneNumber = phone
    }
    
    func report()  //class 안에 있으니까 메소드이다.
    {
        if let myBoss = boss //만약 보스가 있다면
        {
            print("\(self.name!) reported to \(myBoss.name!)")
        }
        else
        {
                print("nono")
        }
    }
}

let toto1 = Employee3(name: "toto", phone:"12131")
let boss1 = Employee3(name:"boss", phone: "141141")
toto1.boss = boss1
toto1.report()

//-------------------------------------------enum-----------------------------------------
enum enumm
{
    case call(num:String)
    case report(to:Employee3, when:String)
    case meet(with:Employee3, location:String)
    case support(who:Employee3, duration:Int)
}

var pp = enumm.report(to: toto1, when: "453")
print(pp)
