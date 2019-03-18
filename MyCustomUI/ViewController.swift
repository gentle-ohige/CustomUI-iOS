//
//  ViewController.swift
//  MyCustomUI
//
//  Created by ShichoChin on 2019/03/07.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct DemoItem {
        let name: String
        let controllerClass: UIViewController.Type
        let controllerIdentifier: String?
        
        init(
            name: String,
            controllerClass: UIViewController.Type,
            controllerIdentifier: String? = nil
            ) {
            self.name = name
            self.controllerClass = controllerClass
            self.controllerIdentifier = controllerIdentifier
        }
    }
    
    let demoList: [DemoItem] =  [
        DemoItem.init(name: "ProgressBar", controllerClass: ProgressBarViewController.self ),
        DemoItem.init(name: "GrdiationView", controllerClass: GradiationViewController.self ),
        DemoItem.init(name: "ButtonSample", controllerClass: ButtonSampleViewController.self ),
        DemoItem.init(name: "SkeltonDesign", controllerClass: SkeltonDesignViewController.self)
    ]

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = demoList[indexPath.row].name
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = demoList[indexPath.row].controllerClass.init()
        vc.title = demoList[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
