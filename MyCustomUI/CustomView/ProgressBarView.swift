//
//  ProgressBarView.swift
//  ReduxStopWatch
//
//  Created by ShichoChin on 2019/03/06.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

protocol  ProgressbarDelegate {
    func progressing( progress: Int )
}


class ProgressBarView: UIView {

    enum ProgressStatus {
        case startPosition
        case progressing
        case stoped
        case reached
    }

    public var progressStatus: ProgressStatus = .startPosition
    private var bgPath: UIBezierPath = UIBezierPath()
    private var shapeLayer: CAShapeLayer!
    private var progressMaskLayer: CAShapeLayer!
    private var progressLayer: CALayer!

    private var lineDashPattern: [NSNumber] = [1, 0] {
        didSet {
            shapeLayer.lineDashPattern = lineDashPattern
            progressMaskLayer.lineDashPattern = lineDashPattern
        }
    }
    
    
    private var timer: Timer?
    private var timerInterval: Double = 0.05
    private var progressPerInterval: Double = 0.05
    private var progressPatternCount: Int = 60
    private var progress: Double = 0 {
        willSet(newValue){
            progressMaskLayer.strokeEnd = CGFloat(newValue)
        }
    }

    public var delegate: ProgressStatus?
    public var lineWidth:CGFloat = 20 {
        didSet {
            shapeLayer.lineWidth = lineWidth
            progressMaskLayer.lineWidth = lineWidth
        }
    }
    

    convenience init() {
        self.init(frame: CGRect.zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit () {
        shapeLayer = makeShapeLayer(strokeColor:  UIColor(white: 0.8, alpha: 0.5), fillColor: .clear)
        shapeLayer.strokeEnd = 1
        self.layer.addSublayer(shapeLayer)
        
        progressMaskLayer = makeShapeLayer(strokeColor: UIColor(white: 0.8, alpha: 1.0), fillColor: .clear)
        progressMaskLayer.strokeEnd = 0.0
        self.layer.addSublayer(progressMaskLayer)
        
        progressLayer = CALayer()
        progressLayer.backgroundColor = UIColor.red.cgColor
        progressLayer.mask = progressMaskLayer
        self.layer.addSublayer(progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = self.frame.width / 2
        let y = self.frame.height / 2
        let radius = min(x, y) - lineWidth * 2
        let center = CGPoint(x: x, y: y)
    
        // パターンを計算
        let miniti_lenght: CGFloat = radius * CGFloat.pi / CGFloat(progressPatternCount * 2)
        lineDashPattern = [NSNumber(value: Float(miniti_lenght)), NSNumber(value: Float(miniti_lenght))]
        
        bgPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        shapeLayer.position = center
        shapeLayer.path = bgPath.cgPath
        shapeLayer.transform = CATransform3DMakeRotation(-.pi/2, 0, 0, 1)
        
        progressMaskLayer.position = center
        progressMaskLayer.path = bgPath.cgPath
        progressMaskLayer.transform = CATransform3DMakeRotation(-.pi/2, 0, 0, 1)
        progressLayer.frame = self.bounds
    }

    //MARK: Public
    public func setProgressLayer(_ layer: CALayer){
        if var _ = progressLayer {
            progressLayer.removeFromSuperlayer()
            progressLayer = nil
        }
        
        progressLayer = layer
        progressLayer.frame = self.bounds
        progressLayer.mask = progressMaskLayer
        self.layer.addSublayer(progressLayer)
    }
    
    
    private func makeShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineDashPattern = lineDashPattern
        return shapeLayer
    }
}

//MARK: ProgressTimer
extension ProgressBarView {
    func configProgressTimer(timerInterval: Double, progressPerInterval: Double){
        self.timerInterval = timerInterval
        self.progressPerInterval = progressPerInterval
    }
    
    func startProgress() {
        startTimer()
    }
    
    func stopProgress() {
        stopTimer()
    }
    
    func resetProgress() {
        stopTimer()
        // animtaionが入るので禁止
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        progress = 0
        progressStatus = .startPosition
        CATransaction.commit()
    }
    
    private func startTimer() {
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: progressPerInterval, target: self, selector: #selector(ticker), userInfo: nil, repeats: true)
        progressStatus = .progressing
    }
    
    private func stopTimer() {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
        progressStatus = .stoped
    }
    
    @objc func ticker() {
        
        if progress >= 1 {
            timer?.invalidate()
            progressStatus = .reached
            return
        }
    
        progress += 0.05
        progressStatus = .progressing
        // gradientColor
    }
    
}
