//
//  SegmentViewController.swift
//  Animation_1
//
//  Created by hyunwoo on 5/26/25.
//

import UIKit

import SnapKit
import Then

class SegmentViewController: UIViewController {

    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["firstView", "secondView"])
        return control
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var shouldHideFirstView: Bool? {
        didSet {
            guard let shouldHideFirstView = self.shouldHideFirstView else { return }
            self.firstView.isHidden = shouldHideFirstView
            self.secondView.isHidden = !self.firstView.isHidden
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        setLayout()
        setupSegmentedControl()
    }
    
    private func setLayout() {
        [segmentedControl, firstView, secondView].forEach {
            view.addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(80)
            $0.height.equalTo(70)
        }
        
        firstView.snp.makeConstraints {
            $0.leading.equalTo(segmentedControl)
            $0.trailing.equalTo(segmentedControl)
            $0.bottom.equalTo(view).offset(-80)
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
        }
        
        secondView.snp.makeConstraints {
            $0.leading.equalTo(firstView)
            $0.trailing.equalTo(firstView)
            $0.bottom.equalTo(firstView)
            $0.top.equalTo(firstView)
        }
    }
    
    @objc private func didChangeValue(segment: UISegmentedControl) {
        self.shouldHideFirstView = segment.selectedSegmentIndex != 0
    }
    
    private func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        didChangeValue(segment: segmentedControl)
    }
}
