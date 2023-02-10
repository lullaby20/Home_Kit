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
        if isSelected {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Text(roomName)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
            }
            .frame(width: 140, height: 60)
            .background(.white)
            .cornerRadius(20)
        } else {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                Text(roomName)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .frame(width: 140, height: 60)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
}
