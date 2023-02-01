//
//  ContentView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 31.01.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your smart home")
                    .font(.system(size: 16))
                    .frame(width: UIScreen.main.bounds.width * 0.915, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.rooms.indices, id: \.self) { index in
                            RoomButtonView(icon: viewModel.rooms[index].icon, roomName: viewModel.rooms[index].roomName, isSelected: index == selectedIndex)
                                .onTapGesture {
                                    withAnimation() {
                                        selectedIndex = index
                                    }
                                }
                        }
                    }
                    .padding(.leading)
                }
                
                Text("Devices")
                    .font(.title3)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width * 0.915, alignment: .leading)
                    .padding(.top, 15)
                
                Spacer()
            }
            .navigationTitle("Hi ALQ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
