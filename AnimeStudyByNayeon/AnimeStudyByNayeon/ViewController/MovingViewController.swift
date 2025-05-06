//
//  MovingViewController.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 5/6/25.
//

import UIKit
import SnapKit
import Then

class MovingViewController: UIViewController {
    
    // MARK: - Property
    private lazy var movingImageView = UIImageView().then {
        $0.image = .enderMan
        $0.contentMode = .scaleAspectFit
    }
    private lazy var animeButton = UIButton().then {
        $0.contentVerticalAlignment = .center
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("엔더맨 움직이기", for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(animeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Layout
    private func setLayout() {
        [movingImageView, animeButton].forEach {
            self.view.addSubview($0)
        }
        
        movingImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(300)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
        }
        
        animeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
    }
    
    // MARK: - Function
    @objc
    private func animeButtonTapped() {
        let originalTransform = movingImageView.transform
        
        UIView.animate(withDuration: 0.25, animations: {
            /// 왼쪽 100 이동
            self.movingImageView.transform = originalTransform.translatedBy(x: -100, y: 0)
        }) { _ in
            UIView.animate(withDuration: 0.25, animations: {
                /// 원위치 이동
                self.movingImageView.transform = originalTransform
            }) { _ in
                UIView.animate(withDuration: 0.25, animations: {
                    /// 회전
                    self.movingImageView.transform = originalTransform.rotated(by: .pi)
                }) { _ in
                    UIView.animate(withDuration: 0.25, animations: {
                        /// 확대
                        self.movingImageView.transform = originalTransform.scaledBy(x: 2.0, y: 2.0)
                    }) { _ in
                        UIView.animate(withDuration: 0.25, animations: {
                            /// 원래 크기
                            self.movingImageView.transform = originalTransform
                        })
                    }
                }
            }
        }
    }
}
