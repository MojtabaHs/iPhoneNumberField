//
//  File.swift
//  
//
//  Created by Kalil Fine on 11/1/20.
//

import SwiftUI

@available(iOS 13.0, *)
public extension UIFont {
    /// Initializes a `UIFont` using the same system initializer syntax available in `Font` 🔠🔡
        /// - Parameters:
        ///   - size: The font size as a `CGFloat`
        ///   - weight: Font weight from the `UIFont.Weight` types
        ///   - design: Font design from the `UIFontDescriptor.SystemDesign` options
    convenience init? (size: CGFloat = 14, weight: UIFont.Weight = .regular, design: UIFontDescriptor.SystemDesign = .rounded) {
        // Will be SF Compact or standard SF in case of failure.
        // Just pass in proper inputs and this shit won't fail
        if let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(design) {
            self.init(descriptor: descriptor, size: size)
        } else {
            self.init()
        }
    }
}
