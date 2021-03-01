//
//  FaceView.swift
//  FaceIt
//
//  Created by 이성호 on 2021/03/01.
//

import UIKit

class FaceView: UIView {


    override func draw(_ rect: CGRect) {
        

        let skullRadius = min(bounds.size.width, bounds.size.height) / 2
        let skullCenter = CGPoint(x:bounds.midX, bounds.minY)
        
        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        
    }


}
