//
//  ContentView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 31.01.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGray3))
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    .padding(.bottom, -15)
                    .padding(.top, 35)

                HStack {
                    Text("My Home")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    NavigationLink(destination: AddAccessoryView()) {
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9)
                
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
                                RoomButtonView(icon: viewModel.rooms[index].icon, roomName: viewModel.rooms[index].roomName, isSelected: index == viewModel.selectedIndex)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            viewModel.selectedIndex = index
                                            scrollview.scrollTo(index, anchor: .center)
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
                
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())]) {
                    ForEach(viewModel.rooms[viewModel.selectedIndex].devices, id: \.self) { device in
                        DeviceView(iconName: device.icon, deviceName: device.name, isSelected: viewModel.isSelected)
                            .contextMenu {
                                Button(action: {
                                    viewModel.sliderIcon = viewModel.getSliderIcon(device: device.name)
                                    viewModel.currentDeviceName = device.name
                                    viewModel.showSheet = true
                                }, label: {
                                    Label(device.name + " Details", systemImage: "gear")
                                })
                            }
                            .sheet(isPresented: $viewModel.showSheet) {
                                DeviceSliderSheetView(percentage: $viewModel.percentage, sliderIcon: viewModel.sliderIcon, deviceName: viewModel.currentDeviceName)
                            }
                    }
                }
                .padding(.horizontal, 15)
                
                Spacer()
            }
            .background(content: {
                LinearGradient(colors: [Color("BackgroundPurple"), .gray, Color("BackgroundBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
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
