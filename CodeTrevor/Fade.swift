//
//  Fade.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

extension UIView
{
    func fadeIn(withDuration duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        alpha = 0.0
        isHidden = false
        
        UIView.animate(withDuration: duration)
        {
            self.alpha = 1.0
        }
    }
    
    func fadeOut(withDuration duration: TimeInterval = 1, completion: @escaping () -> Void)
    {
        alpha = 1.0
        
        UIView.animate(withDuration: duration)
        {
            self.alpha = 0.0
        }
        
        isHidden = true
    }
}
