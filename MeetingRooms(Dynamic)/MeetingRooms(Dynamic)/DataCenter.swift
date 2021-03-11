//
//  DataCenter.swift
//  MeetingRooms(Dynamic)
//
//  Created by 송영욱 on 2021/03/04.
//

import Foundation

let datacenter:DataCenter = DataCenter()

class DataCenter
{
    var branches:[Branch] = []
    
    init()
    {
        let Banksy = meetingRoom(name:"Banksy", capacity:4)
        let Kahlo = meetingRoom(name:"Kahlo", capacity:8)
        let Rivera = meetingRoom(name:"Rivera", capacity:8)
        let Picasso = meetingRoom(name:"Picasso", capacity:10)
        
        let vehicleSer = Service(name:"차량예약")
        let meetingroomSer = Service(name:"회의실예약")
        let visitorSer = Service(name:"방문자예약")
        let deskSer = Service(name:"데스크예약")
        meetingroomSer.items = [Banksy,Kahlo,Rivera,Picasso]
        
        let pangyoBran = Branch(name:"판교점")
        let samsungBran = Branch(name:"삼성점")
        let yeoksamBran = Branch(name:"역삼점")
        let sinrimBran = Branch(name:"신림점")
        let songdoBran = Branch(name:"송도점")
        let anamBran = Branch(name:"안양점")
        pangyoBran.services = [vehicleSer, meetingroomSer,visitorSer,deskSer]
        
        branches += [pangyoBran, samsungBran, yeoksamBran, sinrimBran, songdoBran, anamBran]
    }
}

class Branch
{
    let name:String
    var services:[Service]?
    
    init(name:String)
    {
        self.name = name
    }
}

class Service
{
    let name:String
    var items:[meetingRoom]?
    
    init(name:String)
    {
        self.name = name
    }
}

class meetingRoom
{
    let name:String
    let capacity:Int
    var reservations:[Reservation]?
    
    init(name:String, capacity:Int)
    {
        self.name = name
        self.capacity = capacity
    }
}

class Reservation
{
    var hostNames:String
    var date:NSDate
    var attendees:Int
    var equipments:[String]
    var catering:Bool
    
    init()
    {
        self.hostNames = "Host of Meeting"
        self.date = NSDate()
        self.attendees = 1
        self.equipments = []
        self.catering = false
    }
}
