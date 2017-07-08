//
//  Fly.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

public extension UIView
{
    struct Key
    {
        static var bottomConstraint = "bottomConstraint"
        static var topConstraint = "topConstraint"
        static var rightConstraint = "rightConstraint"
        static var leftConstraint = "leftConstraint"
    }
    
    var bottomConstant: CGFloat?
    {
        get { return objc_getAssociatedObject(self, &Key.bottomConstraint) as? CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.bottomConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var topConstant: CGFloat?
    {
        get { return objc_getAssociatedObject(self, &Key.topConstraint) as? CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.topConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var rightConstant: CGFloat?
    {
        get { return objc_getAssociatedObject(self, &Key.rightConstraint) as? CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.rightConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var leftConstant: CGFloat?
    {
        get { return objc_getAssociatedObject(self, &Key.leftConstraint) as? CGFloat }
        set(value) { objc_setAssociatedObject(self, &Key.leftConstraint, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func flyInFromTop(withTopConstraint topConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void = {})
    {
        guard let top = topConstraint else
        {
            UIView.animate(withDuration: duration, animations: { 
                
                self.frame.origin.y = 0
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        topConstant = top.constant
        top.constant = -bounds.height
        layoutIfNeeded()
        if let topConst = topConstant { top.constant = topConst }
        UIView.animate(withDuration: duration, animations: { 
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromBottom(withBottomConstraint bottomConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void = {})
    {
        guard let bottom = bottomConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                if let superView = self.superview
                {
                    self.frame.origin.y = superView.bounds.height - self.bounds.height
                }
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        bottomConstant = bottom.constant
        bottom.constant = -bounds.height
        layoutIfNeeded()
        if let bottomConst = bottomConstant { bottom.constant = bottomConst }
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromRight(withRightConstraint rightConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let right = rightConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                if let superView = self.superview
                {
                    self.frame.origin.x = superView.bounds.width - self.bounds.width
                }
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }

        rightConstant = right.constant
        right.constant = -bounds.width
        layoutIfNeeded()
        if let rightConst = rightConstant { right.constant = rightConst }
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromLeft(withLeftConstraint leftConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let left = leftConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                self.frame.origin.x = 0
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        leftConstant = left.constant
        left.constant = -bounds.width
        layoutIfNeeded()
        if let leftConst = leftConstant { left.constant = leftConst }
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToTop(withTopConstraint topConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let top = topConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                self.frame.origin.y = 0 - self.bounds.height
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        topConstant = top.constant
        layoutIfNeeded()
        top.constant = -bounds.height
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToBottom(withBottomConstraint bottomConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let bottom = bottomConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                if let superView = self.superview
                {
                    self.frame.origin.y = superView.bounds.height
                }
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }

        bottomConstant = bottom.constant
        layoutIfNeeded()
        bottom.constant = -bounds.height
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToRight(withRightConstraint rightConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let right = rightConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                if let superView = self.superview
                {
                    self.frame.origin.x = superView.bounds.width
                }
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        rightConstant = right.constant
        layoutIfNeeded()
        right.constant = -bounds.width
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToLeft(withLeftConstraint leftConstraint: NSLayoutConstraint?, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        guard let left = leftConstraint else
        {
            UIView.animate(withDuration: duration, animations: {
                
                self.frame.origin.x = 0 - self.bounds.height
                
            }) { (finished) in
                
                completion()
                
            }
            
            return
        }
        
        leftConstant = left.constant
        layoutIfNeeded()
        left.constant = -bounds.width
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }

}
