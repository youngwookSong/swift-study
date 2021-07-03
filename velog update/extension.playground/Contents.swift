import UIKit

extension Double {
    var squared: Double {
        return self * self
    }
}

let myValue:Double = 3.5
print(myValue.squared)
print(3.5.squared)     //이렇게 Double형에도 사용가능

