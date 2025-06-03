//
//  CircularProgressView.swift
//  week2
//
//  Created by 이상엽 on 6/3/25.
//

import UIKit

final class CircularProgressView: UIView {
    var progressLineWidth: CGFloat = 5 {
        didSet {
            progressLayer.lineWidth = progressLineWidth
            setNeedsLayout()
        }
    }

    var trackLineWidth: CGFloat = 5 {
        didSet {
            trackLayer.lineWidth = trackLineWidth
            setNeedsLayout()
        }
    }

    var progressColor: UIColor = .red {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }

    var trackColor: UIColor = .lightGray {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    var animationDuration: CFTimeInterval = 1.0
    private(set) var currentProgress: CGFloat = 0

    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()

    private var circlePath: UIBezierPath {
        let lineWidth = max(trackLineWidth, progressLineWidth)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        return UIBezierPath(
            arcCenter: centerPoint,
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: 3 * .pi / 2,
            clockwise: true
        )
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        trackLayer.frame = bounds
        progressLayer.frame = bounds
        let path = circlePath
        trackLayer.path = path.cgPath
        progressLayer.path = path.cgPath
    }

    private func setupLayers() {
        [trackLayer, progressLayer].forEach {
            $0.fillColor = UIColor.clear.cgColor
            $0.lineCap = .round
        }
        trackLayer.lineWidth = trackLineWidth
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)

        progressLayer.lineWidth = progressLineWidth
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }

    func setProgress(to newProgress: CGFloat, animated: Bool) {
        let clamped = max(0, min(newProgress, 1))
        currentProgress = clamped

        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = progressLayer.presentation()?.strokeEnd ?? progressLayer.strokeEnd
            animation.toValue = clamped
            animation.duration = animationDuration
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            progressLayer.strokeEnd = clamped
            progressLayer.add(animation, forKey: "progressAnim")
        } else {
            progressLayer.strokeEnd = clamped
        }
    }
}
