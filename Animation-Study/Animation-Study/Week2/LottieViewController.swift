//
//  LottieViewController.swift
//  Animation-Study
//
//  Created by 안치욱 on 5/26/25.
//

import UIKit
import Lottie

final class LottieViewController: UIViewController {
    
    let animationView: LottieAnimationView = .init(name: "Running")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(animationView)
        
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        animationView.loopMode = .loop
        
    }
    
}
