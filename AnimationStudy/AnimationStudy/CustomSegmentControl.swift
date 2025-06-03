////
////  CustomSegmentControl.swift
////  AnimationStudy
////
////  Created by 권석기 on 5/27/25.
////
//
//import UIKit
//import Then
//import SnapKit
//
//final class CustomSegmentControl: UISegmentedControl {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    override init(items: [Any]?) {
//        super.init(items: items)
//        setSegmentStyle()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let  itemSize = (self.bounds.size.width / CGFloat(self.numberOfSegments))
//        UIView.animate(withDuration: 0.2) {
//            self.underLineView.frame.origin.x = itemSize * CGFloat(self.selectedSegmentIndex)
//        }
//    }
//    
//    private lazy var underLineView = UIView().then {
//        $0.backgroundColor = .white
//        let itemSize = self.bounds.size.width / CGFloat(self.numberOfSegments)
//        let offsetX = CGFloat(CGFloat(self.selectedSegmentIndex) * itemSize)
//        $0.frame = CGRect(x: offsetX, y: self.bounds.size.height - 2.0, width: itemSize, height: 2.0)
//        addSubview($0)
//    }
//    
//    private func setSegmentStyle() {
//        selectedSegmentIndex = 0
//        
//        // 기본스타일을 빈 이미지로 대체
//        let image = UIImage()
//        setBackgroundImage(image, for: .normal, barMetrics: .default)
//        setBackgroundImage(image, for: .selected, barMetrics: .default)
//        setBackgroundImage(image, for: .highlighted, barMetrics: .default)
//        setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
//        
//        // 활성화/비활성화 Font 설정
//        setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: UIColor.gray,
//            .font: UIFont.font(.pretendardRegular, ofSize: 17)
//        ], for: .normal)
//        setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: UIColor.white,
//            .font: UIFont.font(.pretendardRegular, ofSize: 17)
//        ], for: .selected)
//    }
//}
