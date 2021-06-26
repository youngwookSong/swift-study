import UIKit

enum Compass {
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

switch x {
case .North:
    print("북")
case .South:
    print("남")
case .East:
    print("동")
case .West:
    print("서")
}





