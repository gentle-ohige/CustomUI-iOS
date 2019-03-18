//
//  GradiationView.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/09.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class GradiationView: UIView {
    
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
        glLayer = CAGradientLayer.init(start: .topCenter, end: .bottomCenter, colors: [UIColor.red.cgColor , UIColor.blue.cgColor], type: .axial)
        glLayer?.frame = self.bounds
        print(glLayer?.frame)
        self.layer.addSublayer(glLayer!)
    }
    

}
