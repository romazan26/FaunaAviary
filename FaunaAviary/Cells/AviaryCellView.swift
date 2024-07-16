//
//  AviaryCellView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct AviaryCellView: View {
    var body: some View {
        ZStack {
            Color.secon
            HStack {
                VStack(alignment: .leading) {
                    Text("Tiger enclosure")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                    Text("4 animals")
                        .foregroundStyle(.grayApp)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                ZStack{
                    Color.main
                    Text("14.000$")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                }
                .frame(width: 91, height: 32)
                .cornerRadius(36)
                Button(action: {}, label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.white)
                })
            }.padding()
        }
        .frame(width: 335, height: 72)
        .cornerRadius(21)
    }
}

#Preview {
    AviaryCellView()
}
