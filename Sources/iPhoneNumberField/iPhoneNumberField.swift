//
//  iPhoneNumberField.swift
//  iPhoneNumberField
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

/// A text field view representable structure that formats the user's phone number as they type.
public struct iPhoneNumberField: UIViewRepresentable {
    
    /// The formatted phone number `String`.
    /// This variable writes to the binding provided in the initializer.
    @Binding public var text: String
    @State private var displayedText: String
    
    /// Whether or not the phone number field is editing.
    /// This variable is `nil` unless the user passes in an `isEditing` binding.
    private var externalIsFirstResponder: Binding<Bool>?

    /// Whether or not the phone number field is editing.
    /// This variable is used only if an `isEditing` binding was not provided in the initializer.
    @State private var internalIsFirstResponder: Bool = false

    /// Whether or not the phone number field is editing. 💬
    /// This variable uses `externalIsFirstResponder` binding variable if an `isEditing` binding was provided in the initializer, otherwise it uses the `internalIsFirstResponder` state variable.
    private var isFirstResponder: Bool {
        get { externalIsFirstResponder?.wrappedValue ?? internalIsFirstResponder }
        set {
            if externalIsFirstResponder != nil {
                externalIsFirstResponder!.wrappedValue = newValue
            } else {
                internalIsFirstResponder = newValue
            }
        }
    }

    /// The maximum number of digits the phone number field allows. 🔢
    internal var maxDigits: Int?

    /// The font of the phone number field. 🔡
    internal var font: UIFont?

    /// The phone number field's "clear button" mode. 🚫
    internal var clearButtonMode: UITextField.ViewMode = .never

    /// The text displayed in the phone number field when no number has been typed yet.
    /// Setting this `nil` will display a default phone number as the placeholder.
    private let placeholder: String?

    /// Whether the country flag should be displayed in the phone number field. 🇦🇶
    internal var showFlag: Bool = false

    /// Whether tapping the flag should show a sheet containing all of the country flags. 🏴‍☠️
    internal var selectableFlag: Bool = false

    /// Whether the country code should be automatically filled for the end user. ➕
    internal var autofillPrefix: Bool = false

    /// Whether the country code should be automatically displayed for the end user. 🎓
    internal var previewPrefix: Bool = false

    /// Change the default prefix number by setting the region. 🇮🇷
    internal var defaultRegion: String?

    /// The color of the text of the phone number field. 🎨
    internal var textColor: UIColor?
    
    /// The color of the phone number field's cursor and highlighting. 🖍
    internal var accentColor: UIColor?

    /// The color of the number (excluding country code) portion of the placeholder.
    internal var numberPlaceholderColor: UIColor?

    /// The color of the country code portion of the placeholder color.
    internal var countryCodePlaceholderColor: UIColor?

    /// The visual style of the phone number field. 🎀
    /// For now, this uses `UITextField.BorderStyle`. Updates on this modifier to come.
    internal var borderStyle: UITextField.BorderStyle = .none
    
    /// Whether or not the `text` property will be formatted.
    ///
    /// When set to `false`, the binding is set to an empty string until a valid number is detected.
    /// When set to `true`, the binding displays exactly what is in the text field.
    internal var formatted: Bool = true

    /// An action to perform when editing on the phone number field begins. ▶️
    /// The closure requires a `PhoneNumberTextField` parameter, which is the underlying `UIView`, that you can change each time this is called, if desired.
    internal var onBeginEditingHandler = { (view: PhoneNumberTextField) in }

    /// An action to perform when any characters in the phone number field are changed. 💬
    /// The closure requires a `PhoneNumberTextField` parameter, which is the underlying `UIView`, that you can change each time this is called, if desired.
    internal var onEditingChangeHandler = { (view: PhoneNumberTextField) in }

    /// An action to perform when any characters in the phone number field are changed. ☎️
    /// The closure requires a `PhoneNumber` parameter, that you can change each time this is called, if desired.
    internal var onPhoneNumberChangeHandler = { (phoneNumber: PhoneNumber?) in }

    /// An action to perform when editing on the phone number field ends. ⏹
    /// The closure requires a `PhoneNumberTextField` parameter, which is the underlying `UIView`, that you can change each time this is called, if desired.
    internal var onEndEditingHandler = { (view: PhoneNumberTextField) in }
    
    /// An action to perform when the phone number field is cleared. ❌
    /// The closure requires a `PhoneNumberTextField` parameter, which is the underlying `UIView`, that you can change each time this is called, if desired.
    internal var onClearHandler = { (view: PhoneNumberTextField) in }
    
    /// An action to perform when the return key on the phone number field is pressed. ↪️
    /// The closure requires a `PhoneNumberTextField` parameter, which is the underlying `UIView`, that you can change each time this is called, if desired.
    internal var onReturnHandler = { (view: PhoneNumberTextField) in }

    /// A closure that requires a `PhoneNumberTextField` object to be configured in the body. ⚙️
    public var configuration = { (view: PhoneNumberTextField) in }
    
    @Environment(\.layoutDirection) internal var layoutDirection: LayoutDirection
    /// The horizontal alignment of the phone number field.
    internal var textAlignment: NSTextAlignment?
    
    /// Whether the phone number field clears when editing begins. 🎬
    internal var clearsOnBeginEditing = false
    
    /// Whether the phone number field clears when text is inserted. 👆
    internal var clearsOnInsertion = false
    
    /// Whether the phone number field is enabled for interaction. ✅
    internal var isUserInteractionEnabled = true

