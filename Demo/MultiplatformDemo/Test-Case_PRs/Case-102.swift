//
//  iPhoneNumberFieldTest.swift
//  Neuro20 PRO (iOS)
//
//  Created by Emil Kaczmarek on 16/05/2024.
//

import iPhoneNumberField
import SwiftUI

struct iPhoneNumberFieldTestView: View {
  var placeholderText: String
  @Binding var mainText: String
  var formX: CGFloat = 0
  var formY: CGFloat = 0
  var textXPos: CGFloat = 16
  var mainForegroundColor: Color = .red
  var cornerRadius: CGFloat = 4
  var disabled: Bool = false
  var borderColor: Color = Color.black

  var body: some View {
    iPhoneNumberField(placeholderText, text: $mainText)
      .autofillPrefix(true)
      .flagHidden(false)
      .flagSelectable(true)
      .prefixHidden(false)
      .maximumDigits(10)
      .clearsOnEditingBegan(true)
      .clearsOnInsert(true)
      .textInputAutocapitalization(.never)
      .disabled(disabled)
      .foregroundColor(mainForegroundColor)
      .overlay(
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(borderColor)
      )
      .frame(200, 200)
      .background(Color.white)
  }
}

struct iPhoneNumberFieldTest: View {
  @State var number: String = ""
  var body: some View {
    iPhoneNumberFieldTestView(placeholderText: "GOTACHA", mainText: $number)
  }
}
