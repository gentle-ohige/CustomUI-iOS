//
//  ProgressBarViewController.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/07.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit
import SnapKit

class ProgressBarViewController: UIViewController {
    
    
    let progressBarView = ProgressBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressBarView)
        progressBarView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(progressBarView.snp.width).multipliedBy(1)
        }
        progressBarView.setProgressLayer(CAGradientLayer.init(start: .topCenter, end: .bottomCenter, colors: [UIColor.orange.cgColor , UIColor.blue.cgColor], type: .axial))
        progressBarView.lineWidth = 20
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        switch progressBarView.progressStatus {
        case .startPosition, .stoped:
            progressBarView.startProgress()
        case .reached:
            progressBarView.resetProgress()
        case .progressing:
            progressBarView.stopProgress()
        default:
            break
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
   
}
