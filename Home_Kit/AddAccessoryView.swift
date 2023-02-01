//
//  AddAccessoryView.swift
//  Home_Kit
//
//  Created by Didar Akbergen on 01.02.2023.
//

import SwiftUI

struct AddAccessoryView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("Wallpaper")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 10)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    
                    VStack {
                        Text("Add Accssory")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 90)
                            .padding(.trailing, 40)
                    }
                    .frame(maxWidth: 168, minHeight: 147)
                    .background(Color("CustomGray"))
                    .cornerRadius(16)
                    .padding(.bottom, 500)
                    .padding(.trailing, 200)
                    .navigationTitle("My Home")
                }
            }
        }
    }
    }

struct AddAccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccessoryView()
    }
}
