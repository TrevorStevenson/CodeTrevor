//
//  Pie.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 5/21/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import UIKit

public class Pie: UIView {
    
    var sections: Int = 0
    var radius: CGFloat = 0
    var delta: CGFloat = 5
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public init(center: CGPoint, sections: Int, radius: CGFloat, separation: CGFloat)
    {
        super.init(frame: CGRect(origin: CGPoint(point: center, offset: -radius/2), size: CGSize(width: radius, height: radius)))
        self.sections = sections
        self.radius = radius
        self.backgroundColor = .clear
        self.isOpaque = false
        self.delta = separation
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect)
    {
        let shapeLayer = CAShapeLayer()
        let colors: [UIColor] = [.electronBlue, .brightYarrow, .chiGong, .exodusFruit, .orangeVille, .draculaOrchid, .prunusAvium, .robinsEggBlue]
        let cntr = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        
        var prevAngle = 3 * CGFloat.pi / 2
        
        for i in 1...sections {
            let sublayer = CAShapeLayer()
            let path = UIBezierPath()
            let startAngle = prevAngle
            var endAngle = prevAngle + (2 * CGFloat.pi / CGFloat(sections))
            let vertex = CGPoint(point: cntr, offsetX: delta * cos((startAngle + endAngle)/2), offsetY: delta * sin((startAngle + endAngle)/2))
            endAngle = endAngle.truncatingRemainder(dividingBy: 2 * CGFloat.pi)
            prevAngle = endAngle
            path.move(to: vertex)
            path.addArc(withCenter: vertex, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: vertex)
            path.close()
            sublayer.path = path.cgPath
            sublayer.fillColor = colors[i % colors.count].cgColor
            sublayer.strokeColor = colors[i % colors.count].darker(factor: 0.5).cgColor
            sublayer.lineWidth = 4.0
            shapeLayer.addSublayer(sublayer)
        }
        
        layer.addSublayer(shapeLayer)
    }
}
