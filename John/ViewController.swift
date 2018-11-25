//
//  ViewController.swift
//  John
//
//  Created by John on 2018/10/27.
//  Copyright © 2018年 John. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        
        let bu = UIButton.init(type: .custom)
        bu.backgroundColor = .black
        bu.titleLabel?.textColor = .white
        bu.setTitle("弹窗", for: .normal)
        bu.addTarget(self, action: #selector(actionGoNext), for: .touchUpInside)
        self.view.addSubview(bu)
        
        bu.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 100, height: 40))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @objc func actionGoNext() {
        let alert = AlertView.init(frame: .zero)
        alert.show()
    }
    

}

