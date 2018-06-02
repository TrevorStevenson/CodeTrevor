//
//  Currency.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/2/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import Foundation

public class Currency
{
    public class func createString(money: Double) -> String
    {
        var moneyString = "$\((money*100).rounded()/100)"
        if moneyString[moneyString.index(moneyString.endIndex, offsetBy: -2)] == "." {
            moneyString += "0"
        }
        
        var i = moneyString.count - 6
        
        while i >= 2 {
            moneyString.insert(",", at: moneyString.index(moneyString.startIndex, offsetBy: i))
            i -= 3
        }
        
        return moneyString
    }
}
