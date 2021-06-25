import UIKit

enum RiseError : Error {
    case overSizeYear
    case incorrectData(part: Int)
}

func getNextYear(year: Int) throws -> Int {
    guard year <= 2020 else {
        throw RiseError.overSizeYear
    }
    
    guard year >= 0 else {
        throw RiseError.incorrectData(part: year)
    }
    
    return year+1
}

/*let x = try? getNextYear(year: 2000)
print(x)*/

let x = try! getNextYear(year: 2000)
print(x)

func getNextYearDoCatch(paramYear: Int) {
    var err: Int = 0
    do {
        err = try getNextYear(year: paramYear)
    } catch RiseError.overSizeYear {
        print("년도를 초과해서 입력하였습니다")
    } catch RiseError.incorrectData(let part){
        print("입력한 값이 \(part)이므로 오류입니다.")
    } catch {
        print("default error catch")
    }
    
    print(err)
}

getNextYearDoCatch(paramYear: 3000)
getNextYearDoCatch(paramYear: -10)
getNextYearDoCatch(paramYear: 2000)



