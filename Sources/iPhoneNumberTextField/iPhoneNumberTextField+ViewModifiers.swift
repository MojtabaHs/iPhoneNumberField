//
//  iPhoneNumberTextField.accentColor.swift
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
    /// Modifies the text field’s **font** from a `UIFont` object. 🔠🔡
    /// - Parameter font: The desired font 🅰️🆗
    /// - Returns: An updated text field using the desired font 💬
    /// - Warning: ⚠️ Accepts a `UIFont` object rather than SwiftUI `Font` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/uikit/uifont)
    func fontFromUIFont(_ font: UIFont?) -> Self {
        var view = self
        view.font = font
        return view
    }
    
    /// Modifies the **text color** 🎨 of the text field.
    /// - Parameter color: The desired text color 🌈
    /// - Returns: An updated text field using the desired text color 🚦
    func foregroundColor(_ color: Color?) -> Self {
        var view = self
        if let color = color {
            view.textColor = UIColor.from(color: color)
        }
        return view
    }
    
    /// Modifies the **cursor color** 🌈 of the text field 🖱 💬
    /// - Parameter accentColor: The cursor color 🎨
    /// - Returns: A phone number text field with updated cursor color 🚥🖍
    func accentColor(_ accentColor: Color?) -> Self {
        var view = self
        if let accentColor = accentColor {
            view.accentColor = UIColor.from(color: accentColor)
        }
        return view
    }
    
    /// Modifies the **text alignment** of a text field. ⬅️ ↔️ ➡️
    /// - Parameter alignment: The desired text alignment 👈👉
    /// - Returns: An updated text field using the desired text alignment ↩️↪️
    func multilineTextAlignment(_ alignment: TextAlignment) -> Self {
        var view = self
        switch alignment {
        case .leading:
            view.textAlignment = layoutDirection ~= .leftToRight ? .left : .right
        case .trailing:
            view.textAlignment = layoutDirection ~= .leftToRight ? .right : .left
        case .center:
            view.textAlignment = .center
        }
        return view
    }
    
    /// Modifies the **content type** of a text field. 📧 ☎️ 📬
    /// - Parameter textContentType: The type of text being inputted into the text field ⌨️
    /// - Returns: An updated text field using the desired text content type 💻📨
    func textContentType(_ textContentType: UITextContentType?) -> Self {
        var view = self
        view.contentType = textContentType
        return view
    }
    
    /// Modifies the **clear-on-begin-editing** setting of a  text field. ❌▶️
    /// - Parameter shouldClear: Whether the text field should clear on editing beginning 📭🏁
    /// - Returns:  A text field with updated clear-on-begin-editing settings 🔁
    func clearsOnBeginEditing(_ shouldClear: Bool) -> Self {
        var view = self
        view.clearsOnBeginEditing = shouldClear
        return view
    }
    
    /// Modifies the **clear-on-insertion** setting of a text field. 👆
    /// - Parameter shouldClear: Whether the text field should clear on insertion
    /// - Returns: A text field with updated clear-on-insertion settings
    func clearsOnInsertion(_ shouldClear: Bool) -> Self {
        var view = self
        view.clearsOnInsertion = shouldClear
        return view
    }
    
    /// Modifies whether and when the text field **clear button** appears on the view. ⭕️ ❌
    /// - Parameter showsButton: Whether the clear button should be visible
    /// - Returns: A text field with updated clear button settings
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        var view = self
        view.clearButtonMode = mode
        return view
    }
    
    /// Modifies whether the text field is **disabled**. ✋
    /// - Parameter disabled: Whether the text field is disabled 🛑
    /// - Returns: A text field with updated disabled settings ⬜️⚙️
    func disabled(_ disabled: Bool) -> Self {
        var view = self
        view.isUserInteractionEnabled = !disabled
        return view
    }
    
    /// Modifies the function called when text editing **begins**. ▶️
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when text editing begins ➡️
    func onBeginEditing(perform action: ((UIViewType) -> ())? = nil) -> Self {
        var view = self
        if let action = action {
            view.onBeginEditingHandler = action
        }
        return view
    }

    /// Modifies the function called when the user makes any **changes** to the text in the text field. 💬
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when the user makes any changes to the text in the text field 🔄
    func onPhoneNumberChange(perform action: ((PhoneNumber?) -> ())? = nil) -> Self {
        var view = self
        if let action = action {
            view.onPhoneNumberChangeHandler = action
        }
        return view
    }

    /// Modifies the function called when the user makes any **changes** to the text in the text field. 💬
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when the user makes any changes to the text in the text field 🔄
    func onEditingChange(perform action: ((UIViewType) -> ())? = nil) -> Self {
        var view = self
        if let action = action {
            view.onEditingChangeHandler = action
        }
        return view
    }

    /// Modifies the function called when text editing **ends**. 🔚
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when text editing ends ✋
    func onEndEditing(perform action: ((UIViewType) -> ())? = nil) -> Self {
        var view = self
        if let action = action {
            view.onEndEditingHandler = action
        }
        return view
    }

    /// Modifies the function called when the user clears the text field. ❌
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when the user clears the text field
    func onClear(perform action: ((PhoneNumberTextField) -> Void)? = nil) -> Self {
        var view = self
        if let action = action {
            view.onClearHandler = action
        }
        return view
    }
    
    func textFieldStyle(_ style: UITextField.BorderStyle) -> Self {
        var view = self
        view.borderStyle = style
        return view
    }
    func placeholderColor(_ color: Color) -> Self {
        self
            .numberPlaceholderColor(color)
            .countryCodePlaceholderColor(color)
    }
    func numberPlaceholderColor(_ color: Color) -> Self {
        var view = self
        view.numberPlaceholderColor = UIColor.from(color: color)
        return view
    }
    func countryCodePlaceholderColor(_ color: Color) -> Self {
        var view = self
        view.countryCodePlaceholderColor = UIColor.from(color: color)
        return view
    }
    func maximumDigits(_ max: Int?) -> Self {
        var view = self
        view.maxDigits = max
        return view
    }
    func showsFlag(_ showsFlag: Bool) -> Self {
        var view = self
        view.showFlag = showsFlag
        return view
    }
    func isFlagSelectable(_ isFlagSelectable: Bool) -> Self {
        var view = self
        view.selectableFlag = isFlagSelectable
        return view
    }
}
