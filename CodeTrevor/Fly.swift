//
//  Fly.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

extension UIView
{
    struct Key
    {
        static var bottomConstraint = "bottomConstraint"
        static var topConstraint = "topConstraint"
    }
    
    var bottomConstant: CGFloat
    {
        get { return objc_getAssociatedObject(self, &Key.bottomConstraint) as! CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.bottomConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func flyInFromTop(withTopConstraint topConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        set(associatedObject: topConstraint.constant, forKey: &Key.topConstraint)
        topConstraint.constant = -bounds.height
        layoutIfNeeded()
        topConstraint.constant = getAssociatedObject(forKey: &Key.topConstraint) as! CGFloat
        UIView.animate(withDuration: duration, animations: { 
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromBottom(withBottomConstraint bottomConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        bottomConstant = bottomConstraint.constant
        bottomConstraint.constant = -bounds.height
        layoutIfNeeded()
        bottomConstraint.constant = bottomConstant
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
}
