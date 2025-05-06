//
//  ViewController.swift
//  week01
//
//  Created by 쏘 on 5/6/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        
        setUI()
    }
    
    private func setUI() {
        button.setTitle("토스트 굽자 !!!", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(toastButtonTapped), for: .touchUpInside)
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(70)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
        }
    }
    
    @objc func toastButtonTapped() {
        self.view.showToastMessage()
    }
}

#Preview {
    ViewController()
}
