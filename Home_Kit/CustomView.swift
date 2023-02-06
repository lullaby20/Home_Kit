//
//  CustomView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 04.02.2023.
//

import SwiftUI

struct CustomView: View {

    @Binding var percentage: Float
    @State var sliderIcon: String

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
                
                Image(systemName: sliderIcon)
                    .foregroundColor(.black.opacity(0.3))
                    .font(.system(size: 25))
                    .rotationEffect(Angle(degrees: 90))
                    .padding(.leading, 30)
            }
            .cornerRadius(30)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}

