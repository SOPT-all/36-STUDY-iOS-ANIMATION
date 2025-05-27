//
//  ViewController.swift
//  week2
//
//  Created by 이상엽 on 5/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let customTabBar = SelectTitleView (
            titles: ["홈", "드라마", "무구정광대다라니경"]
        )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(customTabBar)
        customTabBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }


}

