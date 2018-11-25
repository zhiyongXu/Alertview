//
//  AlertView.swift
//  John
//
//  Created by John on 2018/11/25.
//  Copyright © 2018年 John. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    var blurView: UIView?
    var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bv = UIView.init()
        bv.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        self.addSubview(bv)
        self.blurView = bv
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hide))
        bv.addGestureRecognizer(tap)
        
        bv.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        let cv = UIView.init()
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 10
        self.addSubview(cv);
        self.contentView = cv
        
        cv.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(290)
            make.height.equalTo(100)
        }
    }
    
    func show() {
        let window = UIApplication.shared.keyWindow!
        window.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.edges.equalTo(window)
        }
        
        self.contentView?.alpha = 0.6
        UIView.animate(withDuration: 0.3) {
            self.contentView?.alpha = 1;
        }
        self.contentView?.transform = .init(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.contentView?.transform = .init(scaleX: 1, y: 1)
        }) { (completion) in
            
        }
    }
    
    @objc func hide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blurView?.alpha = 0
            self.contentView?.alpha = 0
            self.contentView?.transform = .init(scaleX: 0.5, y: 0.5)
        }) { (completion) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
}
