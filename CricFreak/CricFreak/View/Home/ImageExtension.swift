//
//  ImageExtension.swift
//  CricFreak
//
//  Created by Admin on 14/2/23.
//

import Foundation
import UIKit

extension UIImage {
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    func imageWithBorder(width: CGFloat, color: UIColor, position: UIRectEdge) -> UIImage {
        let newSize = CGSize(width: self.size.width + width, height: self.size.height + width)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(width)
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = position == .bottom ? CGPoint(x: newSize.width, y: newSize.height) : CGPoint(x: 0, y: newSize.height)
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.strokePath()
        self.draw(in: CGRect(x: width / 2, y: width / 2, width: self.size.width, height: self.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
