//
//  UIFont+Init.swift
//  iPhoneNumberField
//
//  Created by Kalil Fine on 11/1/20.
//

#if os(macOS)
import AppKit
public typealias NativeFont = NSFont
public typealias NativeFontDescriptor = NSFontDescriptor
#elseif os(iOS)
import UIKit
public typealias NativeFont = UIFont
public typealias NativeFontDescriptor = UIFontDescriptor
#endif

public extension NativeFont {
    /// Initializes a `UIFont` using the same system initializer syntax available in `Font` 🔠🔡
        /// - Parameters:
        ///   - size: The font size as a `CGFloat`
        ///   - weight: Font weight from the `UIFont.Weight` types
        ///   - design: Font design from the `UIFontDescriptor.SystemDesign` options
    convenience init? (size: CGFloat = 14, weight: NativeFont.Weight = .regular, design: NativeFontDescriptor.SystemDesign = .rounded) {
        // Will be SF Compact or standard SF in case of failure.
        // Just pass in proper inputs and this shit won't fail
        if let descriptor = NativeFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(design) {
            self.init(descriptor: descriptor, size: size)
        } else {
            self.init()
        }
    }
}
