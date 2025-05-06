//
//  ToastMessage.swift
//  week01
//
//  Created by 쏘 on 5/6/25.
//

import UIKit
import SnapKit

extension UIView {
    func showToastMessage(){
        let label = UILabel()
        
        label.text = "🍞 따끈따끈 🍞"
        label.textAlignment = .center
        label.backgroundColor = .brown
        label.textColor = .white
        label.alpha = 0.6
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        
        self.addSubview(label)
        
        label.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().inset(100)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
        }
        
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseInOut, animations: {
            label.alpha = 0
        }, completion: {(isCompleted) in
            label.removeFromSuperview()
        })
        
    }
}

#Preview{
    ViewController()
}
