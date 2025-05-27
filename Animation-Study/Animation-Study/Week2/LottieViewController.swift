//
//  LottieViewController.swift
//  Animation-Study
//
//  Created by 안치욱 on 5/26/25.
//

import UIKit
import Lottie
import Then

final class LottieViewController: UIViewController {
    
    private var currentAnimation: LottieAnimationView?
    private let runAnimationView: LottieAnimationView = .init(name: "Running")
    private let totoroAnimationView: LottieAnimationView = .init(name: "Totoro")
    
    private lazy var runAnimationButton = UIButton().then {
        $0.setTitle("Run", for: .normal)
        $0.addTarget(self, action: #selector(runAnimationButtonTap), for: .touchUpInside)
    }
    
    private lazy var totoroAnimationButton = UIButton().then {
        $0.setTitle("Totoro", for: .normal)
        $0.addTarget(self, action: #selector(totoroAnimationButtonTap), for: .touchUpInside)
    }
    
    private lazy var playPauseButton = UIButton().then {
        $0.setTitle("Pause", for: .normal)
        $0.addTarget(self, action: #selector(playPauseButtonTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubviews(
            runAnimationButton,
            totoroAnimationButton,
            playPauseButton
        )
    }
    
    private func setLayout() {
        runAnimationButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        totoroAnimationButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        playPauseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
    }
    
    
    @objc private func runAnimationButtonTap() {
        currentAnimation?.removeFromSuperview()
        currentAnimation = runAnimationView
        
        view.addSubview(runAnimationView)
        runAnimationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        runAnimationView.play()
        runAnimationView.loopMode = .loop
        runAnimationView.animationSpeed = 0.7
        runAnimationView.backgroundBehavior = .pauseAndRestore
    }
    
    @objc private func totoroAnimationButtonTap() {
        currentAnimation?.removeFromSuperview()
        currentAnimation = totoroAnimationView
        
        view.addSubview(totoroAnimationView)
        totoroAnimationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        totoroAnimationView.play()
        totoroAnimationView.loopMode = .loop
        totoroAnimationView.animationSpeed = 0.7
        
    }
    
    @objc private func playPauseButtonTap() {
        //currentAnimation?.pause()
        guard let animView = currentAnimation else { return }
        
        if animView.isAnimationPlaying {
            animView.pause()
            playPauseButton.setTitle("Play", for: .normal)
        } else {
            animView.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
    }
    
}
