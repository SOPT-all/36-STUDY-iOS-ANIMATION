//
//  ViewController.swift
//  SOPT36_ANIMATION
//
//  Created by LEESOOYONG on 5/5/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let button = UIButton()
        button.setTitle("Toast Message", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(showToastMessage), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.width.equalTo(300)
        }
    }
    
    @objc func showToastMessage() {
        self.view.ToastMsg(message: "Toast Message 실습입니다", duration: 5.0)
    }
}
