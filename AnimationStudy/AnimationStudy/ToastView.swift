//
//  ToastView.swift
//  AnimationStudy
//
//  Created by 권석기 on 5/6/25.
//

import UIKit

final class ToastView: UIView {
    
    private var superView: UIView!
    private var topConstraint: NSLayoutConstraint?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    func setUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        alpha = 1
    }
    
    private func setLayout() {
        superView.addSubview(self)
        addSubview(titleLabel)
        
        topConstraint = topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: -150)
        guard let topConstraint else { return }
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
            heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        superView.layoutIfNeeded()
    }
    
    private func startAnimation() {
        topConstraint?.constant = 20
        superView.layoutIfNeeded()
    }
    
    private func endAnimation(_ _: Bool) {
        UIView.animate(withDuration: 2.0) {
            self.alpha = 0
            self.superView.layoutIfNeeded()
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
    
    private func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    func showToast(title: String, superView: UIView) {
        self.superView = superView
        setTitle(title)
        setUI()
        setLayout()
        UIView.animate(withDuration: 1.0,
                       animations: startAnimation,
                       completion: endAnimation)
    }
}
