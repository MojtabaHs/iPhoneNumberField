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
import PhoneNumberKit

public extension iPhoneNumberTextField {
    
    /// Modifies the text field’s **font** from a `UIFont` object. 🔠🔡
    /// - Parameter font: The desired font 🅰️🆗
    /// - Returns: An updated text field using the desired font 💬
    /// - Warning: ⚠️ Accepts a `UIFont` object rather than SwiftUI `Font` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/uikit/uifont)
    func font(_ font: UIFont?) -> Self {
        var view = self
        view.font = font
        return view
    }
    
    /// Modifies the **text color** 🎨 of the text field.
    /// - Parameter color: The desired text color 🌈
    /// - Returns: An updated text field using the desired text color 🚦
    @available(iOS 14, *)
    func foregroundColor(_ color: Color?) -> Self {
        if let color = color {
            return foregroundColor(UIColor(color))
        } else {
            return nilForegroundColor()
        }
    }
    /// Modifies the **text color** 🎨 of the text field from a `CGColor` obect.
    /// - Parameter color: The desired text color 🌈
    /// - Returns: An updated text field using the desired text color 🚦
    /// - Warning: ⚠️ Accepts a `CGColor` object rather than SwiftUI `Color` ⚠️
    /// - SeeAlso: [`CGColor`](https://developer.apple.com/documentation/coregraphics/cgcolor)
    func foregroundColor(_ color: CGColor?) -> Self {
        if let color = color {
            return foregroundColor(UIColor(cgColor: color))
        } else {
            return nilForegroundColor()
        }
    }
    
    /// Modifies the **text color** 🎨 of the text field from a `UIColor` obect.
    /// - Parameter color: The desired text color 🌈
    /// - Returns: An updated text field using the desired text color 🚦
    /// - Warning: ⚠️ Accepts a `UIColor` object rather than SwiftUI `Color` ⚠️
    /// - SeeAlso: [`UIColor`](https://developer.apple.com/documentation/uikit/uicolor)
    func foregroundColor(_ color: UIColor?) -> Self {
        var view = self
        view.textColor = color
        return view
    }

    private func nilForegroundColor() -> Self {
        var view = self
        view.textColor = nil
        return view
    }
    
    /// Modifies the **placeholder color** 🌈 of the text field.
    /// - Parameter color: The placeholder color. 🎨
    /// - Returns: A phone number text field with updated pleceholder color. 🚥🖍
    @available(iOS 14, *)
    func placeholderColor(_ color: Color?) -> Self {
        self
            .numberPlaceholderColor(color)
            .countryCodePlaceholderColor(color)
    }
    
    /// Modifies the **placeholder color** 🌈 of the text field.
    /// - Parameter color: The placeholder color. 🎨
    /// - Returns: A phone number text field with updated pleceholder color. 🚥🖍
    func placeholderColor(_ color: UIColor?) -> Self {
        self
            .numberPlaceholderColor(color)
            .countryCodePlaceholderColor(color)
    }

    /// Modifies the **placeholder color** 🌈 of the text field.
    /// - Parameter color: The placeholder color. 🎨
    /// - Returns: A phone number text field with updated number pleceholder color. 🚥🖍
    func placeholderColor(_ color: CGColor?) -> Self {
        self
            .numberPlaceholderColor(color)
            .countryCodePlaceholderColor(color)
    }
    
    /// Modifies the **number placeholder color** 🌈 of the text field.
    /// - Parameter color: The placeholder color. 🎨
    /// - Returns: A phone number text field with updated number pleceholder color.
    @available(iOS 14, *)
    func numberPlaceholderColor(_ color: Color?) -> Self {
        if let color = color {
            return numberPlaceholderColor(UIColor(color))
        } else {
            return nilNumberPlaceholderColor()
        }
    }
    
    /// Modifies the **number placeholder color** 🌈 of the text field.
    /// - Parameter color: The placeholder color. 🎨
    /// - Returns: A phone number text field with updated number pleceholder color.
    /// - Warning: ⚠️ Accepts a `UIColor` object rather than SwiftUI `Color` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/uikit/uicolor)
    func numberPlaceholderColor(_ color: UIColor?) -> Self {
        var view = self
        view.numberPlaceholderColor = color
        return view
    }
    
    /// Modifies the **number placeholder color** 🌈 of the text field.
    /// - Parameter color: The number placeholder color. 🎨
    /// - Returns: A phone number text field with updated number pleceholder color.
    /// - Warning: ⚠️ Accepts a `CGColor` object rather than SwiftUI `Color` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/coregraphics/cgcolor)
    func numberPlaceholderColor(_ color: CGColor?) -> Self {
        if let color = color {
            return numberPlaceholderColor(UIColor(cgColor: color))
        } else {
            return nilNumberPlaceholderColor()
        }
    }
    
