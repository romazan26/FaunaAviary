//
//  newAnimalView.swift
//  FaunaAviary
//
//  Created by Роман on 21.07.2024.
//

import SwiftUI

struct NewAnimalView: View {
    @Binding var titleAnimal: String
    @Binding var countAnimal: String
    var placeholder = ""
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
            
            //MARK: - title  animal
            CustomTextFieldView(placeholder: placeholder, text: $titleAnimal)
                .font(.system(size: 16, weight: .heavy))
            
            //MARK: - count animal
            ZStack{
                Circle()
                    .foregroundStyle(.main)
                    .frame(width: 32, height: 32)
                TextField("0", text: $countAnimal)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .heavy))
                    .keyboardType(.numberPad)
                    .frame(width: 32, height: 32)
            }.padding(.horizontal)
        }
    }
}

#Preview {
    NewAnimalView(titleAnimal: .constant(""), countAnimal: .constant(""), placeholder: "Animal 1")
}
