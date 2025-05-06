//
//  UIView+.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 4/22/25
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
