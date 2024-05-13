//
//  ContentView.swift
//  Demo
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 8/8/22.
//

import SwiftUI
import iPhoneNumberField

struct ContentView: View {
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        ZStack {
            Color
                .yellow
                .ignoresSafeArea()
                .onTapGesture { isEditing = false }
            
            iPhoneNumberField(
                "Title",
                text: $text,
                isEditing: $isEditing,
                formatted: true
            ) {
                $0.numberPlaceholderColor = .red
                $0.textColor = .label
                $0.numberPlaceholderColor = .label
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.secondarySystemGroupedBackground))
            )
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
