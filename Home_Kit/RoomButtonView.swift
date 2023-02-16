//
//  RoomButtonView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 01.02.2023.
//

import SwiftUI

struct RoomButtonView: View {
    @State var icon: String
    @State var roomName: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .black : .white)
                .font(.system(size: 16))
            Text(roomName)
                .foregroundColor(isSelected ? .black : .white)
                .font(.system(size: 16))
                .fontWeight(.medium)
        }
        .frame(width: 140, height: 60)
        .background(isSelected ? .white : .white.opacity(0.2))
        .cornerRadius(20)
    }
}
