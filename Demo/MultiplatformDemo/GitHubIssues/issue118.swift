import SwiftUI
import iPhoneNumberField

struct Issue118: View {
    @State private var phoneNumber = ""
    @State private var selectedCountry: String = "US"

    var body: some View {
        iPhoneNumberField("Phone Number", text: $phoneNumber)
            .flagSelectable(true)
            .defaultRegion(selectedCountry)
            .formatted(true)
            .prefixHidden(false)
            .flagHidden(false)
    }
}

#Preview {
    Issue118()
        .padding()
}
