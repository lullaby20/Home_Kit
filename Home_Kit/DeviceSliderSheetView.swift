//
//  DeviceSliderSheetView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 07.02.2023.
//

import SwiftUI

struct DeviceSliderSheetView: View {
    @Binding var percentage: Float
    @State var sliderIcon: String
    @State var deviceName: String
    @State var sliderColor: Color = .white
    let colors: [Color] = [.red, .green, .blue, .purple, .pink, .orange, .yellow, .mint]
    
    var body: some View {
        ZStack {
            Color("BackgroundGray")
                .ignoresSafeArea()
                
            HStack {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.gray)
                        Rectangle()
                            .foregroundColor(sliderColor)
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
                .frame(width: 300, height: 100)
                .rotationEffect(Angle(degrees: -90))
                
                if deviceName == "Rgb Led" {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(colors, id: \.self) { color in
                            Rectangle()
                                .foregroundColor(color)
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)
                                .onTapGesture {
                                    sliderColor = color
                                }
                        }
                    }
                    .padding(.leading, -70)
                    .padding(.trailing, 20)
                }
            }
            .presentationDetents([.large, .medium])
        }
    }
}
