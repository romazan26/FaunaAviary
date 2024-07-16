//
//  OrangebuttonView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct OrangebuttonView: View {
    var text = ""
    var body: some View {
        ZStack {
            Color.button
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .heavy))
        }
        .frame(width: 335 ,height: 76)
        .cornerRadius(40)
    }
}

#Preview {
    OrangebuttonView()
}
