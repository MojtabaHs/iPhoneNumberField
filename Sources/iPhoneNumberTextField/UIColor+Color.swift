//
//  UIColor+Color.swift
//  
//
//  Created by Benjamin Sage on 10/25/20.
//

import SwiftUI
import UIKit

extension UIColor {
    class func from(color: Color) -> UIColor {
        if #available(iOS 14, *) {
            return UIColor(color)
        } else {
            let scanner = Scanner(string: color.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            
            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
            
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }
}
