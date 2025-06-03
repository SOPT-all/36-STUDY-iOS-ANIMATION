//
//  selectTitleView.swift
//  week2
//
//  Created by 이상엽 on 5/27/25.
//

import UIKit
import SnapKit

final class SelectTitleView: UIView {
    private let titles: [String]
    private var buttons = [UIButton]()
    private let stackView = UIStackView()
    private let indicatorView = UIView()
    private var indicatorLeading: Constraint?
    private var indicatorWidth: Constraint?
    
    init(titles: [String]) {
        self.titles = titles
        super.init(frame: .zero)
        setupUI()
        selectTab(index: 0, animated: true)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        for (i, title) in titles.enumerated() {
            let btn = UIButton(type: .system)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(tabTapped(_ :)), for: .touchUpInside)
            buttons.append(btn)
            stackView.addArrangedSubview(btn)
        }
        
        indicatorView.backgroundColor = .white
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            indicatorLeading = make.leading.equalToSuperview().constraint
            indicatorWidth = make.width.equalTo(0).constraint
            make.bottom.equalToSuperview()
            make.height.equalTo(3)
        }
    }
    
    @objc private func tabTapped(_ sender: UIButton) {
        selectTab(index: sender.tag, animated: true)
    }
    
    func selectTab(index: Int, animated: Bool) {
        let btn = buttons[index]
        
        guard let titleLabel = btn.titleLabel else { return }
        
        let textWidth = titleLabel.intrinsicContentSize.width
        let leftInset = btn.frame.minX + (btn.bounds.width - textWidth)/2
        
        indicatorLeading?.update(offset: leftInset)
        indicatorWidth?.update(offset: textWidth)
        
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        } else {
            layoutIfNeeded()
        }
    }
}
