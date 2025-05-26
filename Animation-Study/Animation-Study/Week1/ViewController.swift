//
//  ViewController.swift
//  Animation-Study
//
//  Created by 안치욱 on 5/6/25.
//

import UIKit
import SnapKit
import Then
import Toast

class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    private let rotateButton = UIButton()
    
    private let toastButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    @objc private func rotateButtonTapped() {
        
        UIView.animateKeyframes(withDuration: 5, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/5) {
                self.imageView.transform = self.imageView.transform.rotated(by: .pi)
                //self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
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
    
    @objc private func toastButtonTapped(duration: TimeInterval = 2.0) {
        
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "쿵쿵야"
        label.alpha = 0.0
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalTo(35)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            label.alpha = 1.0
        }, completion: { _ in
            
            
            UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
                label.alpha = 0.0
            }, completion: { _ in
                label.removeFromSuperview()
            })
        })
    }
    
    private func setUI() {
        
        view.backgroundColor = .systemGreen
    }
    
    private func setLayout() {
        
        view.addSubviews(
            imageView,
            rotateButton,
            toastButton
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
            $0.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        }
        
        toastButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(100)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(200)
        }
        
        toastButton.do {
            $0.setTitle("Toast 🍞", for: .normal)
            $0.backgroundColor = .brown
            $0.layer.cornerRadius = 8
            $0.addTarget(self, action: #selector(toastButtonTapped), for: .touchUpInside)
        }
    }
}
