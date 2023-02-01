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
                }
                    
                    VStack {
                        HStack {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 23))
                                .padding(.leading, 10)
                                .padding(.top, 10)
                            
                            Spacer()
                        }
                        Spacer()
                        
                        Text("Add Accessory")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(width: 160, alignment: .leading)
                            .padding(.leading, 15)
                            .padding(.bottom, 10)
                    }
                    .frame(width: 170, height: 150)
                    .background(Color("CustomGray"))
                    .cornerRadius(16)
                    .padding(.leading, 15)
                    
                    .navigationTitle("My Home")
                }
            }
        }
    }

struct AddAccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccessoryView()
    }
}
