//
//  ToastView.swift
//  anime_study
//
//  Created by 이상엽 on 5/5/25.
//

import UIKit

final class ToastView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    init(message: String) {
        super.init(frame: .zero)
        setupUI(message: message)
    }
    
    private func setupUI(message: String) {
        self.backgroundColor = UIColor.systemGray.withAlphaComponent(0.7)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.alpha = 0
        self.addSubview(label)
        label.text = message
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    func showToast(message: String, topOffset: CGFloat = 60) {
        let toast = ToastView(message: message)
        view.addSubview(toast)
        
        toast.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toast.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            toast.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toast.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            toast.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40)
        ])
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.beginFromCurrentState],
            animations: {
                toast.alpha = 1
                toast.frame.origin.y += 30
                
            }, completion: { (finished: Bool) -> Void in
                UIView.animate(
                    withDuration: 0.5,
                    delay: 2.0,
                    options: [.curveEaseOut],
                    animations: {
                        toast.alpha = 0
                    }, completion: { finished in
                        toast.removeFromSuperview()
                    })
            }
        )
    }
}