    public init(_ title: String? = nil,
                text: Binding<String>,
                isEditing: Binding<Bool>? = nil,
                formatted: Bool = true,
                configuration: @escaping (UIViewType) -> () = { _ in } ) {

        self.placeholder = title
        self.externalIsFirstResponder = isEditing
        self.formatted = formatted
        self._text = text
        self._displayedText = State(initialValue: text.wrappedValue)
        self.configuration = configuration
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> PhoneNumberTextField {
        let uiView = UIViewType()
        
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.addTarget(context.coordinator,
                         action: #selector(Coordinator.textViewDidChange),
                         for: .editingChanged)
        uiView.delegate = context.coordinator
        uiView.withExamplePlaceholder = placeholder == nil
        if let defaultRegion = defaultRegion {
            uiView.partialFormatter.defaultRegion = defaultRegion
        }
        
        configuration(uiView)
        return uiView
    }

    public func updateUIView(_ uiView: PhoneNumberTextField, context: UIViewRepresentableContext<Self>) {
        DispatchQueue.main.async {
            uiView.textContentType = .telephoneNumber //allow auto-fill to work with telephone text field
            uiView.text = text
            uiView.font = font
            uiView.maxDigits = maxDigits
            uiView.clearButtonMode = clearButtonMode
            uiView.placeholder = placeholder
            uiView.borderStyle = borderStyle
            uiView.textColor = textColor
            uiView.withFlag = showFlag
            uiView.withDefaultPickerUI = selectableFlag
            uiView.withPrefix = previewPrefix
            uiView.partialFormatter.defaultRegion = defaultRegion ?? PhoneNumberKit.defaultRegionCode()
            if placeholder != nil {
                uiView.placeholder = placeholder
            } else {
                uiView.withExamplePlaceholder = autofillPrefix
            }

            uiView.tintColor = accentColor

            if let numberPlaceholderColor = numberPlaceholderColor {
                uiView.numberPlaceholderColor = numberPlaceholderColor
            }
            if let countryCodePlaceholderColor = countryCodePlaceholderColor {
                uiView.countryCodePlaceholderColor = countryCodePlaceholderColor
            }
            if let textAlignment = textAlignment {
                uiView.textAlignment = textAlignment
            }

            if isFirstResponder {
                uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
            }

            configuration(uiView)
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(
            text: $text,
                    displayedText: $displayedText,
                    isFirstResponder: externalIsFirstResponder ?? $internalIsFirstResponder,
                    formatted: formatted,
                    onBeginEditing: onBeginEditingHandler,
                    onEditingChange: onEditingChangeHandler,
                    onPhoneNumberChange: onPhoneNumberChangeHandler,
                    onEndEditing: onEndEditingHandler,
                    onClear: onClearHandler,
                    onReturn: onReturnHandler)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        internal init(
            text: Binding<String>,
            displayedText: Binding<String>,
            isFirstResponder: Binding<Bool>,
            formatted: Bool,
            onBeginEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onEditingChange: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onPhoneNumberChange: @escaping (PhoneNumber?) -> () = { (view: PhoneNumber?) in },
            onEndEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onClear: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onReturn: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in } )
        {
            self.text = text
            self.displayedText = displayedText
            self.isFirstResponder = isFirstResponder
            self.formatted = formatted
            self.onBeginEditing = onBeginEditing
            self.onEditingChange = onEditingChange
            self.onPhoneNumberChange = onPhoneNumberChange
            self.onEndEditing = onEndEditing
            self.onClear = onClear
            self.onReturn = onReturn
        }

        var text: Binding<String>
        var displayedText: Binding<String>
        var isFirstResponder: Binding<Bool>
        var formatted: Bool

        var onBeginEditing = { (view: PhoneNumberTextField) in }
        var onEditingChange = { (view: PhoneNumberTextField) in }
        var onPhoneNumberChange = { (phoneNumber: PhoneNumber?) in }
        var onEndEditing = { (view: PhoneNumberTextField) in }
        var onClear = { (view: PhoneNumberTextField) in }
        var onReturn = { (view: PhoneNumberTextField) in }

        @objc public func textViewDidChange(_ textField: UITextField) {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }

                guard let textField = textField as? PhoneNumberTextField else {
                    return assertionFailure("Undefined state")
                }

                // Updating the binding
                if formatted {
                    // Display the text exactly if unformatted
                    text.wrappedValue = textField.text ?? ""
                } else {
                    if let number = textField.phoneNumber {
                        // If we have a valid number, update the binding
                        let country = String(number.countryCode)
                        let nationalNumber = String(number.nationalNumber)
                        text.wrappedValue = "+" + country + nationalNumber
                    } else {
                        // Otherwise, maintain an empty string
                        text.wrappedValue = ""
                    }
                }

                displayedText.wrappedValue = textField.text ?? ""
                onEditingChange(textField)
                onPhoneNumberChange(textField.phoneNumber)
            }
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                isFirstResponder.wrappedValue = true
                onBeginEditing(textField as! PhoneNumberTextField)
            }
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                isFirstResponder.wrappedValue = false
                onEndEditing(textField as! PhoneNumberTextField)
            }
        }
        
        public func textFieldShouldClear(_ textField: UITextField) -> Bool {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                displayedText.wrappedValue = ""
                onClear(textField as! PhoneNumberTextField)
            }
            return true
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                onReturn(textField as! PhoneNumberTextField)
            }
            return true
        }
    }
}
