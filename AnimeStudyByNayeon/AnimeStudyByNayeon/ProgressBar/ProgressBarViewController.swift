//
//  ProgressBarViewController.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 6/3/25.
//

import UIKit

import SnapKit
import SkeletonView
import Then

class ProgressBarViewController: UIViewController {
    
    var time: Float = 0.0
    var timer: Timer?
    
    private lazy var progressButton = UIButton().then {
        $0.setTitle("진행 시작", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.addTarget(self, action: #selector(didTapDownloadButton), for: .touchUpInside)
        $0.isSkeletonable = true
    }
    
    private lazy var progressView = UIProgressView().then {
        /// progress 배경 색상
        $0.trackTintColor = .lightGray
        /// progress 진행 색상
        $0.progressTintColor = .systemBlue
        $0.progress = 0.1
        $0.isSkeletonable = true
    }
    
    private lazy var gradient = SkeletonGradient(baseColor: .clouds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.isSkeletonable = true
        
        view.addSubview(progressButton)
        view.addSubview(progressView)
        
        setLayout()
        showSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.hideSkeleton()
        }
    }
    
    private func setLayout() {
        progressButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints {
            $0.top.equalTo(progressButton.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func showSkeleton() {
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
        view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
    }

    private func hideSkeleton() {
        view.hideSkeleton(reloadDataAfter: false, transition: .crossDissolve(0.25))
    }
    
    @objc
    private func didTapDownloadButton() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }

    @objc
    private func setProgress() {
        time += 0.05
        progressView.setProgress(time, animated: true)
        if time >= 1.0 { timer?.invalidate() }
    }
}
