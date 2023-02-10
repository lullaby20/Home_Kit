//
//  AddAccessoryView.swift
//  Home_Kit
//
//  Created by Didar Akbergen on 01.02.2023.
//

import SwiftUI

struct AddAccessoryView: View {
    @State var isShowing = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("My Home")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 5)
                    
                    Spacer()
                }
                
                Button {
                    isShowing.toggle()
                } label: {
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.system(size: 23))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(.black.opacity(0.3))
                                    .cornerRadius(30)
                                    .padding(.leading, 10)
                                    .padding(.top, 10)
                                
                                Spacer()
                            }
                            Spacer()
                            
                            Text("Add Accessory")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .frame(width: 160, alignment: .leading)
                                .padding(.leading, 15)
                                .padding(.bottom, 10)
                        }
                        .frame(width: 170, height: 150)
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        
                        Spacer()
                    }
                }
                .sheet(isPresented: $isShowing) {
                    ZStack {
                        Color.white
                            .ignoresSafeArea()
                        
                        AddAccessorySheetView(isShowing: $isShowing)
                            .presentationDetents([.height(530)])
                    }
                }
                
                Spacer()
            }
            .background(content: {
                LinearGradient(colors: [Color("BackgroundPurple"), .gray, Color("BackgroundBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            })
        }
    }
}

struct AddAccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccessoryView()
    }
}
