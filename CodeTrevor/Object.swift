//
//  Object.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation
import ObjectiveC

extension NSObject
{
    func set(associatedObject: Any, forKey key: String)
    {
        var associatedKey = key
        objc_setAssociatedObject(self, &associatedKey, associatedObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getAssociatedObject(forKey key: String) -> Any
    {
        var associatedKey = key
        return objc_getAssociatedObject(self, &associatedKey)
    }
}
