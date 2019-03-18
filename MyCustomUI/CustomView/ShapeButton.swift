//
//  ShapeButton.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/16.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class ShapeButton: UIButton {
 
    var shapeLayer: CAShapeLayer?
    var path: UIBezierPath?
    
    override func layoutSubviews() {
        
        super.layoutSubviews()

        shapeLayer = CAShapeLayer()
        shapeLayer!.frame = self.bounds
        
        setShapeStrock(shapeLayer: &shapeLayer!)
        path = PathAsset.makeSquerePath(shapeLayer: &shapeLayer!)
        shapeLayer!.path = path?.cgPath
        shapeLayer!.strokeStart = 0.0
        shapeLayer!.strokeEnd = 1.0
        self.layer.addSublayer(shapeLayer!)
        startAnimation()
    }
    
    public func startAnimation() {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
        }
        shapeLayer!.add(makeStrockAimation(value: [0.0, 0.0, 1.0], times: [0.0 , 0.5, 1], duration: 2, keyPath: .strokeStart), forKey: "endPointAnimation")
        shapeLayer!.add(makeStrockAimation(value: [0.0, 1.0, 1.0], times: [0.0 , 0.5, 1], duration: 2, keyPath: .strokeEnd), forKey: "startPointAnimation")
        CATransaction.commit()
    }
    
    public func setShapeStrock(shapeLayer: inout CAShapeLayer) {
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.strokeEnd = 0
    }

    public func makeStrockAimation(value: [Any], times: [NSNumber], duration: Double, keyPath: CAKeyframeAnimation.KeyPathDef) -> CAKeyframeAnimation {
        let keyAnimation = CAKeyframeAnimation.init(keyPathDef: keyPath)
        keyAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)]
        keyAnimation.values = value
        keyAnimation.keyTimes = times
        keyAnimation.isRemovedOnCompletion = false
        keyAnimation.fillMode = .forwards
        keyAnimation.repeatCount = .infinity
        keyAnimation.duration = duration
        return keyAnimation
    }
       
}

