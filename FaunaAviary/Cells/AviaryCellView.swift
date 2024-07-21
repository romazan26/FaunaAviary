//
//  AviaryCellView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct AviaryCellView: View {
    let aviary: Aviary
    @StateObject var vm: AviaryViewModel
    var body: some View {
        ZStack {
            Color.secon
            HStack {
                VStack(alignment: .leading) {
                    
                    //MARK: - title aviary
                    Text(aviary.nameAviary ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                    //MARK: - count animal
                    if let animals = aviary.animals?.allObjects as? [Animal]{
                        Text("\(animals.count) animals")
                            .foregroundStyle(.grayApp)
                            .font(.system(size: 16))
                    }
                }
                
                Spacer()
                
                //MARK: - Spent on animals
                ZStack{
                    Color.main
                    Text("\(aviary.spentOnAnimals)$")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                }
                .frame(width: 91, height: 32)
                .cornerRadius(36)
                
                //MARK: - Delete aviary button
                Button(action: {vm.deleteAviary(with: aviary.id)}, label: {
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
    AviaryCellView(aviary: Aviary(), vm: AviaryViewModel())
}
