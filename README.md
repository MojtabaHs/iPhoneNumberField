# iPhoneNumberTextField

Elegant SwiftUI phone number textField.

[![Demo][1]][1]

##  Features

| |Features |
--------------------------|------------------------------------------------------------
🎨 | Extreamly customizable
:phone: | Validate, normalize and extract the elements of any phone number string.
:checkered_flag: | Fast. 1000 parses -> ~0.4 seconds.
:books: | Best-in-class metadata from Google's libPhoneNumber project.
:trophy: | Fully tested to match the accuracy of Google's JavaScript implementation of libPhoneNumber.
:iphone: | Built for iOS. Automatically grabs the default region code from the phone.
📝 | Editable (!) AsYouType formatter for UITextField.
:us: | Convert country codes to country names and vice versa
⚙️ | Access to all native `UITextField` configurations
🔍 | Searchable and customizable country code and name list
∞ | Many more features to discover

---
## Initial Arguments and their default values

`placeholder: String? = nil`

`text: Binding<String>`

`isEditing: Binding<Bool>? = nil`

`maxDigits: Int? = nil`

`clearButtonMode: UITextField.ViewMode = .whileEditing`

`showFlag: Bool = true`

`selectableFlag: Bool = true`

`showPrefix: Bool = false`

`numberPlaceholderColor: UIColor = .gray`

`countryCodePlaceholderColor: UIColor = .gray`

`configuration: @escaping (UIViewType) -> () = { _ in }`

---
## Modifiers

`.accentColor`

`.textFieldStyle`

`.font`

`.onBeginEditing`

`.onEditingChange`

`.onEndEditing`

`.onPhoneNumberChange`

`.placeholderColor `

`.countryCodePlaceholderColor`

`.numberPlaceholderColor`


  [1]: https://i.stack.imgur.com/5Jvig.gif
