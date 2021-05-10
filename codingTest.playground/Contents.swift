import Foundation

/*func solution(_ s:String) -> Int {
    var result : String = ""
    var pass_num = 1
    var code_num = 0
    
    for i in s {
        pass_num -= 1
        
        if pass_num == 0 {
            switch i {
            case "z":
                result.append("0")
                pass_num += 4
            case "o":
                result.append("1")
                pass_num += 3
            case "t":
                code_num = 1
                pass_num += 2
                continue
            case "f":
                code_num = 2
                pass_num += 2
                continue
            case "s":
                code_num = 3
                pass_num += 2
                continue
            case "e":
                result.append("8")
                pass_num += 5
            case "n":
                result.append("9")
                pass_num += 4
            default:
                result.append(String(i))
                pass_num += 1
            }
        }
            
            //t
        if code_num == 1 && i == "w" {
            result.append("2")
            pass_num += 1
            code_num = 0
        }
        if code_num == 1 && i == "h" {
            result.append("3")
            pass_num += 3
            code_num = 0
        }
        
        //f
        if code_num == 2 && i == "o" {
            result.append("4")
            pass_num += 2
            code_num = 0
        }
        if code_num == 2 && i == "i" {
            result.append("5")
            pass_num += 2
            code_num = 0
        }
        
        //s
        if code_num == 3 && i == "i" {
            result.append("6")
            pass_num += 1
            code_num = 0
        }
        if code_num == 3 && i == "e" {
            result.append("7")
            pass_num += 3
            code_num = 0
        }
        
        
    }
    
    print(Int(result)!)
    return 0
}

let a = solution("one4seveneight") */


import Foundation


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var kk : Int = k
    var array : [Int] = []
    var index_que : [Int] = []
    var value_que : [Int] = []
    var queue : Int = -1
    
    for i in 1...n {
        array.append(i)
    }
    
    print(array)
    
    for i in cmd {
        switch i[i.startIndex] {
        case "U":
            kk -= Int(String(i[i.index(before: i.endIndex)]))!
        case "D":
            kk += Int(String(i[i.index(before: i.endIndex)]))!
        case "C":
            index_que.append(kk)
            value_que.append(array[kk])
            queue += 1
            print(index_que)
            
            array.remove(at: kk)
            print(array)
        case "Z":
            array.insert(value_que[queue], at: index_que[queue])
            index_que.remove(at: queue)
            value_que.remove(at: queue)
            print(index_que)
            queue -= 1
            
            print(array)
        default:
            continue
        }
    }
    
    var compare = 0
    var result = ""
    for i in 1...n {
        if array[compare] != i {
            result.append("X")
        }
        else {
            result.append("O")
            compare += 1
        }
        
    }
    return result
}

let a = solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"])


/*func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    var present = start
    
    return 0
}*/

