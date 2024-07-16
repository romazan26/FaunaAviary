//
//  CreateTitleZooView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct CreateTitleZooView: View {
    @StateObject var vm = ZooViewModel()
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            if !vm.zoos.isEmpty{
                VStack{
                    Spacer()
                    Text("Welcom to \(vm.zoos.first?.titleZoo ?? "")")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    Spacer()
                    Button(action: {vm.isPresentZoo.toggle()}, label: {
                        OrangebuttonView(text: "Jogin")
                    })
                }.padding()
            }else{
                VStack(){
                    
                    //MARK: - Toolbar
                    HStack {
                        Text("CREATE TITLE")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                        Spacer()
                    }.padding()
                    
                    //MARK: - Zoo title
                    CustomTextFieldView(placeholder: "Zoo title", text: $vm.simpleZooTitle)
                        .frame(width: 335)
                        .focused($keyboardIsFocused)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        vm.addZoo()
                        vm.isPresentZoo.toggle()
                    }, label: {
                        OrangebuttonView(text: "Begin")
                    })
                }.padding()
            }
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
        .fullScreenCover(isPresented: $vm.isPresentZoo, content: {
            ZooView(title: vm.zoos.first?.titleZoo ?? "")
        })
    }
}

#Preview {
    CreateTitleZooView()
}
