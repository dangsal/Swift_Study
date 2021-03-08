//
//  FaceView.swift
//  FaceIt
//
//  Created by 이성호 on 2021/03/08.
//

import UIKit

class FaceView: UIView {


    override func draw(_ rect: CGRect) {
        
        let skullRadius = min(bounds.size.width,bounds.size.height) / 2
        // var skullCenter = convert(center, from: superview)
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY) // midX,Y 는 CGRect 의 직사각형을 걸쳐 중간이 되는 지점
         
        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        skull.lineWidth = 5.0
        UIColor.blue.set()
        skull.stroke()
    }


}
