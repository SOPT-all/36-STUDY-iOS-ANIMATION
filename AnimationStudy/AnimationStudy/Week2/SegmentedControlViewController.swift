//
//  SegmentedControlViewController.swift
//  AnimationStudy
//
//  Created by seozero on 5/7/25.
//

import UIKit

import SnapKit
import Then

class SegmentedControlViewController: UIViewController {
    
    private let segmentedControl = UISegmentedControl().then {
        $0.insertSegment(withTitle: "First", at: 0, animated: true)
        $0.insertSegment(withTitle: "Second", at: 1, animated: true)
    }
    
    private let firstView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let secondView = UIView().then {
        $0.backgroundColor = .orange
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUI()
    }
    
    private func setUI() {
        view.addSubview(segmentedControl)
        view.addSubview(firstView)
        view.addSubview(secondView)
        
        setConstraints()
        setSegmentedControl()
    }
    
    private func setConstraints() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(44)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    private func setSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }
    
    var shouldHideFirstView: Bool? {
        didSet {
          guard let shouldHideFirstView = self.shouldHideFirstView else { return }
          self.firstView.isHidden = shouldHideFirstView
          self.secondView.isHidden = !self.firstView.isHidden
        }
      }
      
    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        self.shouldHideFirstView = segment.selectedSegmentIndex != 0
    }
}

#Preview {
    SegmentedControlViewController()
}
