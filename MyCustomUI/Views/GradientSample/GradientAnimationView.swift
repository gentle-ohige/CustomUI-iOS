//
//  GradientAnimationView.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/09.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class GradientAnimationView: UIView {


    var glLayer: CAGradientLayer?
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func configureView() {
        glLayer = CAGradientLayer.init(start: .topCenter, end: .bottomCenter, colors: [UIColor.orange.cgColor , UIColor.blue.cgColor], type: .axial)
        glLayer?.frame = self.bounds
        self.layer.addSublayer(glLayer!)
    }
    
    func makeAnimation() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0, 0.4]
        animation.toValue = [0, 0.9]
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        glLayer?.add(animation, forKey: nil)
    }
    
    
}
