//
//  LoadingView.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/2/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import UIKit

public class LoadingView: UIView
{
    public enum LoadingType
    {
        case box
        case circle
        case dots
    }
    
    public var color: UIColor = .electronBlue
    public var font: UIFont = UIFont.systemFont(ofSize: 20)
    public var textColor: UIColor = .white
    
    var viewType: LoadingType = .circle
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(center: CGPoint, width: CGFloat, type: LoadingType)
    {
        super.init(frame: CGRect(center: center, width: width, height: width))
        self.viewType = type
        self.isOpaque = false
        self.backgroundColor = .clear
    }
    
    public override func draw(_ rect: CGRect)
    {
        layer.cornerRadius = 25
        layer.masksToBounds = true
        
        if viewType == .box {
            
        }
        else if viewType == .circle {
            
        }
        else if viewType == .dots {
            for i in 1...3 {
                let dot = CAShapeLayer()
                let circle = CGRect(center: CGPoint(x: centerX + width/4 * CGFloat(i-2), y: centerY - width/10), width: width/5, height: width/5)
                let circlePath = UIBezierPath(ovalIn: circle)
                dot.path = circlePath.cgPath
                dot.fillColor = color.cgColor
                dot.lineWidth = 0
                
                let subcircle = CAShapeLayer()
                let subPath = UIBezierPath(ovalIn: circle.insetBy(dx: width/50, dy: width/50))
                subcircle.path = subPath.cgPath
                subcircle.fillColor = color.darker(factor: 0.5).cgColor
                subcircle.lineWidth = 0
                dot.addSublayer(subcircle)
                
                let group = CAAnimationGroup()
                group.duration = 1.1
                group.repeatCount = .infinity
                
                let anim = CABasicAnimation(keyPath: "transform.translation.y")
                anim.fromValue = 0
                anim.toValue = -20
                anim.duration = 0.1
                anim.autoreverses = true
                anim.beginTime = (anim.duration * CFTimeInterval(i-1)) / 3
                anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                
                group.animations = [anim]
                
                dot.add(group, forKey: "groupAnim")
                
                layer.addSublayer(dot)
            }
        }
        
        let loadingLabel = UILabel(frame: CGRect(center: CGPoint(x: centerX, y: centerY + width/4), width: width, height: width/4))
        loadingLabel.text = "Loading"
        loadingLabel.font = font
        loadingLabel.textColor = textColor
        loadingLabel.textAlignment = .center
        addSubview(loadingLabel)
    }
}
