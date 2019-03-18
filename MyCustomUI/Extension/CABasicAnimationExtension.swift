//
//  CABasicAnimationExtension.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/16.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

extension CAKeyframeAnimation {
    public enum KeyPathDef: String {
        case cornerRadius
        case strokeEnd
        case strokeStart
    }

    public convenience init(keyPathDef: KeyPathDef)  {
        self.init(keyPath: keyPathDef.rawValue)
        
    }
}
