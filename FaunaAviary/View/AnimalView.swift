//
//  AnimalView.swift
//  FaunaAviary
//
//  Created by Роман on 21.07.2024.
//

import SwiftUI

struct AnimalView: View {
    @StateObject var vm: AviaryViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardIsFocused: Bool
    let aviary: Aviary
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack{
                //MARK: - ToolBar
                HStack {
                    Button(action: {dismiss()}, label: {
                        Text("Back")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .heavy))
                    })
                    
                    Spacer()
                    TitleTextFieldView(placeholder: "",
                                       alignment: .center,
                                       stackAlignment: .center,
                                       text: $vm.simpleTitleAviary)
                    .focused($keyboardIsFocused)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .heavy))
                    .padding(.leading, -30)
                    .frame(width: 220)

                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .foregroundStyle(.grayApp)
                }
                if let animals = aviary.animals?.allObjects as? [Animal]{
                    ScrollView {
                        ForEach(animals) { animal in
                            AnimalCellView(animal: animal, vm: vm)
                        }
                    }.padding(.top)
                }
                
                Spacer()
                //MARK: - Spent on animals
                VStack (alignment: .leading, spacing: 10){
                    Text("Spent on animals")
                        .foregroundStyle(.grayApp)
                        .font(.system(size: 16, weight: .heavy))
                        .padding(.leading, 20)
            
                    HStack {
                        TitleTextFieldView(alignment: .leading, stackAlignment: .leading, text: $vm.simpleSpentOnAnimals)
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                            .focused($keyboardIsFocused)
                            .keyboardType(.numberPad)
                        Spacer()
                        
                        Image(systemName: "pencil")
                            .foregroundStyle(.grayApp)
                    }
                }
                .padding(.bottom)
                
                //MARK: - Save button
                Button(action: {
                    vm.updataAviary(with: aviary.id)
                    dismiss()
                }, label: {
                    OrangebuttonView(text: "Save aviary")
                })
            }
            .onAppear(perform: {
                vm.fillData(aviary: aviary)
            })
            .padding()
            .navigationBarBackButtonHidden()
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
            
    }
}

#Preview {
    AnimalView(vm: AviaryViewModel(), aviary: Aviary())
}
