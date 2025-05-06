//
//  ToastMessageViewController.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 5/6/25.
//

import UIKit

class ToastMessageViewController: UIViewController {
    
    // MARK: - Property
    private lazy var animebutton = UIButton().then {
        $0.contentVerticalAlignment = .center
        $0.backgroundColor = .brown
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("🍞 굽기", for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(animeButtonTapped), for: .touchUpInside)
    }
    
    private lazy var toastLabel = UILabel().then {
        $0.text = "토스트 메세지"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.alpha = 0
        $0.isHidden = true
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
        view.addSubview(toastLabel)

        animebutton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(52)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        toastLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
    }
    
    // MARK: - Function
    @objc
    private func animeButtonTapped() {
        makeToast()
    }
    
    // completion에는 animations가 끝나고 나서 실행할 내용을 작성
    public func makeToast(){
        self.toastLabel.isHidden = false
        UILabel.animate(withDuration: 0.5) {
            self.toastLabel.isHidden = false
            self.toastLabel.alpha = 0.8
        } completion: { _ in
            UILabel.animate(withDuration: 0.5, delay: 2){
                self.toastLabel.alpha = 0
            } completion: { _ in
                self.toastLabel.isHidden = true
            }
        }
    }
}
