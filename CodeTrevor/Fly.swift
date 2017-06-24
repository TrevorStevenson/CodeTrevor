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
    func flyInFromTop(withTopConstraint topConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        set(associatedObject: topConstraint.constant, forKey: "topConstraint")
        topConstraint.constant = -bounds.height
        layoutIfNeeded()
        topConstraint.constant = getAssociatedObject(forKey: "topConstraint") as! CGFloat
        UIView.animate(withDuration: duration, animations: { 
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    func flyInFromBottom(withBottomConstraint bottomConstraint: NSLayoutConstraint, duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        set(associatedObject: bottomConstraint.constant, forKey: "bottomConstraint")
        bottomConstraint.constant = -bounds.height
        layoutIfNeeded()
        bottomConstraint.constant = getAssociatedObject(forKey: "bottomConstraint") as! CGFloat
        UIView.animate(withDuration: duration, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
            completion()
            
        }
    }
}
