//
//  money.swift
//  moneyconverter
//
//  Created by 송영욱 on 2021/02/21.
//

import Foundation

enum Currency:Int
{
    case USD = 0, KRW, JPY, EUR
    
    var ratio:Double
    {
        get
        {
            switch self
            {
                case .USD: return 1.0
                case .KRW: return 1178.5
                case .JPY: return 122.45
                case .EUR: return 0.92
            }
        }
    }
    
    var symbol:String
    {
        get
        {
            switch self
            {
                case .USD: return "$"
                case .KRW: return "₩"
                case .JPY: return "¥"
                case .EUR: return "€"
            }
        }
    }
}

struct Money {
    var usdollar = 0.0
    
    init(_ _usdollar:Double) //매개변수 앞에 _있으면 밑에서 선언할때 매개변수                         따로 안적어 줘도 됨
    {
        usdollar = _usdollar
    }
    
    init(_ amount:Double, currency:Currency) //Currency enum을 이용하여 화폐 단위를 결정
    {
        usdollar = amount / currency.ratio
    }
    
    func valueInCurrency(currency:Currency) -> String
    {
        return "\(currency.symbol) " + "\(usdollar * currency.ratio)"
    }
}

let myMoney = Money(120) //usdollar 일때
let incomeInKRW = Money(350_000, currency: .KRW) //KRW 일때
