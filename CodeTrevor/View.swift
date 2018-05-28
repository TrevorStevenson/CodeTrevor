//
//  View.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/28/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import Foundation

public extension UIView
{
    public func createBackground(color: UIColor, factor: CGFloat = 0.75)
    {
        self.backgroundColor = color
        let accentLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.size.height/3))
        path.addLine(to: CGPoint(x: frame.size.width/2, y: 0))
        path.addLine(to: CGPoint.zero)
        path.close()
        accentLayer.path = path.cgPath
        accentLayer.fillColor = color.darker(factor: factor).cgColor
        self.layer.addSublayer(accentLayer)
    }
    
}
