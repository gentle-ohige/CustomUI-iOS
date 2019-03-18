//
//  GradientButtonViewController.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/16.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit
import SnapKit

class ButtonSampleViewController: BaseViewController {
    
    private var gradientButton = GradientButton()
    private var shapeButton = ShapeButton()
    private var gradientShapeButton = ShapeGradientButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientButton)
        view.addSubview(shapeButton)
        view.addSubview(gradientShapeButton)
        
        // Gradient Button
        gradientButton.snp.makeConstraints({
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.65)
            $0.height.equalTo(32)
        })
        gradientButton.setTitle("GradeintButton", for: .normal)
        gradientButton.setLayer(view: gradientButton, start: .topCenter, end: .bottomCenter, colors: [UIColor.red.cgColor , UIColor.blue.cgColor], type: .axial)
        
        // Shape Button
        shapeButton.snp.makeConstraints({
            $0.top.equalTo(gradientButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.65)
            $0.height.equalTo(32)
        })
        shapeButton.setTitle("ShapeButton", for: .normal)
        shapeButton.setTitleColor(UIColor.blue, for: .normal)
        
        // Gradient Shape Button
        gradientShapeButton.snp.makeConstraints({
            $0.top.equalTo(shapeButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.65)
            $0.height.equalTo(32)
        })
        gradientShapeButton.setLayer(view: gradientShapeButton, start: .topCenter, end: .bottomCenter, colors: [UIColor.red.cgColor , UIColor.blue.cgColor], type: .axial)
        gradientShapeButton.setTitle("GradientShapeButton", for: .normal)
        gradientShapeButton.setTitleColor(UIColor.orange, for: .normal)
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
