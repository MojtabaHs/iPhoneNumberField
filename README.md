<h1 align="center"> iPhoneNumberTextField ☎️</p>
<h3 align="center">Format phone numbers as they're typed. 📲</h3>

<p align="center">
    <strong><a href="#get-started">Get Started</a></strong> |
    <strong><a href="#examples">Examples</a></strong> |
    <strong><a href="#customize">Customize</a></strong> |
    <strong><a href="#install">Install</a></strong> | 
    <strong><a href="#usage">Usage</a></strong>
</p>

<p align="center">
    <img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/gifcity.gif" alt="CI" />
</p>

<br />

## Get Started

1. [Install](./blob/main/INSTALL.md) `iPhoneNumberTextField`.

2. Add `iPhoneNumberTextField` to your project.
```swift
import SwiftUI
import iPhoneNumberTextField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberTextField("Phone", text: $text)
    }
}
```

3. Customize your `iPhoneNumberTextField`


##Examples
### Example 1

Use `iPhoneNumberTextField` to

```swift
import SwiftUI
import iPhoneNumberTextField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberTextField("Phone", text: $text)
    }
}
```


### Example 2

Use `iPhoneNumberTextField` to

If you want, you can pass in your own optional `isEditing` binding to `iPhoneNumberTextField`.

```swift
import SwiftUI
import iPhoneNumberTextField

struct ContentView: View {
    @State var text = ""

    var body: some View {
        iPhoneNumberTextField("Phone", text: $text)
    }
}
```

## Customize
`iPhoneNumberTextField` takes 2 required parameters: 1️⃣ a `String` placeholder, and 2️⃣ a binding to a phone number string. All customizations are built into our modifiers.

**Example**: Do things
```swift
iPhoneNumberTextField("", text: $text)
```
Use our exhaustive input list to customize your view.


| | Modifier | Description
--- | --- | ---
🔠 | `.font(_:)` | Modifies the text field’s **font** from a `UIFont` object.
🎨 | `.foregroundColor(_:)` | Modifies the **text color**  of the text field.
🌈 | `.placeholderColor(_:)` | Modifies the **placeholder color** of the text field.
🖍 | `.numberPlaceholderColor(_:)` | Modifies the **number placeholder color** of the text field.
🐠 | `.countryCodePlaceholderColor(_:)` | Modifies the **number placeholder color** of the text field.
↔️ | `.multilineTextAlignment(_:)` |Modifies the **text alignment** of a text field.
☎️ | `.textContentType(_:)` | Modifies the **content type** of a text field.
▶️ | `.clearsOnBeginEditing(_:)` | Modifies the **clear-on-begin-editing** setting of a  text field.
👆 | `.clearsOnInsertion(_:)` | Modifies the **clear-on-insertion** setting of a text field.
❌ | `.clearButtonMode(_:)` | Modifies whether and when the text field **clear button** appears on the view.
☑️ | `.textFieldStyle(_:)` | Modifies the style of the text field.
🔟 | `.maximumDigits(_:)` | Modifies the maximum number of digits the text field allows.
🇦🇶 | `.showsFlag(_:)` | Modifies whether the text field shows the country flag on the left.
🇸🇮 | `.isFlagSelectable(_:)` | Modifies whether the flag is selectable.
➕ | `.showPrefix(_:)` | Modifies whether the country code prefix should be shown.
✋ | `.disabled(_:)` | Modifies whether the text field is **disabled**.
▶️ | `.onBeginEditing(perform: { code })` | Modifies the function called when text editing **begins**.
💬 | `.onPhoneNumberChange(perform: { code })` | Modifies the function called when the user makes any **changes** to the text in the text field.
💬 | `.onEditingChange(perform: { code })` | Modifies the function called when the user makes any **changes** to the text in the text field.
🔚 | `.onEndEditing(perform: ({ code })` | Modifies the function called when text editing **ends**.
🔘 | `.onClear(perform: { code })` | Modifies the function called when the user clears the text field.
↪️ | `.onReturn(perfom: { code })` | Modifies the function called when the user presses return.


## Install
You can use the Swift package manager to install `iPhoneNumberTextField`. Find instructions [here] (https://github.com/benjaminsage/iPhoneNumberTextField/blob/main/INSTALL.md)

## Usage
<b>`iPhoneNumberTextField`is FREE and open-source for individuals, and will remain that way forever.</b>

`iPhoneNumberTextField` is distributed under a GNU GPL open source license. 

Commercial friends, please note, this license is <b><a href="https://en.wikipedia.org/wiki/GNU_General_Public_License#Legal_barrier_to_app_stores">incompatible with many commercial applications</a></b>. If your end product may make money, licenses are available for only $0.99.

<p align="center"><a href="https://general099748.typeform.com/to/p5FtTKBj"> <img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/Purchase%20License.png" width="300"> </a> </p>

##  Features

| |Features |
--------------------------|------------------------------------------------------------
🎨 | Extremely customizable
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


  [1]: https://i.stack.imgur.com/5Jvig.gif
