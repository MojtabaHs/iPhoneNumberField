import SwiftUI
import iPhoneNumberField

/// Issue: When applying placeholderColor modifier, nothing happens. Placeholder color always the same.
///
/// This issue is due to a dependency. There is another PR for this [here](https://github.com/marmelroy/PhoneNumberKit/issues/831)
struct Issue119: View {
    var body: some View {
        iPhoneNumberField("Phone Number", text: .constant(""))
            .placeholderColor(Color.red)
    }
}

#Preview {
    Issue119()
        .padding()
}
