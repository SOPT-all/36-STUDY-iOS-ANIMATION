//
//  ViewController.swift
//  anime_study
//
//  Created by 이상엽 on 5/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var componentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("토스트 버튼 컴포넌트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showToastMessage), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(componentButton)
        
        componentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([componentButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
                                     componentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     componentButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     componentButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     componentButton.heightAnchor.constraint(equalToConstant: 52)])
    }
    
    
    @objc func showToastMessage() {
        showToast(message: "토스트 메시지를 컴포넌트로 만들었어요!")
    }
    
}

