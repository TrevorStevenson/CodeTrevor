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
    var showLegend: Bool = false
    public var callback: (String) -> () = {_ in }
    var dict: [Int:CAShapeLayer] = [:]
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public init(center: CGPoint, radius: CGFloat, values: [CGFloat], showLegend: Bool = false)
    {
        if showLegend {
            super.init(frame: CGRect(origin: CGPoint(point: center, offset:-radius-10), size: CGSize(width: 2*radius+20, height: 2*radius + CGFloat(values.count) * 20.0 + 15)))
        }
        else {
            super.init(frame: CGRect(origin: CGPoint(point: center, offset:-radius-10), size: CGSize(width: 2*radius+20, height: 2*radius + 20)))
        }
        
        self.sections = values.count
        self.radius = radius
        self.backgroundColor = .clear
        self.isOpaque = false
        self.values = values
        for value in values {
            self.totalValue += value
        }
        self.showLegend = showLegend
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
            sublayer.lineWidth = 1.5
                        
            shapeLayer.addSublayer(sublayer)
            dict[i] = sublayer
            
            if showLegend {
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
        }
        
        layer.addSublayer(shapeLayer)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
        guard let sublayers = layer.sublayers as? [CAShapeLayer] else { return }
        guard let subsublayers = sublayers.first?.sublayers as? [CAShapeLayer] else { return }
        
        for shapeLayer in subsublayers {
            if let path = shapeLayer.path, path.contains(touchPoint) {
                shapeLayer.opacity = 0.5
            }
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
        guard let sublayers = layer.sublayers as? [CAShapeLayer] else { return }
        guard let subsublayers = sublayers.first?.sublayers as? [CAShapeLayer] else { return }
        
        for layer in subsublayers {
            if let path = layer.path, path.contains(touchPoint) {
                layer.opacity = 1.0
                for i in 0..<sections {
                    if dict[i] == layer {
                        if labels.count > i {
                            callback(labels[i])
                        }
                    }
                }
            }
        }
        
    }
}
