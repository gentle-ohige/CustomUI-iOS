//
//  GradiationViewController.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/09.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit
import SnapKit

class GradiationViewController: UIViewController {

    lazy var gradienView: GradiationView = GradiationView.init()
    lazy var animeGradienView: GradientAnimationView = GradientAnimationView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(gradienView)
        gradienView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview().offset(50)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(gradienView.snp.width).multipliedBy(1)
        })
        
        view.addSubview(animeGradienView)
        animeGradienView.snp.makeConstraints({
            $0.top.equalTo(gradienView.snp.bottom).offset(20)
            $0.left.equalTo(gradienView)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(animeGradienView.snp.width).multipliedBy(1)
        })
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gradienView.configureView()
        animeGradienView.configureView()
        animeGradienView.makeAnimation()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
