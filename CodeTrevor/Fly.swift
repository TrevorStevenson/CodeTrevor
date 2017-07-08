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
    func deactivateConstraints()
    {
        guard let superView = superview else { return }
        
        for view in superView.subviews
        {
            view.translatesAutoresizingMaskIntoConstraints = true
        }
        
        NSLayoutConstraint.deactivate(superView.constraints)
    }
    
    public func flyInFromTop(toValue: CGFloat, withDuration duration: TimeInterval = 1, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromBottom(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromRight(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromLeft(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToTop(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToBottom(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToRight(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToLeft(toValue: CGFloat, withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        deactivateConstraints()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = toValue
            
        }) { (finished) in
            
            completion()
            
        }
    }

}
