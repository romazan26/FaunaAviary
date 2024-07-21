//
//  NewAviaryView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct NewAviaryView: View {
    @StateObject var vm: AviaryViewModel
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - ToolBar
                HStack {
                    Button(action: {vm.isPresentNewAviary.toggle()}, label: {
                        Text("Back")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .heavy))
                    })
                    
                    Spacer()
                    
                    TitleTextFieldView(placeholder: "New aviary", text: $vm.simpleTitleAviary)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, -25)
                        .frame(width: 220)
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .foregroundStyle(.grayApp)
                }
                
                //MARK: - TextField group
                ScrollView {
                    
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal1,
                                      countAnimal: $vm.simpleCountAnimal1,
                                      placeholder: "Animal 1")
                    
                    if vm.textFieldTag > 1 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal2,
                                      countAnimal: $vm.simpleCountAnimal2,
                                      placeholder: "Animal 2")
                    }
                    if vm.textFieldTag > 2 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal3,
                                      countAnimal: $vm.simpleCountAnimal3,
                                      placeholder: "Animal 3")
                    }
                    if vm.textFieldTag > 3 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal4,
                                      countAnimal: $vm.simpleCountAnimal4,
                                      placeholder: "Animal 4")
                    }
                    if vm.textFieldTag > 4 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal5,
                                      countAnimal: $vm.simpleCountAnimal5,
                                      placeholder: "Animal 5")
                    }
                    if vm.textFieldTag > 5 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal6,
                                      countAnimal: $vm.simpleCountAnimal6,
                                      placeholder: "Animal 6")
                    }
                    if vm.textFieldTag > 6 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal7,
                                      countAnimal: $vm.simpleCountAnimal7,
                                      placeholder: "Animal 7")
                    }
                    if vm.textFieldTag > 7 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal8,
                                      countAnimal: $vm.simpleCountAnimal8,
                                      placeholder: "Animal 8")
                    }
                    if vm.textFieldTag > 8 {
                        NewAnimalView(titleAnimal: $vm.simpleTitleAnimal9,
                                      countAnimal: $vm.simpleCountAnimal9,
                                      placeholder: "Animal 9")
                    }
                    
                    //MARK: - oneMore Task button
                    if vm.textFieldTag < 9{
                        Button(action: {
                            if vm.textFieldTag < 9{
                                vm.textFieldTag += 1
                            }
                        }, label: {
                            ZStack {
                                Color.main
                                Text("+").foregroundStyle(.white)
                            }
                        })
                        .frame(width: 356, height: 63)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white.opacity(0.3), lineWidth: 2)
                        }
                    }
                    
                }.focused($keyboardIsFocused)
                
                Spacer()
                
                //MARK: - Spent on animals
                VStack (alignment: .leading){
                    Text("Spent on animals")
                        .foregroundStyle(.grayApp)
                        .font(.system(size: 16, weight: .heavy))
                        .padding(.horizontal)
                    HStack {
                        TitleTextFieldView(placeholder: "0$", 
                                           alignment: .leading,
                                           stackAlignment: .leading,
                                           text: $vm.simpleSpentOnAnimals)
                        Spacer()
                        
                        Image(systemName: "pencil")
                            .foregroundStyle(.grayApp)
                    }
                }
                .padding(.bottom)
                
                //MARK: - Save button
                Button(action: {
                    vm.addAviary()
                    vm.isPresentNewAviary.toggle()
                }, label: {
                    OrangebuttonView(text: "Save aviary")
                })
            }.padding()
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {
    NewAviaryView(vm: AviaryViewModel())
}
