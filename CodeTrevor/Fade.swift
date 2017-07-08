//
//  Fade.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

public extension UIView
{
    public func fadeIn(withDuration duration: TimeInterval = 1, completion: @escaping () -> Void = {})
    {
        alpha = 0.0
        isHidden = false
        
        UIView.animate(withDuration: duration, animations: { 
            
            self.alpha = 1.0
            
        }) { (finished) in
            
            completion()
            
        }
    }
    
    public func fadeOut(withDuration duration: TimeInterval = 1, completion: @escaping () -> Void = {})
    {
        alpha = 1.0
        
        UIView.animate(withDuration: duration, animations: {
            
            self.alpha = 0.0
            
        }) { (finished) in
            
            completion()
            self.isHidden = true

        }
    }
    
    public func fadeInAndOut(withFadeDuration fadeDuration: TimeInterval, delay: TimeInterval, completion: @escaping () -> Void = {})
    {
        fadeIn(withDuration: fadeDuration, completion:
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute:
            {
                self.fadeOut(withDuration: fadeDuration, completion: { completion() })
            })
        })
    }
}
