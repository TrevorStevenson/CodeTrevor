//
//  Point.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/24/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import Foundation

public extension CGPoint
{
    public init(point: CGPoint, offset: CGFloat)
    {
        self.init(x: point.x + offset, y: point.y + offset)
    }
    
    public init(point: CGPoint, offsetX: CGFloat, offsetY: CGFloat)
    {
        self.init(x: point.x + offsetX, y: point.y + offsetY)
    }
}
