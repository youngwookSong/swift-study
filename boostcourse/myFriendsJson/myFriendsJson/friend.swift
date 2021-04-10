//
//  friend.swift
//  myFriendsJson
//
//  Created by 송영욱 on 2021/04/10.
//

import Foundation

/*
{
    "name":"하나",
    "age":22,
    "address_info": {
        "country":"대한민국",
        "city":"울산"
    }
}
*/

//codable 프로토콜
struct Friend: Codable{
    struct Address: Codable {
        let country : String
        let city : String
    }
    
    let name:String
    let age:Int
    let addressInfo:Address
    
    //추가----
    var nameAndAge : String{
        return self.name + "(\(self.age))"
    }
    
    var fullAddress : String {
        return self.addressInfo.city + "," + addressInfo.country
        
    }
    
    //이거는 왜 쓰는지 잘 몰것다.
    enum CodingKeys: String, CodingKey
    {
        case name, age
        case addressInfo = "address_info"
    }
}
