//
//  SettingsView.swift
//  FaunaAviary
//
//  Created by Роман on 21.07.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack{
                //MARK: - Toolbar
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 21, height: 20)
                            .foregroundStyle(.white)
                    }
                    
                }.padding()
                
                Spacer()
                //MARK: - Share App Button
                Button(action: {isPresentShare.toggle()}, label: {
                    SettingsButtonView(text: "SHARE APP", imageName: "square.and.arrow.up")
                })
                
                
                //MARK: - Rate App Button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    SettingsButtonView(text: "RATE APP", imageName: "star.fill")
                }
                
                //MARK: - Privacy button
                Button(action: {isPresentPolicy.toggle()}, label: {
                    SettingsButtonView(text: "PRIVACY POLICY", imageName: "line.diagonal.arrow")
                })
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: "https://google.com")!)
        })
    }
}

#Preview {
    SettingsView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


#Preview {
    SettingsView()
}
