//
//  AnimalCellView.swift
//  FaunaAviary
//
//  Created by Роман on 21.07.2024.
//

import SwiftUI

struct AnimalCellView: View {
    let animal: Animal
    @StateObject var vm: AviaryViewModel
    var body: some View {
        ZStack {
            Color.secon
            HStack {
              
                    //MARK: - title aviary
                    Text(animal.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                
                Spacer()
                
                //MARK: - Count on animals
                ZStack{
                    Circle()
                        .foregroundStyle(.main)
                    Text("\(animal.count)")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                }
                .frame(width: 32)
                
                //MARK: - Delete aviary button
                Button(action: {vm.deleteAnimal(with: animal.id)}, label: {
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
    AnimalCellView(animal: Animal(), vm: AviaryViewModel())
}
