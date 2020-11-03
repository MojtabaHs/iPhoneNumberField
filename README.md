<h1 align="center"> iPhoneNumberField ☎️</p>
<h3 align="center">Format phone numbers as they're typed—entirely in SwiftUI. 📱</h3>
<!-- <p align="center">(entirely in SwiftUI!)</p>
 -->
<p align="center">
    <strong><a href="#get-started">Get Started</a></strong> |
    <strong><a href="#examples">Examples</a></strong> |
    <strong><a href="#customize">Customize</a></strong> |
    <strong><a href="#features">Features</a></strong> |
    <strong><a href="#install">Install</a></strong> | 
    <strong><a href="#usage">Usage</a></strong>
</p>

<p align="center">
    <img src="./Resources/demo-pink.gif" alt="CI" />
</p>

<br />

## And it's as easy as
```swift
	iPhoneNumberField("Phone", text: $text)
```


<p align="center">
    <img src="./Resources/showcase-pic.png" width="300" alt="CI" />
</p>



## Get Started

1. [Install](./INSTALL.md) `iPhoneNumberField`.

2. Add `iPhoneNumberField` to your project.
```swift
import SwiftUI
import iPhoneNumberField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberField("Phone", text: $text)
    }
}
```

3. Customize your `iPhoneNumberField`


## Examples
### Flags 🇦🇶 ‼️
<img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/PhoneTextField/Example2.gif">
Show the flag, and make it selectable, so your users can find their region.

```swift
import SwiftUI
import iPhoneNumberField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberField(text: $text)
            .showFlag(true)
            .isFlagSelectable(true)
            .font(UIFont(size: 30, weight: .bold, design: .rounded))
            .padding()
    }
}
```


### Focus and unfocus 🔍 ↕️
<img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/PhoneTextField/Example1.gif">
Use `iPhoneNumberField`'s optional binding to programmatically change text field. 

```swift
import SwiftUI
import iPhoneNumberField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberField(text: $text)
            .font(UIFont(size: 24, weight: .light, design: .monospaced))
            .padding()
    }
}
```


### Max custom style 🎀 🆒
<img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/PhoneTextField/Example4.gif">
Use our modifiers to create a fully customized field.

```swift
import SwiftUI
import iPhoneNumberField

struct ContentView: View {
    @State var text: String = ""
    @State var isEditing: Bool = false

    var body: some View {
        iPhoneNumberField("(000) 000-0000", text: $text, isEditing: $isEditing)
            .showFlag(true)
            .isFlagSelectable(true)
            .font(UIFont(size: 30, weight: .light, design: .monospaced))
            .maximumDigits(10)
            .foregroundColor(Color.neonPink)
            .clearButtonMode(.whileEditing)
            .onClear { _ in
                self.isEditing.toggle()
            }
            .accentColor(Color.neonOrange)
            .padding()
            .background(Color(hue: 0, saturation: 0, brightness: 95, opacity: 1.0))
            .cornerRadius(10)
            .shadow(color: ((self.isEditing) ? .lightGray : .white), radius: 10)
            .padding()
    }
}
```


## Customize
`iPhoneNumberField` takes 2 required parameters: 1️⃣ a `String` placeholder, and 2️⃣ a binding to a phone number string. All customizations are built into our modifiers.

**Example**: Customize the text field style, and call a closure when editing ends.
```swift
iPhoneNumberField("", text: $text)
	.accentColor(Color.green)
	.clearsOnBeginEditing(true)
	.clearButtonMode(.always)
	.onEditingEnded { print("DONE ✅") }
```
Use our exhaustive input list to customize your view.


| | Modifier | Description
--- | --- | ---
🔠 | `.font(_:)` | Modifies the text field’s **font** from a `UIFont` object.
🎨 | `.foregroundColor(_:)` | Modifies the **text color**  of the text field.
🖍 | `.accentColor(_:)` | Modifies the **cursor color**  while typing on the text field.
🌈 | `.placeholderColor(_:)` | Modifies the <i>entire</i> **placeholder color** of the text field.
🖍 | `.numberPlaceholderColor(_:)` | Modifies <i>solely</i> the **phone number placeholder color** of the text field – without the country code.
🐠 | `.countryCodePlaceholderColor(_:)` | Modifies <i>solely</i> the **country code placeholder color** of the text field – without the phone number.
↔️ | `.multilineTextAlignment(_:)` | Modifies the **text alignment** of a text field.
☎️ | `.textContentType(_:)` | Modifies the **content type** of a text field for implied formatting. 
▶️ | `.clearsOnEditingBegan(_:)` | Modifies the **clear-on-begin-editing** setting of a  text field.
👆 | `.clearsOnInsert(_:)` | Modifies the **clear-on-insertion** setting of a text field.
❌ | `.clearButtonMode(_:)` | Modifies whether and when the text field **clear button** appears on the view.
☑️ | `.textFieldStyle(_:)` | Modifies the style of the text field to one of Apple's three pre-designed styles.
🔟 | `.maximumDigits(_:)` | Modifies the maximum number of digits the text field allows.
🇦🇶 | `.flagHidden(_:)` | Modifies whether the text field hides the country flag on the left.
🇸🇮 | `.flagSelectable(_:)` | Modifies whether the flag is selectable.
➕ | `.prefixHidden(_:)` | Modifies whether the country code prefix should be hidden. Note: prefix will only be shown if using the default placeholder (`placeholder = nil`). 
✋ | `.disabled(_:)` | Modifies whether the text field is **disabled**.
▶️ | `.onEditingBegan(perform: { code })` | Modifies the function called when text editing **begins**.
💬 | `.onNumberChange(perform: { code })` | Modifies the function called when the user makes any **changes** to the text in the text field.
💬 | `.onEdit(perform: { code })` | Modifies the function called when the user makes any **changes** to the text in the text field.
🔚 | `.onEditingEnded(perform: ({ code })` | Modifies the function called when text editing **ends**.
🔘 | `.onClear(perform: { code })` | Modifies the function called when the user clears the text field.
↪️ | `.onReturn(perfom: { code })` | Modifies the function called when the user presses return.

##  Features

| |Features |
--------------------------|------------------------------------------------------------
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


## Install
You can use the Swift package manager to install `iPhoneNumberField`. Find instructions [here](./INSTALL.md)

## Help
If you have any questions about iPhoneNumberField, we are available 24/7 to help.

| | Reach us at | -
--- | --- | ---
📞 | +1 (619) 876-0252 | **Call**
📧 | hello@iswiftui.com | **Email**
📲 | +1 (619) 876-0252 | **Text**

## Usage
<b>iPhoneNumberField is FREE and open-source for individuals, and will remain that way forever.</b>

iPhoneNumberField is distributed under a GNU GPL open-source license. 

Commercial friends, please note, this license is <b><a href="https://en.wikipedia.org/wiki/GNU_General_Public_License#Legal_barrier_to_app_stores">incompatible with many commercial applications</a></b>. If your app is distributed for commercial use, it could violate this open-source license even if "the app is free in the App Store."

In order to offer iPhoneNumberField safely to our commercial friends, we made it super easy to purchase a lifetime full-use license for only $0.99. Code on worry free 😁.

<p align="center"><a href="https://general099748.typeform.com/to/p5FtTKBj"> <img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/Purchase%20License.png" width="300"> </a> </p>

