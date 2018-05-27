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
    var colors: [UIColor] = []
    var values: [CGFloat] = []
    var totalValue: CGFloat = 0
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public init(center: CGPoint, radius: CGFloat, separation: CGFloat = 5, values: [CGFloat],
                colors: [UIColor] = [.electronBlue, .brightYarrow, .chiGong, .exodusFruit, .orangeVille, .draculaOrchid, .prunusAvium, .robinsEggBlue])
    {
        super.init(frame: CGRect(origin: CGPoint(point: center, offset: -radius/2), size: CGSize(width: radius, height: radius)))
        self.sections = values.count
        self.radius = radius
        self.backgroundColor = .clear
        self.isOpaque = false
        self.delta = separation
        self.colors = colors
        self.values = values
        for value in values {
            self.totalValue += value
        }
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect)
    {
        let shapeLayer = CAShapeLayer()
        let cntr = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        var prevAngle = 3 * CGFloat.pi / 2
        
        for i in 0...sections-1 {
            let sublayer = CAShapeLayer()
            let path = UIBezierPath()
            let startAngle = prevAngle
            var endAngle = startAngle + (2 * CGFloat.pi * values[i] / totalValue)
            let vertex = CGPoint(point: cntr, offsetX: delta * cos((startAngle + endAngle)/2), offsetY: delta * sin((startAngle + endAngle)/2))
            
            endAngle = endAngle.truncatingRemainder(dividingBy: 2 * CGFloat.pi)
            let deltaAngle = (startAngle + endAngle) / 500

            prevAngle = endAngle
            path.move(to: vertex)
            path.addArc(withCenter: vertex, radius: radius, startAngle: startAngle+deltaAngle, endAngle: endAngle-deltaAngle, clockwise: true)
            path.addLine(to: vertex)
            path.close()
            sublayer.path = path.cgPath
            sublayer.fillColor = colors[i % colors.count].cgColor
            sublayer.strokeColor = colors[i % colors.count].darker(factor: 0.5).cgColor
            sublayer.lineWidth = 4.0
            shapeLayer.addSublayer(sublayer)
            print(vertex)
        }
        
        
        
        layer.addSublayer(shapeLayer)
    }
}
