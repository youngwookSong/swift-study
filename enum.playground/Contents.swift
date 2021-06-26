import UIKit

//열거형 기본 형태
/*enum Compass {
    case North
    case South
    case East
    case West
}

enum Compass1 {
    case North, South, East, West
}

print(Compass.North)
var x : Compass = Compass.South
print(x)
x = .North
print(x)

//열거형과 switch
switch x {
case .North:
    print("북")
case .South:
    print("남")
case .East:
    print("동")
case .West:
    print("서")
}*/

//열거형 안의 메소드
/*enum Week : String {
   case Mon, Tue, Wed, Thur, Fri, Sat, Sun
    func printWeek() {
        switch self {
        case .Mon, .Tue, .Wed, .Thur, .Fri:
            print("주중")
        case .Sat, .Sun:
            print("주말")
        }
    }
}

Week.Sun.printWeek()
Week.Tue.printWeek()*/

//열거형의 rawValue
/*enum Color: Int {
    case red = 1
    case green = 2
    case blue = 3
}

print(Color.red)
print(Color.red.rawValue)
print(Color.blue)
print(Color.blue.rawValue)*/

enum Color: String {
    case red = "빨"
    case green = "초"
    case blue
}

print(Color.red)
print(Color.red.rawValue)
print(Color.blue)
print(Color.blue.rawValue)


