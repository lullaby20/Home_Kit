//
//  DeviceView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 03.02.2023.
//

import SwiftUI

struct DeviceView: View {
    @State var iconName: String
    @State var deviceName: String
    @State var isSelected: Bool
    
    var body: some View {
        if isSelected {
            VStack {
                HStack {
                    Image(iconName + "On")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    Text(deviceName)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding(.leading)
                    
                HStack {
                    Text("On")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color(.systemGray3))
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                
            }
            .frame(width: 115, height: 115)
            .background(.white)
            .cornerRadius(20)
            .onTapGesture {
                withAnimation {
                    isSelected.toggle()
                }
            }
        } else {
            VStack {
                HStack {
                    Image(iconName + "Off")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    Text(deviceName)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.leading)
                    
                HStack {
                    Text("Off")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color(.systemGray3))
                        .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                
            }
            .frame(width: 115, height: 115)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .onTapGesture {
                withAnimation {
                    isSelected.toggle()
                }
            }
        }
    }
}
