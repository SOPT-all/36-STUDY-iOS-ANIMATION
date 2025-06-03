//
//  ToastViewController.swift
//  Animation_1
//
//  Created by hyunwoo on 5/6/25.
//

import UIKit
import SnapKit

class ToastViewController: UIViewController {
    
    private let LoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor(named: "red")
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    func ToastLabel(message: String){
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.text = message
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        self.view.addSubview(label)
        
        label.snp.makeConstraints{
            $0.width.equalTo(200)
            $0.height.equalTo(60)
            $0.centerX.equalTo(self.view)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(100)
        }
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            label.alpha = 0.0
        }, completion: {(isCompleted) in
            label.removeFromSuperview()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetLayout()
    }
    
    private func SetLayout() {
        [LoginButton].forEach {
            view.addSubview($0)
        }
        LoginButton.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func loginButtonTapped() {
        ToastLabel(message: "로그인 성공")
    }
}
