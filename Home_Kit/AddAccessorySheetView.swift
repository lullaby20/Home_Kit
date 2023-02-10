//
//  AddAccessorySheetView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 10.02.2023.
//

import SwiftUI

struct AddAccessorySheetView: View {
    @StateObject var camera = CameraModel()
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowing = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 19))
                }
            }
            .padding(.top)
            .padding(.trailing, 20)
            
            Text("Add Accessory")
                .foregroundColor(.black)
                .font(.system(size: 27))
                .fontWeight(.bold)
                .padding(.top, -10)
            VStack {
                Text("Scan code or hold iPhone near the")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                HStack {
                    Text("accessory.")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                    Text("More options...")
                        .foregroundColor(.orange)
                        .font(.system(size: 14))
                        .padding(.leading, -3)
                }
            }
            .padding(.bottom, 10)
            
            CameraPreview(camera: camera)
                .frame(width: 300, height: 200)
                .cornerRadius(15)
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "qrcode")
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .padding(.trailing)
                    .padding(.bottom, 55)
                
                VStack {
                    Text("Scan a Setup Code")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 230, alignment: .leading)
                    Text("Look for a QR code on the accessory, packaging or instructions, and position it in the camera frame above.")
                        .font(.system(size: 14))
                        .frame(width: 230, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "wave.3.right")
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .padding(.trailing, 18)
                    .padding(.bottom, 35)
                
                VStack {
                    Text("Hold iPhone Near Accessory")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 225, alignment: .leading)
                    Text("You can also hold iPhone near this symbol if it appears on the accessory.")
                        .font(.system(size: 14))
                        .frame(width: 225, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom)
        }
        .background(Color.white)
        .onAppear(perform: {
            camera.Check()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
