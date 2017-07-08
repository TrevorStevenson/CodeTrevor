//
//  Scale.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/24/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

public extension UIView
{
    public func scale(from: Float, to: Float, withDuration duration: TimeInterval, repeatCount: Float, autoreverses: Bool)
    {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = from
        scaleAnimation.toValue = to
        scaleAnimation.duration = duration
        scaleAnimation.repeatCount = repeatCount
        scaleAnimation.autoreverses = autoreverses
        layer.add(scaleAnimation, forKey: nil)
    }
    
    public func scaleUp(withDuration duration: TimeInterval, to: Float = 1.25, completion: () -> Void = {})
    {
        scale(from: 1.0, to: to, withDuration: duration, repeatCount: 1, autoreverses: true)
        completion()
    }
    
    public func scaleDown(withDuration duration: TimeInterval, to: Float = 0.75, completion: () -> Void = {})
    {
        scale(from: 1.0, to: to, withDuration: duration, repeatCount: 1, autoreverses: true)
        completion()
    }
}
