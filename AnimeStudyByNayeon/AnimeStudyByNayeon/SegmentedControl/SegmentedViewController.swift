//
//  SegmentedViewController.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 5/27/25.
//

import UIKit

import SnapKit
import Then

final class SegmentedViewController: UIViewController {
    
    let segmentedControl = UnderlineSegmentedControl(items: ["One", "Two", "Three"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(segmentedControl)
        segmentedControl.snapshotView(afterScreenUpdates: false)
        
        setLayout()
    }
    
    private func setLayout() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(89)
            $0.height.equalTo(44)
        }
    }
}
