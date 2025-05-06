//
//  ButtonViewController.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 5/6/25.
//

import UIKit
import SnapKit
import Then

class ButtonViewController: UIViewController {

    // MARK: - Property
    private lazy var animebutton = UIButton().then {
        $0.contentVerticalAlignment = .center
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("아야야", for: .normal)
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
        view.addSubview(animebutton)
        
        animebutton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(52)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Function
    @objc
    private func animeButtonTapped() {
        shake()
    }
    
    public func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        animebutton.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut,
                       animations: {
            self.animebutton.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
