//
//  SkeltonDesignVIewController.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/18.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit
import SnapKit

class SkeltonDesignViewController: BaseViewController {
    
    let userIcon: UIImageView = UIImageView()
    let userLabel: UILabel = UILabel()
    let userID: UILabel = UILabel()
    let userComment: UILabel = UILabel()
    let userImage: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(userIcon)
        view.addSubview(userLabel)
        view.addSubview(userID)
        view.addSubview(userComment)
        view.addSubview(userImage)
        
        userIcon.snp.makeConstraints({
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(48)
            $0.height.equalTo(49)
        })

        
        userLabel.snp.makeConstraints({
            $0.top.equalTo(userIcon.snp.top)
            $0.left.equalTo(userIcon.snp.right).offset(8)
            $0.width.equalTo(100)
            $0.height.equalTo(24)
        })
        
        userID.snp.makeConstraints({
            $0.centerY.equalTo(userLabel)
            $0.left.equalTo(userLabel.snp.right).offset(8)
            $0.width.equalTo(36)
            $0.height.equalTo(18)
        })
        
        userComment.snp.makeConstraints({
            $0.top.equalTo(userLabel.snp.bottom).offset(8)
            $0.left.equalTo(userLabel.snp.left)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(72)
        })
    
        
        userImage.snp.makeConstraints({
            $0.top.equalTo(userComment.snp.bottom).offset(8)
            $0.left.equalTo(userLabel.snp.left)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(userImage.snp.width).multipliedBy(0.68)
        })

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        userIcon.startSkeltonAnimation(colors: [UIColor.orange.cgColor, UIColor.blue.cgColor])
        userLabel.startSkeltonAnimation(colors: [UIColor.purple.cgColor, UIColor.red.cgColor])
        userID.startSkeltonAnimation(colors: [UIColor.purple.cgColor, UIColor.red.cgColor])
        userComment.startSkeltonAnimation(colors: [UIColor.purple.cgColor, UIColor.red.cgColor])
        userImage.startSkeltonAnimation(colors: [UIColor.orange.cgColor, UIColor.blue.cgColor])
    }
}
