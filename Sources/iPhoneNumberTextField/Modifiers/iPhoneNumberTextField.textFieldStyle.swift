//
//  iPhoneNumberTextField.textFieldStyle.swift
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

public extension iPhoneNumberTextField {
    func textFieldStyle(_ style: UITextField.BorderStyle) -> Self {
        var copy = self
        copy.borderStyle = style
        return copy
    }
}
