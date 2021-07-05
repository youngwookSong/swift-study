import UIKit

//class Counter {
//    var count = 0
//
//    func increment() {
//        count += 1
//    }
//}
//
//var counter = Counter()
//counter.increment()
//print(counter.count)

class Print {

    class func printMessage() {
        print("Hello!!")
    }
}

class Print2:Print {
    
    override class func printMessage() {
        print("Hello I'm Song!")
    }
}

Print2.printMessage()

