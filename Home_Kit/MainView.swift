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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.green]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGray3))
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                HStack {
                    Text("My Home")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 160)
                    
                    Spacer()
                    
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 27))
                        .padding(.trailing)
                        .padding(.bottom, 7)
                }
                
                Divider()
                    .overlay(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                
                Text("Rooms")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    .padding(.top, 10)
                
                ScrollViewReader { scrollview in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.rooms.indices, id: \.self) { index in
                                RoomButtonView(icon: viewModel.rooms[index].icon, roomName: viewModel.rooms[index].roomName, isSelected: index == selectedIndex)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            selectedIndex = index
                                            scrollview.scrollTo(index)
                                        }
                                    }
                            }
                        }
                        .padding(.leading)
                    }
                }
                
                Text("Devices")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    .padding(.top, 30)
                
                ForEach(viewModel.rooms[selectedIndex].devices, id: \.self) { device in
                    Text(device.name)
                }
                
                Spacer()
            }
            .background(content: {
                LinearGradient(colors: [Color("BackgroundPurple"), Color("BackgroundBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
