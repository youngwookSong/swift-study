import UIKit

func add(x:Int, y:Int) -> Int {
    return (x+y)
}
print(add(x:10, y:20))

let add1 = {(x:Int, y:Int) -> Int in
    return(x+y)
}
print(add1(10,20))

//후행 클로저
/*let onAction = UIAlertAction(title: "On", style: UIAlertAction.Style.default, handler: {
    //실행 코드
})

let onAction = UIAlertAction(title: "On", style: UIAlertAction.Style.default) {
    //실행 코드
})*/
