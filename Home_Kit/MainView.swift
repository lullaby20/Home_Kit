//
//  ContentView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 31.01.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State var selectedIndex = 0
    @State var isSelected = false
    @State var showSheet = false
    @State var percentage: Float = 38
    func getSliderIcon(device name: String) -> String {
        switch name {
        case "Television", "Speaker", "AppleTv":
            return "speaker.wave.2.fill"
        case "Light", "Lamp", "Rgb Led":
            return "lightbulb.fill"
        case "Fan", "Wall Pocket":
            return "bolt.fill"
        case "Thermostat":
            return "thermometer.medium"
        case "Curtains":
            return "curtains.closed"
        default:
            return "Unknown"
        }
    }
    
    @State var sliderIcon = ""
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGray3))
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    .padding(.bottom, -15)

                HStack {
                    Text("My Home")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 27))
                        .padding(.bottom, 7)
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
                                RoomButtonView(icon: viewModel.rooms[index].icon, roomName: viewModel.rooms[index].roomName, isSelected: index == selectedIndex)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            selectedIndex = index
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
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.rooms[selectedIndex].devices, id: \.self) { device in
                        DeviceView(iconName: device.icon, deviceName: device.name, isSelected: isSelected)
                            .contextMenu {
                                Button(action: {
                                    sliderIcon = getSliderIcon(device: device.name)
                                    showSheet = true
                                }, label: {
                                    Label(device.name + " Details", systemImage: "gear")
                                })
                            }
                            .sheet(isPresented: $showSheet) {
                                ZStack {
                                    Color("BackgroundGray")
                                        .ignoresSafeArea()
                                    
                                    CustomView(percentage: $percentage, sliderIcon: sliderIcon)
                                        .frame(width: 300, height: 100)
                                        .rotationEffect(Angle(degrees: -90))
                                    .presentationDetents([.large, .medium])
                                }
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
