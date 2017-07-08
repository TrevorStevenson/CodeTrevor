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
    public func flyInFromTop(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = 0
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromBottom(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            if let superView = self.superview
            {
                self.frame.origin.y = superView.bounds.height - self.bounds.height
            }
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromRight(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            if let superView = self.superview
            {
                self.frame.origin.x = superView.bounds.width - self.bounds.width
            }
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyInFromLeft(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = 0
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToTop(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.y = 0 - self.bounds.height
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToBottom(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            if let superView = self.superview
            {
                self.frame.origin.y = superView.bounds.height
            }
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToRight(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            if let superView = self.superview
            {
                self.frame.origin.x = superView.bounds.width
            }
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func flyOutToLeft(withDuration duration: TimeInterval = 1, useAutoLayout autolayout: Bool, completion: @escaping () -> Void = {})
    {
        if autolayout
        {
            let myFrame = self.frame
            NSLayoutConstraint.deactivate(constraints)
            self.frame = myFrame
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            self.frame.origin.x = 0 - self.bounds.height
            
        }) { (finished) in
            
            completion()
            
        }
    }

}
