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
        static var rightConstraint = "rightConstraint"
        static var leftConstraint = "leftConstraint"
    }
    
    var bottomConstant: CGFloat
    {
        get { return objc_getAssociatedObject(self, &Key.bottomConstraint) as! CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.bottomConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var topConstant: CGFloat
    {
        get { return objc_getAssociatedObject(self, &Key.topConstraint) as! CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.topConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var rightConstant: CGFloat
    {
        get { return objc_getAssociatedObject(self, &Key.rightConstraint) as! CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.rightConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var leftConstant: CGFloat
    {
        get { return objc_getAssociatedObject(self, &Key.leftConstraint) as! CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.leftConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func flyInFromTop(withTopConstraint topConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        topConstant = topConstraint.constant
        topConstraint.constant = -bounds.height
        layoutIfNeeded()
        topConstraint.constant = topConstant
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
    
    public func flyInFromRight(withRightConstraint rightConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        rightConstant = rightConstraint.constant
        rightConstraint.constant = -bounds.width
        layoutIfNeeded()
        rightConstraint.constant = rightConstant
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromLeft(withLeftConstraint leftConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        leftConstant = leftConstraint.constant
        leftConstraint.constant = -bounds.width
        layoutIfNeeded()
        leftConstraint.constant = leftConstant
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
}
