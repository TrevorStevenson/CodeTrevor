//
//  Color.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/25/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import Foundation

public extension UIColor
{
    public convenience init(hex: String, alpha: CGFloat)
    {
        guard hex.count != 0 else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        
        var hexString = hex
        
        if let first = hexString.first {
            if first == "#" {
                hexString.removeFirst()
            }
        }
        
        let hexValue = UInt32(hexString, radix: 16)
        
        if let hexVal = hexValue {
            let r = (hexVal & 0x00FF0000) >> 16
            let g = (hexVal & 0x0000FF00) >> 8
            let b = hexVal & 0x000000FF

            self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        }
        else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
    public func darker(factor: CGFloat) -> UIColor
    {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: red * factor, green: green * factor, blue: blue * factor, alpha: 1.0)
    }
}
