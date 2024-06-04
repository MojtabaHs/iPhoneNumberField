//
//  PhoneNumberTextField.swift
//
//
//  Created by Evgeny Blinov on 04.06.2024.
//

import Foundation
import PhoneNumberKit

open class PhoneNumberField: PhoneNumberTextField {
    override open func insertText(_ text: String) {
        let textToInsert = isPartialFormatterEnabled ? partialFormatter.formatPartial(text) : text
        super.insertText(textToInsert)
        self.updateFlag()
    }
}
