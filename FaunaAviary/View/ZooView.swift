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
        NavigationView {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(title)
                                .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                            Text("\(vm.allSpent)$")
                                .foregroundStyle(.grayApp)
                            .font(.system(size: 24, weight: .heavy))
                        }
                        Spacer()
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundStyle(.white)
                        }
                    }.padding()
                    Spacer()
                    
                    //MARK: - Aviary list
                    if vm.aviarys.isEmpty{
                        Text("No enclosures yet").foregroundStyle(.white.opacity(0.6))
                    }else {
                        ScrollView {
                            ForEach(vm.aviarys) { aviary in
                                NavigationLink {
                                    AnimalView(vm: vm, aviary: aviary)
                                } label: {
                                    AviaryCellView(aviary: aviary, vm: vm)
                                }

                            }     
                        }
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {vm.isPresentNewAviary.toggle()}, label: {
                        OrangebuttonView(text: "New aviary")
                    })
                    
                }
                .padding()
            }    
            .animation(.spring, value: vm.aviarys)
            .onAppear(perform: {
                vm.getAllSpent()
            })
            .sheet(isPresented: $vm.isPresentNewAviary, content: {
                NewAviaryView(vm: vm)
        })
        }
    }
}

#Preview {
    ZooView()
}
