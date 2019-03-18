//
//  RectExtension.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/16.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

extension CGRect {
    
    func extendFrame(value: CGFloat) -> CGRect{
        let r_width = width + (2 * value)
        let r_height = height + (2 * value)
        return CGRect(x: origin.x - value, y: origin.y - value, width: r_width > 0 ? r_width : 0, height: r_height > 0 ? r_height : 0)
    }

    var topLeft:CGPoint {
        get {
            return CGPoint(x: origin.x, y: origin.y)
        }
    }
    var topCenter:CGPoint {
        get {
            return CGPoint(x: origin.x / 2, y: origin.y)
        }
    }
    var topRight:CGPoint {
        get {
            return CGPoint(x: origin.x + width, y: origin.y)
        }
    }
    var centerLeft:CGPoint {
        get {
            return CGPoint(x: origin.x, y: origin.y + (height / 2))
        }
    }
    var center:CGPoint {
        get {
            return CGPoint(x: origin.x + (width / 2), y: origin.y + (height / 2))
        }
    }
    var centerRight:CGPoint {
        get {
            return CGPoint(x: origin.x + width, y: origin.y + (height / 2))
        }
    }
    var bottomLeft:CGPoint {
        get {
            return CGPoint(x: origin.x, y: origin.y + height)
        }
    }
    var bottomCenter:CGPoint {
        get {
            return CGPoint(x: origin.x + (width / 2), y: origin.y + height)
        }
    }
    var bottomRight:CGPoint {
        get {
            return CGPoint(x: origin.x + width, y: origin.y + height)
        }
    }
    
    
}
