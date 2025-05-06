//
//  AnimationButton.swift
//  AnimationStudy
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

final class AnimationButton: UIButton {
    
    // MARK: - Properties
    
    override var isHighlighted: Bool {
        didSet {
            animateButtonColor()
        }
    }

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setButton() {
        setTitle("눌러라", for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    private func animateButtonColor() {

        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut) { [weak self] in
            guard let self else { return }
            backgroundColor = self.isHighlighted ? .systemGray4 : .systemGray6
        }
    }
}
