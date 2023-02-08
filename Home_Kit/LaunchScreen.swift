//
//  LaunchScreen.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 08.02.2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.1
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Image("appIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 60)
                    .opacity(size)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
