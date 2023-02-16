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
        VStack {
            HStack {
                Image(iconName + (isSelected ? "On" : "Off"))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .opacity(isSelected ? 1 : 0.5)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 10)
            
            Spacer()
            
            HStack {
                Text(deviceName)
                    .foregroundColor(isSelected ? .black : .white)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .opacity(isSelected ? 1 : 0.5)
                
                Spacer()
            }
            .padding(.leading)
                
            HStack {
                Text(isSelected ? "On" : "Off")
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
        .background(isSelected ? .white : .white.opacity(0.2))
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                isSelected.toggle()
            }
        }
    }
}
