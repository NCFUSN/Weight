//
//  FSLoadingCircle.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation
import UIKit

class LoadingCircle: UIView {
    
    
    fileprivate var progressCircle:CAShapeLayer!
    fileprivate var theView: UIView!
    fileprivate var circleWidth: CGFloat!
    fileprivate var circleProgressColor: UIColor!
    fileprivate var circleTrailingColor: UIColor!
    fileprivate var circle: UIView!
    fileprivate var imageView: UIImageView!
    var butt: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    init(view: UIView, circleWidth: CGFloat, circleProgressColor: UIColor, circleTrailingColor: UIColor) {
        
        self.theView = view
        self.circleWidth = circleWidth
        self.circleProgressColor = circleProgressColor
        self.circleTrailingColor = circleTrailingColor
        super.init(frame: CGRect(x: 0, y: 0, width: theView.bounds.size.width, height: theView.bounds.size.height))
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: theView.bounds.size.width, height: theView.bounds.size.height))
        draw(CGRect(x: 0, y: 0, width: theView.bounds.size.width, height: theView.bounds.size.height))
        theView.addSubview(imageView)
    }
    
    override func draw(_ rect: CGRect) {
        
        circle = UIView(frame: rect)
        circle.layoutIfNeeded()
        let centerPoint = CGPoint (x: circle.bounds.width / 2, y: circle.bounds.width / 2)
        let circleRadius : CGFloat = circle.bounds.width / 2 * 0.95
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true    )
        let trailingCircle = CAShapeLayer()
        trailingCircle.path = circlePath.cgPath
        trailingCircle.strokeColor = circleTrailingColor.cgColor
        trailingCircle.fillColor = UIColor.clear.cgColor
        trailingCircle.lineWidth = circleWidth
        trailingCircle.strokeStart = 0
        trailingCircle.strokeEnd = 1
        
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = circleProgressColor.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = circleWidth
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = 0
        
        //TODO: Animate circle. make it progress smooth
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.repeatCount = 0
        pathAnimation.autoreverses = false
        progressCircle.add(pathAnimation, forKey: "strokeEnd")
        
        circle.layer.addSublayer(trailingCircle)
        circle.layer.addSublayer(progressCircle)
        imageView.addSubview(circle)
}

// We don't need to update progress this time.
//    func update(progress: CGFloat) {
//
//        progressCircle.strokeEnd = progress
//    }
}
