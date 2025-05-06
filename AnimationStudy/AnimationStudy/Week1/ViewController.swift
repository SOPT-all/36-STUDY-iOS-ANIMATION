//
//  ViewController.swift
//  AnimationStudy
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class ViewController: UIViewController {
    
    private let animationButton = AnimationButton()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        view.do {
            $0.backgroundColor = .white
        }
    }
    
    private func setUI() {
        view.addSubview(animationButton)
    }
    
    private func setLayout() {
        animationButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAction() {
        animationButton.addTarget(self, action: #selector(animationButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func animationButtonDidTap() {
        ToastView().show(message: "짜잔 ㅋㅋㅋ", inset: 20, view: view)
    }
}

