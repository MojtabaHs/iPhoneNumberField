//
//  iPhoneNumberTextField.swift
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

// MARK: - Usage:
public struct iPhoneNumberTextField: UIViewRepresentable {
    /// The actual text of the textField. It's includes the extra formatting characters.
    @Binding public var text: String

    /// The controlling variable of the first responder.
    private var externalIsFirstResponder: Binding<Bool>?

    /// Internal state of being first responder in case of external `externalIsFirstResponder` not provided.
    @State private var internalIsFirstResponder: Bool = false

    /// Auto switcher between internal and external firstResponder manager.
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

    /// The maximum number of accepting digits.
    internal var maxDigits: Int?

    /// The font of the textField.
    internal var font: UIFont?

    /// The mode of the clear button.
    internal var clearButtonMode: UITextField.ViewMode = .never

    /// The text of the placeholder, setting it `nil` will show default number example as the placeholder.
    private let placeholder: String?

    /// Show the country flag
    internal var showFlag: Bool = false

    /// Show a full list of countries on tap of the  flag.
    internal var selectableFlag: Bool = false

    /// Automatically fill the country code.
    private let autofillPrefix: Bool

    /// The text color of the textField.
    internal var textColor: UIColor?
    
    /// The color of the text field's cursor and highlighting.
    internal var accentColor: UIColor?

    /// The number part of the placeholder color.
    internal var numberPlaceholderColor: UIColor?

    /// The country code part of the placeholder color.
    internal var countryCodePlaceholderColor: UIColor?

    /// The style of the `UITextField`.
    internal var borderStyle: UITextField.BorderStyle = .none

    /// The textField invokes this closure when it became the first responder.
    internal var onBeginEditingHandler = { (view: PhoneNumberTextField) in }

    /// The textField invokes this closure when it changes.
    internal var onEditingChangeHandler = { (view: PhoneNumberTextField) in }

    /// The textField invokes this closure when the containing number changes.
    internal var onPhoneNumberChangeHandler = { (phoneNumber: PhoneNumber?) in }

    /// The textField invokes this closure when it resign the first responder.
    internal var onEndEditingHandler = { (view: PhoneNumberTextField) in }
    
    internal var onClearHandler = { (view: PhoneNumberTextField) in }

    /// Access all properties of the original UIView.
    public var configuration = { (view: PhoneNumberTextField) in }
    
    /// The alignment of the textField.
    @Environment(\.layoutDirection) internal var layoutDirection: LayoutDirection
    internal var textAlignment: NSTextAlignment?
    
    /// The content type of the textField.
    internal var contentType: UITextContentType?
    
    /// Whether the textField clears on begin editing.
    internal var clearsOnBeginEditing = false
    
    /// Whether the textField clears on insertion.
    internal var clearsOnInsertion = false
    
    /// Whether the user can interact with the textField
    internal var isUserInteractionEnabled = true

    public init(_ placeholder: String? = nil,
                text: Binding<String>,
                isEditing: Binding<Bool>? = nil,
                configuration: @escaping (UIViewType) -> () = { _ in } ) {

        self.placeholder = placeholder
        self.externalIsFirstResponder = isEditing
        self._text = text
        self.configuration = configuration
        self.autofillPrefix = showFlag
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> PhoneNumberTextField {
        let uiView = UIViewType()
        
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.addTarget(context.coordinator,
                         action: #selector(Coordinator.textViewDidChange),
                         for: .editingChanged)
        uiView.delegate = context.coordinator
        uiView.withExamplePlaceholder = placeholder == nil
        
        return uiView
    }

    public func updateUIView(_ uiView: PhoneNumberTextField, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
        
        uiView.text = text
        uiView.font = font
        uiView.maxDigits = maxDigits
        uiView.clearButtonMode = clearButtonMode
        uiView.placeholder = placeholder
        uiView.borderStyle = borderStyle
        uiView.textColor = textColor
        uiView.withFlag = showFlag
        uiView.withDefaultPickerUI = selectableFlag
        uiView.withPrefix = autofillPrefix

        if let numberPlaceholderColor = numberPlaceholderColor {
            uiView.numberPlaceholderColor = numberPlaceholderColor
        }
        if let countryCodePlaceholderColor = countryCodePlaceholderColor {
            uiView.countryCodePlaceholderColor = countryCodePlaceholderColor
        }
        if let contentType = contentType {
            uiView.textContentType = contentType
        }
        if let accentColor = accentColor {
            uiView.tintColor = accentColor
        }
        if let textAlignment = textAlignment {
            uiView.textAlignment = textAlignment
        }

        if isFirstResponder {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(text: $text,
                    isFirstResponder: externalIsFirstResponder ?? $internalIsFirstResponder,
                    onBeginEditing: onBeginEditingHandler,
                    onEditingChange: onEditingChangeHandler,
                    onEndEditing: onEndEditingHandler,
                    onClear: onClearHandler)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        internal init(
            text: Binding<String>,
            isFirstResponder: Binding<Bool>,
            onBeginEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onEditingChange: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onEndEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onClear: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in }
        ) {

            self.text = text
            self.isFirstResponder = isFirstResponder
            self.onBeginEditing = onBeginEditing
            self.onEndEditing = onEndEditing
            self.onClear = onClear
        }

        var text: Binding<String>
        var isFirstResponder: Binding<Bool>

        var onBeginEditing = { (view: PhoneNumberTextField) in }
        var onEditingChange = { (view: PhoneNumberTextField) in }
        var onPhoneNumberChange = { (phoneNumber: PhoneNumber?) in }
        var onEndEditing = { (view: PhoneNumberTextField) in }
        var onClear = { (view: PhoneNumberTextField) in }

        @objc public func textViewDidChange(_ textField: UITextField) {
            guard let textField = textField as? PhoneNumberTextField else { return assertionFailure("Undefined state") }
            self.text.wrappedValue = textField.text ?? ""
            self.onEditingChange(textField)
            self.onPhoneNumberChange(textField.phoneNumber)
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            self.isFirstResponder.wrappedValue = true
            self.onBeginEditing(textField as! PhoneNumberTextField)
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            self.isFirstResponder.wrappedValue = false
            self.onEndEditing(textField as! PhoneNumberTextField)
        }
        
        public func textFieldShouldClear(_ textField: UITextField) -> Bool {
            self.onClear(textField as! PhoneNumberTextField)
            text.wrappedValue = ""
            return false
        }
    }
}
