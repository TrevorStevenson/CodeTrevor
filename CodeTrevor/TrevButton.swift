//
//  TrevButton.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/28/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import UIKit

public class TrevButton: UIButton
{
    public var color: UIColor = UIColor.americanRiver
    
    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                self.alpha = 0.6
            }
            else {
                self.alpha = 1.0
            }
            
            super.isHighlighted = newValue
        }
    }
    
    public init(center: CGPoint, width: CGFloat, height: CGFloat)
    {
        super.init(frame: CGRect(center: center, width: width, height: height))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func draw(_ rect: CGRect)
    {
        let bgLayer = CAShapeLayer()
        let bg = UIBezierPath(rect: bounds)
        bgLayer.path = bg.cgPath
        bgLayer.fillColor = color.cgColor
        
        let buttonLayer = CAShapeLayer()
        let border = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
        buttonLayer.path = border.cgPath
        
        let accentLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width/4, y: 0))
        path.addLine(to: CGPoint.zero)
        path.close()
        accentLayer.path = path.cgPath
        accentLayer.fillColor = color.darker(factor: 0.75).cgColor
        layer.insertSublayer(accentLayer, at: 0)
        layer.insertSublayer(bgLayer, at: 0)
        layer.mask = buttonLayer
    }
}
