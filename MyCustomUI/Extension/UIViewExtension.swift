//
//  UIViewExtension.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/18.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

extension UIView {
    
    func startSkeltonAnimation(colors: [CGColor]) {
//        let skeltonShapeLayer = CAShapeLayer()
//        skeltonShapeLayer.name = "skeltonShapeLayer"
//        skeltonShapeLayer.frame = self.bounds
//        skeltonShapeLayer.cornerRadius = 10
//        skeltonShapeLayer.strokeEnd = 0
//        skeltonShapeLayer.fillColor = UIColor.clear.cgColor
//        skeltonShapeLayer.strokeColor = UIColor.white.cgColor
//        self.layer.addSublayer(skeltonShapeLayer)
        
        let skeltonLayer = CAGradientLayer.init(start: .centerLeft, end: .centerRight, colors:colors.reversed(), type: .axial)
        skeltonLayer.name = "skeltonLayer"
        skeltonLayer.frame = self.bounds
        skeltonLayer.locations =  [-0.5, 1.5]
        //skeltonLayer.mask = skeltonShapeLayer
        self.layer.addSublayer(skeltonLayer)
        
        skeltonLayer.add(makeGradientAnimation(duration: 3.0, colors: colors), forKey: "skeltonLayerAnimation")

    }
    
    func makeGradientAnimation(duration: Double,colors: [CGColor]) -> CAAnimation{
        var reversedColors = [CGColor]()
        
        for arrayIndex in 0..<colors.count {
            reversedColors.append(colors[(colors.count - 1) - arrayIndex])
        }
        let colorAnimation = CAKeyframeAnimation(keyPath: "colors")
        colorAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                          CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        colorAnimation.values = [colors, reversedColors, colors]
        colorAnimation.keyTimes = [0.0, 0.5, 1.0]
        colorAnimation.duration = duration
        colorAnimation.repeatCount = Float.infinity
       
        return colorAnimation
    }
    
    func makeGradientAnimation(){
        
    }
}
