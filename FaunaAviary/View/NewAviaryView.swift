//
//  NewAviaryView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct NewAviaryView: View {
    @StateObject var vm: AviaryViewModel
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - ToolBar
                HStack {
                    Button(action: {}, label: {
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
                
                Spacer()
                Button(action: {}, label: {
                    OrangebuttonView(text: "Save aviary")
                })
            }.padding()
        }
    }
}

#Preview {
    NewAviaryView(vm: AviaryViewModel())
}