    /// Modifies the **country code placeholder color** 🌈 of the text field.
    /// - Parameter color: The country code placeholder color 🎨
    /// - Returns: A phone number text field with updated country code pleceholder color
    @available(iOS 14, *)
    func countryCodePlaceholderColor(_ color: Color?) -> Self {
        if let color = color {
            return countryCodePlaceholderColor(UIColor(color))
        } else {
            return nilCountryPlaceholderColor()
        }
    }
    
    /// Modifies the **country code placeholder color** 🌈 of the text field.
    /// - Parameter color: The country code placeholder color 🎨
    /// - Returns: A phone number text field with updated country code pleceholder color
    /// - Warning: ⚠️ Accepts a `UIColor` object rather than SwiftUI `Color` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/uikit/uicolor)
    func countryCodePlaceholderColor(_ color: UIColor?) -> Self {
        var view = self
        view.countryCodePlaceholderColor = color
        return view
    }
    
    /// Modifies the **country code placeholder color** 🌈 of the text field.
    /// - Parameter color: The country code placeholder color 🎨
    /// - Returns: A phone number text field with updated country code pleceholder color
    /// - Warning: ⚠️ Accepts a `CGColor` object rather than SwiftUI `Font` ⚠️
    /// - SeeAlso: [`UIFont`](https://developer.apple.com/documentation/coregraphics/cgcolor)
    func countryCodePlaceholderColor(_ color: CGColor?) -> Self {
        if let color = color {
            return countryCodePlaceholderColor(UIColor(cgColor: color))
        } else {
            return nilCountryPlaceholderColor()
        }
    }
    
    private func nilPlaceholderColor() -> Self {
        self
            .nilNumberPlaceholderColor()
            .nilCountryPlaceholderColor()
    }
    private func nilNumberPlaceholderColor() -> Self {
        var view = self
        view.numberPlaceholderColor = nil
        return view
    }
    private func nilCountryPlaceholderColor() -> Self {
        var view = self
        view.countryCodePlaceholderColor = nil
        return self
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
    /// - Parameter showsButton: Whether the clear button should be visible.
    /// - Returns: A text field with updated clear button settings.
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        var view = self
        view.clearButtonMode = mode
        return view
    }
    
    /// Modifies the style of the text field. ☑️
    /// - Parameter style: The text field style.
    /// - Returns: A text field with the updated style.
    func textFieldStyle(_ style: UITextField.BorderStyle) -> Self {
        var view = self
        view.borderStyle = style
        return view
    }
    
    /// Modifies the maximum number of digits the text field allows. 🔟
    /// - Parameter max: The naximum number of digits in the text field.
    /// - Returns: A text field with the updated maximum digits settings.
    func maximumDigits(_ max: Int?) -> Self {
        var view = self
        view.maxDigits = max
        return view
    }
    
    /// Modifies whether the text field shows the country flag on the left. 🇦🇶
    /// - Parameter showFlag: Whether the text field shows the flag.
    /// - Returns: A text field with the updated flag visibility.
    func showFlag(_ showFlag: Bool) -> Self {
        var view = self
        view.showFlag = showFlag
        return view
    }
    
    /// Modifies whether the flag is selectable 🇸🇮.
    /// When set to `true`, tapping on the flag will pull up a sheet allowing the user to select a flag.
    /// - Parameter isFlagSelectable: Whether the flag is selectable.
    /// - Returns: A text field with the updated flag-selectability settings.
    func isFlagSelectable(_ isFlagSelectable: Bool) -> Self {
        var view = self
        view.selectableFlag = isFlagSelectable
        return view
    }
    
    /// Modifies whether the country code prefix should be shown. ➕1️⃣
    /// - Parameter showPrefix: Whether the country code prefix should be shown.
    /// - Returns: A text field with the updated prefix settings.
    func showPrefix(_ showPrefix: Bool) -> Self {
        var view = self
        view.autofillPrefix = showPrefix
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
    /// - Returns: An updated text field using the desired function called when the user clears the text field.
    func onClear(perform action: ((PhoneNumberTextField) -> Void)? = nil) -> Self {
        var view = self
        if let action = action {
            view.onClearHandler = action
        }
        return view
    }
    
    /// Modifies the function called when the user presses return. ↪️
    /// - Parameter action: The action to perform. If `action` is `nil`, the call has no effect.
    /// - Returns: An updated text field using the desired function called when the user presses the return key.
    func onReturn(perfom action: ((PhoneNumberTextField) -> Void)? = nil) -> Self {
        var view = self
        if let action = action {
            view.onReturnHandler = action
        }
        return view
    }
    
    /// Our packages inherently voids the functionallity of textContentType 🙃. As described by Apple 👩‍💻, "The textContentType property is designed to provide the keyboard with extra information about the semantic intent of the text document". However, in our case the semantic intent is always to write a phone number 😁☎
    /// - Parameter textContentType:
    /// - Returns: self
    @available(*, deprecated, message: "Our packages inherently voids the functionallity of textContentType 🙃")
    func textContentType(_ textContentType: UITextContentType?) -> Self { return self }
}
