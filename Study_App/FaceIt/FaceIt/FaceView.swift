//
//  FaceView.swift
//  FaceIt
//
//  Created by 이성호 on 2021/03/08.
//

import UIKit

class FaceView: UIView {

    
    var scale: CGFloat = 0.90
    private var skullRadius: CGFloat {
      return min(bounds.size.width,bounds.size.height) / 2 * scale
    }
    private var skullCenter: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private struct Ratios {
        static let SkullRadiusToEyeOffset: CGFloat = 3
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouthWidth: CGFloat = 1
        static let SkullRadiusToMouthHeight: CGFloat = 3
        static let SkullRadiusToMouthOffset: CGFloat = 3
    }
    
    private enum Eye {
        case Left
        case Right
    }
    
    func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius: CGFloat) -> UIBezierPath{
        return UIBezierPath(arcCenter: midPoint, radius: withRadius, startAngle: 0.0, endAngle: CGFloat((3/2)*Double.pi), clockwise: false)
    }
    
    override func draw(_ rect: CGRect) {
        

         // var skullCenter = convert(center, from: superview)
         // midX,Y 는 CGRect 의 직사각형을 걸쳐 중간이 되는 지점
         
        let skull = pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius)
        skull.lineWidth = 5.0
        UIColor.blue.set()
        skull.stroke()
    }


}
