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
    public var colors: [UIColor] = [.electronBlue, .brightYarrow, .chiGong, .exodusFruit, .orangeVille, .draculaOrchid, .prunusAvium, .robinsEggBlue]
    var values: [CGFloat] = []
    public var labels: [String] = []
    public var labelFont: UIFont = UIFont.systemFont(ofSize: 17)
    var totalValue: CGFloat = 0
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public init(center: CGPoint, radius: CGFloat, values: [CGFloat])
    {
        super.init(frame: CGRect(origin: CGPoint(point: center, offset:-radius-10), size: CGSize(width: 2*radius+20, height: 2*radius + CGFloat(values.count) * 20.0 + 15)))
        
        self.sections = values.count
        self.radius = radius
        self.backgroundColor = .clear
        self.isOpaque = false
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
        let cntr = CGPoint(x: frame.size.width/2, y: 10+radius)
        var prevAngle = 3 * CGFloat.pi / 2
        var currentY = 2*radius + 20
        
        for i in 0...sections-1 {
            let sublayer = CAShapeLayer()
            let path = UIBezierPath()
            let startAngle = prevAngle
            var endAngle = startAngle + (2 * CGFloat.pi * values[i] / totalValue)
            endAngle = endAngle.truncatingRemainder(dividingBy: 2 * CGFloat.pi)

            prevAngle = endAngle
            path.move(to: cntr)
            path.addArc(withCenter: cntr, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: cntr)
            path.close()
            sublayer.path = path.cgPath
            sublayer.fillColor = colors[i % colors.count].cgColor
            sublayer.strokeColor = colors[i % colors.count].darker(factor: 0.5).cgColor
            sublayer.lineWidth = 2.0
            
            shapeLayer.addSublayer(sublayer)
            let legendLayer = CAShapeLayer()
            let legendSquare = UIBezierPath(roundedRect: CGRect(x: 20, y: currentY, width: 10, height: 10), cornerRadius: 5)
            legendLayer.path = legendSquare.cgPath
            legendLayer.fillColor = colors[i % colors.count].cgColor
            legendLayer.strokeColor = colors[i % colors.count].darker(factor: 0.5).cgColor
            legendLayer.lineWidth = 2.0
            layer.addSublayer(legendLayer)
            
            let legendLabel = UILabel(frame: CGRect(x: 50, y: currentY, width: frame.size.width-60, height: 12))
            legendLabel.text = labels[i]
            legendLabel.textColor = .black
            legendLabel.font = labelFont
            addSubview(legendLabel)
            currentY += 20
        }
        
        layer.addSublayer(shapeLayer)
    }
}
