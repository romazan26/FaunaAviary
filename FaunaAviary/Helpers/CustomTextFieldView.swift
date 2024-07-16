//
//  CustomTextFieldView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.secon
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
                .font(.title3)
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
        .frame(height: 69)
    }
}

#Preview {
    CustomTextFieldView( text: .constant("Hellow"))
}
