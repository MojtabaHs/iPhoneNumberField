//
//  iPhoneNumberTextField.onPhoneNumberChange.swift
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
import struct PhoneNumberKit.PhoneNumber

public extension iPhoneNumberTextField {
    func onPhoneNumberChange(_ handler: @escaping (PhoneNumber?) -> ()) -> Self {
        var copy = self
        copy.onPhoneNumberChangeHandler = handler
        return copy
    }
}
