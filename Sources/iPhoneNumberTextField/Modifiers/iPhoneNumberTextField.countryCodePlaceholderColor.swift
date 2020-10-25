//
//  iPhoneNumberTextField.countryCodePlaceholderColor.swift
//  iPhoneNumberTextField
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 10/23/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import SwiftUI

@available(iOS 14.0, *)
public extension iPhoneNumberTextField {
    func countryCodePlaceholderColor(_ color: Color) -> Self {
        countryCodePlaceholderColor(UIColor(color))
    }
}

public extension iPhoneNumberTextField {
    func countryCodePlaceholderColor(_ uiColor: UIColor) -> Self {
        var copy = self
        copy.countryCodePlaceholderColor = uiColor
        return copy
    }
}
