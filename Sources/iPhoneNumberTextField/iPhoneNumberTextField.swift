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
import PhoneNumberKit

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
    private let maxDigits: Int?

    /// The font of the textField.
    internal var font: UIFont?

    /// The mode of the clear button.
    private let clearButtonMode: UITextField.ViewMode

    /// The text of the placeholder, setting it `nil` will show default number example as the placeholder.
    private let placeholder: String?

    /// Show the country flag
    private let showFlag: Bool

    /// Show a full list of countries on tap of the  flag.
    private let selectableFlag: Bool

    /// Automatically fill the country code.
    private let autofillPrefix: Bool

    /// The text color of the textField.
    internal var textColor: UIColor?

    /// The number part of the placeholder color.
    internal var numberPlaceholderColor: UIColor

    /// The country code part of the placeholder color.
    internal var countryCodePlaceholderColor: UIColor

    /// The style of the `UITextField`.
    internal var borderStyle: UITextField.BorderStyle = .none

    /// The textField invokes this closure when it when it became the first responder.
    internal var onBeginEditingHandler = { (view: PhoneNumberTextField) in }

    /// The textField invokes this closure when it when it changes.
    internal var onEditingChangeHandler = { (view: PhoneNumberTextField) in }

    /// The textField invokes this closure when it when it resign the first responder.
    internal var onEndEditingHandler = { (view: PhoneNumberTextField) in }

    /// Access all properties of the original UIView.
    public var configuration = { (view: PhoneNumberTextField) in }

    public init(_ placeholder: String? = nil,
                text: Binding<String>,
                isEditing: Binding<Bool>? = nil,
                maxDigits: Int? = nil,
                clearButtonMode: UITextField.ViewMode = .whileEditing,
                showFlag: Bool = true,
                selectableFlag: Bool = true,
                showPrefix: Bool = false,
                numberPlaceholderColor: UIColor = .gray,
                countryCodePlaceholderColor: UIColor = .gray,
                configuration: @escaping (UIViewType) -> () = { _ in } ) {

        self.placeholder = placeholder
        self.externalIsFirstResponder = isEditing
        self._text = text
        self.maxDigits = maxDigits
        self.clearButtonMode = clearButtonMode
        self.showFlag = showFlag
        self.selectableFlag = selectableFlag
        self.autofillPrefix = showFlag
        self.numberPlaceholderColor = numberPlaceholderColor
        self.countryCodePlaceholderColor = countryCodePlaceholderColor
        self.configuration = configuration
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> PhoneNumberTextField {
        let uiView = UIViewType()
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.addTarget(context.coordinator, action: #selector(Coordinator.textViewDidChange), for: .editingChanged)
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

        uiView.numberPlaceholderColor = numberPlaceholderColor
        uiView.countryCodePlaceholderColor = countryCodePlaceholderColor

        switch isFirstResponder {
        case true: uiView.becomeFirstResponder()
        case false: uiView.resignFirstResponder()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(text: $text,
                    isFirstResponder: externalIsFirstResponder ?? $internalIsFirstResponder,
                    onBeginEditing: onBeginEditingHandler,
                    onEditingChange: onEditingChangeHandler,
                    onEndEditing: onEndEditingHandler)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        internal init(
            text: Binding<String>,
            isFirstResponder: Binding<Bool>,
            onBeginEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onEditingChange: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in },
            onEndEditing: @escaping (PhoneNumberTextField) -> () = { (view: PhoneNumberTextField) in }
        ) {

            self.text = text
            self.isFirstResponder = isFirstResponder
            self.onBeginEditing = onBeginEditing
            self.onEndEditing = onEndEditing
        }

        var text: Binding<String>
        var isFirstResponder: Binding<Bool>

        var onBeginEditing = { (view: PhoneNumberTextField) in }
        var onEditingChange = { (view: PhoneNumberTextField) in }
        var onEndEditing = { (view: PhoneNumberTextField) in }

        @objc public func textViewDidChange(_ textField: UITextField) {
            self.text.wrappedValue = textField.text ?? ""
            self.onEditingChange(textField as! PhoneNumberTextField)
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            self.isFirstResponder.wrappedValue = true
            self.onBeginEditing(textField as! PhoneNumberTextField)
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            self.isFirstResponder.wrappedValue = false
            self.onEndEditing(textField as! PhoneNumberTextField)
        }
    }
}
