//
//  uiviewExtension.swift
//  MobileNOC
//
//  Created by Munadel Qubbaj on 8/12/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//
import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        self.layer.mask = mask

        if borderWidth != nil {
            addBorder(mask, borderWidth: borderWidth!, borderColor: borderColor!)
        }
    }

    private func addBorder(_ mask: CAShapeLayer, borderWidth: CGFloat, borderColor: UIColor) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
}
