//
//  ToastMessage.swift
//  SOPT36_ANIMATION
//
//  Created by LEESOOYONG on 5/6/25.
//

import UIKit
import SnapKit

extension UIView {
    func ToastMsg(message: String, duration: Double) {
        
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.text = message
        label.textColor = .white
        label.textAlignment = .center
        label.alpha = 0
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn,animations: {
            label.alpha = 1.0
        }, completion: { _ in
            

            UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
                label.alpha = 0.0
            }, completion: { _ in
                label.removeFromSuperview()
            })
        })
    }
}
