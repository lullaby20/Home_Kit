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
    @State var isSelected = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .white : .black)
                .frame(width: 70, height: 70)
                .background(isSelected ? Color("SelectedColor") : Color("CustomGray"))
                .cornerRadius(15)
                .onTapGesture {
                    withAnimation {
                        isSelected.toggle()
                    }
                }
            
            Text(roomName)
                .font(.system(size: 14))
        }
        .frame(width: 80, height: 95)
    }
}
