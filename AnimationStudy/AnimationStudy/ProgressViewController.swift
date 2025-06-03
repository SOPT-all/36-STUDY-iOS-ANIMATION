//
//  ProgressViewController.swift
//  AnimationStudy
//
//  Created by 권석기 on 6/3/25.
//

import UIKit
import SnapKit
import Then
import SkeletonView

class ProgressViewController: UIViewController {
    private lazy var progressBarView = UIProgressView().then {
        $0.progress = progress
        $0.progressViewStyle = .bar
    }
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(resource: .karina)
        $0.isSkeletonable = true
        $0.showAnimatedSkeleton(usingColor: .lightGray)
        $0.contentMode = .scaleAspectFill
    }
    
    var progress: Float = 0.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        startProgress()
    }
    
    func addSubviews() {
        view.addSubview(progressBarView)
        view.addSubview(imageView)
    }
    
    func setConstraints() {
        progressBarView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(300)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func startProgress() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc func setProgress() {
        progress += 0.01
        progressBarView.setProgress(progress, animated: true)
        if progress >= 1.0 {
            timer?.invalidate()
            imageView.hideSkeleton()
        }
    }
}
