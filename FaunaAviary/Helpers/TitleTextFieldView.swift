//
//  TitleTextFieldView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct TitleTextFieldView: View {
    var placeholder = ""
    var alignment: TextAlignment = .center
    var stackAlignment: Alignment = .center
    @Binding var text: String
    var body: some View {
        ZStack(alignment: stackAlignment) {
            Color.main
            if text.isEmpty {
                Text(placeholder)
                    .multilineTextAlignment(alignment)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .multilineTextAlignment(alignment)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(12)
        .frame(height: 69)
    }
}

#Preview {
    TitleTextFieldView(text: .constant(""))
}
