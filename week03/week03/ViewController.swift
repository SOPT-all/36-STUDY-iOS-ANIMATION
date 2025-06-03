//
//  ViewController.swift
//  week03
//
//  Created by 쏘 on 6/3/25.
//

import UIKit

import SkeletonView
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let text = UILabel()
    private let image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        skeletonView()
    }
    
    private func setUI() {
        view.isSkeletonable = true
        text.do {
            $0.text = "애니메이션 스따디 🖥️"
            $0.isSkeletonable = true
        }
        
        image.do {
            $0.image = .ganadi
            $0.isSkeletonable = true
        }

    }
    
    private func setLayout() {
        view.addSubview(text)
        view.addSubview(image)
        
        text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(image.snp.top).offset(-5)
            $0.width.equalTo(150)
            $0.height.equalTo(32)
        }
        
        image.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(150)
        }
    }
    
    private func skeletonView() {
        view.showAnimatedSkeleton()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.view.hideSkeleton()
            }
    }
}

