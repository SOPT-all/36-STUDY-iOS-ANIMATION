//
//  SegmentViewController.swift
//  week02
//
//  Created by 쏘 on 5/27/25.
//

import UIKit

import SnapKit
import Then

class SegmentViewController: UIViewController {
    
    let segmentControl = UISegmentedControl(items: ["쇽", "샥"])
    let firstView = UIView()
    let secondView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setConstraints()
        setAction()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        [segmentControl, firstView, secondView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        segmentControl.do {
            $0.selectedSegmentIndex = 0
        }
        
        firstView.do {
            $0.backgroundColor = .blue
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        secondView.do {
            $0.backgroundColor = .yellow
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    private func setConstraints() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func setAction() {
        self.segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        self.segmentControl.selectedSegmentIndex = 0
            self.didChangeValue(segment: self.segmentControl)
    }
    
    var shouldHideFirstView: Bool? {
        didSet {
          guard let shouldHideFirstView = self.shouldHideFirstView else { return }
          self.firstView.isHidden = shouldHideFirstView
          self.secondView.isHidden = !self.firstView.isHidden
        }
      }
      
      @objc private func didChangeValue(segment: UISegmentedControl) {
        self.shouldHideFirstView = segment.selectedSegmentIndex != 0
      }
    
    
}
