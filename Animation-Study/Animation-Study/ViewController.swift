//
//  ViewController.swift
//  Animation-Study
//
//  Created by 안치욱 on 5/6/25.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    private let rotateButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    @objc private func rotateImage() {
        
        UIView.animateKeyframes(withDuration: 5, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/5) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/5, relativeDuration: 1/5) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: 50, y: 0)
            }
                    
            UIView.addKeyframe(withRelativeStartTime: 2/5, relativeDuration: 1/5) {
                self.imageView.transform = self.imageView.transform.rotated(by: .pi + 0.1)
            }

            UIView.addKeyframe(withRelativeStartTime: 3/5, relativeDuration: 1/5) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: 50, y: 0)
            }
                    
            UIView.addKeyframe(withRelativeStartTime: 4/5, relativeDuration: 1/5) {
                self.imageView.transform = self.imageView.transform.scaledBy(x: 5, y: 5)
            }
        }
    }
    
    private func setUI() {
        
        view.backgroundColor = .systemGreen
    }
    
    private func setLayout() {
        
        view.addSubviews(
            imageView,
            rotateButton
        )
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.horizontalEdges.equalToSuperview().inset(40)
        }
        
        imageView.do {
            $0.image = .kakaoTalkPhoto20250506160905
        }
        
        rotateButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(100)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(250)
        }
        
        rotateButton.do {
            $0.setTitle("Rotate", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 30)
            $0.backgroundColor = .systemGreen
            $0.layer.cornerRadius = 8
            $0.addTarget(self, action: #selector(rotateImage), for: .touchUpInside)
        }
    }
}
