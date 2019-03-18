//
//  GradientButton.swift
//  MyCustomUI
//∞
//  Created by ShichoChin on 2019/03/15.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

protocol GradientViewWireFrame {
    var gradientLayer: CAGradientLayer? {get set}
    mutating func setLayer(view: UIView, start: CAGradientLayer.Point, end: CAGradientLayer.Point, colors: [CGColor], type: CAGradientLayerType)
}

extension GradientViewWireFrame {
    mutating func setLayer(view: UIView, start: CAGradientLayer.Point, end: CAGradientLayer.Point, colors: [CGColor], type: CAGradientLayerType){
        if let _ = gradientLayer {
            gradientLayer?.removeFromSuperlayer()
            gradientLayer = nil
        }
        gradientLayer = CAGradientLayer.init(start: start, end: end, colors: colors, type: type)
        gradientLayer?.frame = view.bounds
        view.layer.addSublayer(gradientLayer!)
    }
}

class GradientButton: UIButton, GradientViewWireFrame {
    var gradientLayer: CAGradientLayer?
    override func layoutSubviews() {
        super.layoutSubviews()
        guard var _ = gradientLayer else {
            return
        }
        gradientLayer?.frame = self.bounds
    }
}
