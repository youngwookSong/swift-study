//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func add(a:Int, b:Int) -> Int
{
    return a+b
}

func multi(a:Int, b:Int) -> Int
{
    return a*b
}

var mathFunction:(Int, Int) -> Int = add //이케 타입을 함수 타입으로 설정가능
mathFunction(2,3)

mathFunction = multi //이케 바꿀수도 있음 대신 타입이 같아야 함
mathFunction(2,3)

//----------------------------------------------------함수를 변수에 넣기------------------------------------
func addVAT(source:Double) -> Double
{
    return source * 1.1
}

func couponDis(source:Double) -> Double
{
    return source * 0.9
}

var additional:(Double) -> Double //함수 타입으로 변수 선언
additional = addVAT

let transaction = 120.7

let price = additional(transaction)

//아주 괴상하게 쓸 수도 있음...
func finalPrice(source:Double, additional:(Double) -> Double) -> Double
{
    let price = additional(source)
    return price
}

let price03 = finalPrice(source: 350.0, additional: couponDis) //이케 쓰면 됨

//-----------------------------------------closure--------------------------------------------
//미니 함수 느낌. lamda랑 비슷하네
let addVATclosure = { (source:Double) -> Double in
    return source * 1.1
}

//closure 축약1
let addVATclosure2 = { source in
    return source * 1.1
} //타입은 생략해도 됨

//closure 축약2
let addVATclosure3 = { source in
    source * 1.1
} //리턴도 생략해도 됨

//closure 축약3
let addVATclosure4 = { $0 * 1.1} //이케 요소도 생략할 수 있다

let couponDisclosure = { (source:Double) -> Double in
    return source * 0.9
}

let priceclosure = addVATclosure(157.6)
let priceclosure4 = addVATclosure4(157.6)

//-----------------------------------------curring--------------------------------------------
func makeAdder (x:Int) -> (Int) -> Int //함수를 리턴
{
    func adder(a:Int) -> Int
    {
        return x + a
    }
    return adder(a:)
}

func makeAdder2 (x:Int) -> (Int) -> Int
{
    let adder:(Int) -> Int = {
        return $0 + x //$0 = 첫번째 매개변수
    }
    return adder
}

func makeAdder3 (x:Int) -> (Int) -> Int {
    return {
        return $0 + x
    }
}

let add5 = makeAdder(x: 5)
let add10 = makeAdder(x: 10)

let add5_2 = makeAdder2(x: 5)
let add10_2 = makeAdder2(x: 10)

let add5_3 = makeAdder3(x: 5)
let add10_3 = makeAdder3(x: 10) //결과는 다 같음

print(add5(2))
print(add10(2))

print(add5_2(2))
print(add10_2(2))

print(add5_3(2))
print(add10_3(2))

print(makeAdder3(x:5)(2)) //이케 한줄로 표현도 가능

//-----------------------------------------map--------------------------------------------
//함수 매핑
let array = [10.0,11.1,12.2,13.3,14.4] //Double

func tiadd(source:Double) -> Double
{
    return source * 1.1
}

var pricee:[Double] = []

for i in array
{
    pricee += [tiadd(source: i)]
}

let mappricee = array.map({i -> Double in
    return i * 1.1
}) // 이케 매핑을 할 수 있다.

let mappricee2 = array.map({$0 * 1.1})

//-----------------------------------------------filter---------------------------------------------------
var bigTransaction:[Double] = []
var num:[Double] = [1,2,3,4,5]

for price in num {
    if price >= 3
    {
        bigTransaction += [price]
    }
}

let bigFilterTransactions = num.filter { $0 >= 3} //배열에다 필터 적용 $0은 요소
print(bigFilterTransactions) // 3보다 큰것만 남아있다.

var meetingRooms:[String:Int] = ["Banksy":30, "Rivera":4, "Kahlo":70]

let member = 9
let available = meetingRooms.filter{$0.1 >= member} //$0.1 = 딕셔너리일때 각요소의 값들
print(available)

//-----------------------------------------------sort---------------------------------------------------
var num2 = [10,2,35,1,70,34]

func Sort(sort1:Double, sort2:Double) -> Bool
{
    return sort1 > sort2
}

num2.sort(by: {$0 > $1}) //밑에 꺼로 생략 가능
num2.sort(by: >) //sort는 원본 배열을 정렬
let sort11 = num2.sorted()  //sorted = 원본배열 파괴 X
print(sort11)

let sort_dict = meetingRooms.sorted(by: { $0.1 > $1.1}) //딕셔너리 정렬
print(sort_dict)

//-----------------------------------------------reduce---------------------------------------------------
//범용함수

let pricetag:[Double] = [1,2,3,4,5,6]

func pricesum(base:Double, adder:Double) -> Double
{
    return base + adder
}

var sum:Double = 0.0
for price in pricetag
{
    sum = pricesum(base: sum, adder: price)
}

print(sum)

var sum2:Double = 0.0
let sumReduce = pricetag.reduce(sum2, pricesum)

let sumReduce2 = pricetag.reduce(0.0, +)

//var meetingRooms:[String:Int] = ["Banksy":30, "Rivera":4, "Kahlo":70]
let descrirooms = meetingRooms.reduce("we have meeting rooms : \n", {$0 + "\($1.0) for \($1.1) person \n"})
