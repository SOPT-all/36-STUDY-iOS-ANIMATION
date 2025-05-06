//
//  ToastVIew.swift
//  AnimationStudy
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class ToastView: UIView {
    func show(message: String, inset: CGFloat, view: UIView) {
        let toastLabel = UILabel().then {
            $0.text = message
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.textAlignment = .center
            $0.clipsToBounds = true
            $0.sizeToFit()
        }
        
        layer.cornerRadius = 8
        backgroundColor = .systemGray6
        isUserInteractionEnabled = false
        
        view.addSubview(self)
        addSubview(toastLabel)
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(50)
        }
        
        toastLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        animateToastView()
    }
}

private extension ToastView {
    func animateToastView() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn) {
            self.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0.6, options: .curveEaseOut) {
                self.alpha = 0.0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
}
