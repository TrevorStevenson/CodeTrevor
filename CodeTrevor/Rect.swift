//
//  Rect.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/28/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import Foundation

public extension CGRect
{
    public init(center: CGPoint, width: CGFloat, height: CGFloat)
    {
        self.init(x: center.x - width/2, y: center.y - height/2, width: width, height: height)
    }
}
