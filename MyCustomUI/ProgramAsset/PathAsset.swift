//
//  PathAsset.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/16.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class PathAsset {

    public static func makeSquerePath(shapeLayer: inout CAShapeLayer) -> UIBezierPath{
        let path = UIBezierPath()
        // フレームを短く
        let bounds = shapeLayer.bounds.extendFrame(value: -shapeLayer.lineWidth / 2)
        path.move(to: CGPoint(x: bounds.topRight.x, y: shapeLayer.bounds.origin.y))
        
        path.addLine(to: bounds.bottomRight)
        path.addLine(to: bounds.bottomLeft)
        path.addLine(to: bounds.topLeft)
        path.addLine(to: bounds.topRight)
        
        return path
        
    }


}
