//
//  ViewController.swift
//  AnimationStudy
//
//  Created by 권석기 on 5/6/25.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var showToastButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Toast", for: .normal)
        button.addTarget(self, action: #selector(showToastButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var toastView = ToastView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setLayout()
    }
    
    private func addSubView() {
        view.addSubview(showToastButton)
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            showToastButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showToastButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    @objc func showToastButtonTapped() {
        toastView.showToast(title: "안녕하세요 반갑습니다", superView: view)
    }
}

