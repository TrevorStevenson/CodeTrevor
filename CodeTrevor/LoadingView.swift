//
//  LoadingView.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/2/18.
//  Copyright © 2018 Triple Torus Software. All rights reserved.
//

import UIKit

class LoadingView: UIView
{
    public enum LoadingType
    {
        case box
    }
    
    var viewType: LoadingType = .box
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(center: CGPoint, width: CGFloat, type: LoadingType)
    {
        super.init(frame: CGRect(center: center, width: width, height: width))
        self.viewType = type
    }
    
    override func draw(_ rect: CGRect)
    {
        
    }
}
