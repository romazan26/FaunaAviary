//
//  ZooView.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import SwiftUI

struct ZooView: View {
    @StateObject var vm = AviaryViewModel()
    var title = "STAR ZOO LAND"
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        Text("41.000$")
                            .foregroundStyle(.grayApp)
                        .font(.system(size: 24, weight: .heavy))
                    }
                    Spacer()
                    Image(systemName: "gearshape")
                        .foregroundStyle(.white)
                }.padding()
                Spacer()
                
                //MARK: - Aviary list
                //Text("No enclosures yet").foregroundStyle(.white.opacity(0.6))
                ScrollView {
                    AviaryCellView()
                }
                
                Spacer()
                
                Button(action: {vm.isPresentNewAviary.toggle()}, label: {
                    OrangebuttonView(text: "New aviary")
                })
                
            }
            .padding()
        }
        .sheet(isPresented: $vm.isPresentNewAviary, content: {
            NewAviaryView(vm: vm)
        })
    }
}

#Preview {
    ZooView()
}
