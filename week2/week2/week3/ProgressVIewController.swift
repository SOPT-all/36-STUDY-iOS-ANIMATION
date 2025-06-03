//
//  ProgressVIewController.swift
//  week2
//
//  Created by 이상엽 on 6/3/25.
//

import UIKit
import SnapKit

final class ProgressViewController: UIViewController {
    private let circularProgress: CircularProgressView = {
        let view = CircularProgressView()
        view.trackLineWidth = 8
        view.progressLineWidth = 8
        view.trackColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.progressColor = .systemRed
        view.animationDuration = 1.0
        return view
    }()

    private let progressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로그레스 진행하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()

    private var nextProgress: CGFloat = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(circularProgress)
        view.addSubview(progressButton)

        circularProgress.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
            $0.width.height.equalTo(150)
        }

        progressButton.snp.makeConstraints {
            $0.top.equalTo(circularProgress.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }

        progressButton.addTarget(self, action: #selector(didTapProgressButton), for: .touchUpInside)
    }

    @objc private func didTapProgressButton() {
        if nextProgress > 1.0 {
            nextProgress = 0.1
            circularProgress.setProgress(to: 0.0, animated: false)
        }
        circularProgress.setProgress(to: nextProgress, animated: true)
        nextProgress += 0.1
    }
}
