//
//  Object.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation
import ObjectiveC

public extension NSObject
{    
    public func set(associatedObject: Any, forKey key: inout String)
    {
        objc_setAssociatedObject(self, key, associatedObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public func getAssociatedObject(forKey key: inout String) -> Any
    {
        return objc_getAssociatedObject(self, key)
    }
}
