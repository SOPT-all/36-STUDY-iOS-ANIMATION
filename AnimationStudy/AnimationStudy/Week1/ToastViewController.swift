//
//  ToastViewController.swift
//  AnimationStudy
//
//  Created by seozero on 5/6/25.
//

import UIKit

import SnapKit
import Then


class ToastViewController: UIViewController {
    
    private let toastButton = UIButton().then {
        $0.setTitle("토스트 메시지를 낉여오너라", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private let toastLabel = UILabel().then {
        $0.text = "안냐세요?"
        $0.textColor = .white
        $0.backgroundColor = .systemGray3
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setAddTarget()
    }

    private func setUI() {
        view.addSubview(toastButton)
        
        toastButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        toastButton.addTarget(self, action: #selector(showToast), for: .touchUpInside)
    }

    @objc
    private func showToast() {
        toastLabel.alpha = 0.0
        view.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        UIView.animate(withDuration: 0.7, animations: {
            self.toastLabel.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 1.5, options: .curveEaseOut, animations: {
                self.toastLabel.alpha = 0.0
            }) { _ in
                self.toastLabel.removeFromSuperview()
            }
        }
    }
}

#Preview {
    ToastViewController()
}
