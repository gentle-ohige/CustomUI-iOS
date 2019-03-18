//
//  ShapeGradientButton.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/17.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class ShapeGradientButton: ShapeButton, GradientViewWireFrame {
    var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        guard var _ = gradientLayer else {
            return
        }
        gradientLayer?.frame = self.bounds
        gradientLayer?.mask = shapeLayer
    }
}
