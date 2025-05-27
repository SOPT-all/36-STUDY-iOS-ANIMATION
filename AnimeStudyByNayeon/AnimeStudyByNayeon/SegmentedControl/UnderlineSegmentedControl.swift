//
//  UnderlineSegmentedControl.swift
//  AnimeStudyByNayeon
//
//  Created by 김나연 on 5/27/25.
//

import UIKit

import SnapKit
import Then

final class UnderlineSegmentedControl: UISegmentedControl {
    
    // MARK: - Property
    private let underlineView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    private var underlineLeadingConstraint: Constraint?
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.removeBackgroundAndDivider()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        self.removeBackgroundAndDivider()
        setLayout()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(underlineView)
        layoutIfNeeded()
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        underlineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
            $0.width.equalTo(segmentWidth)
            underlineLeadingConstraint = $0.leading.equalTo(segmentWidth * CGFloat(selectedSegmentIndex)).constraint
        }
    }
    
    private func addTarget() {
        addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    @objc private func segmentChanged() {
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        underlineLeadingConstraint?.update(inset: segmentWidth * CGFloat(selectedSegmentIndex))
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}
