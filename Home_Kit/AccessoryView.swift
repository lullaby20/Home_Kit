//
//  AccessoryView.swift
//  Home_Kit
//
//  Created by Tolegen Erkin on 03.02.2023.
//

import SwiftUI

struct AccessoryView: View {
    @State private var isUppercase = false
    var body: some View {
        NavigationView {
                HStack {
                    VStack {
                        Button(action:  {
                            print("procent")
                        }, label: {
                            Toggle("", isOn: $isUppercase)
                                .font(.system(size: 20))
                                .frame(width: 70)
                                .padding(.leading, -70)
                                .padding(.top, 10)
                           
                            
                            
                        })
                        
                        HStack {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 20))
                                .padding(.leading)
                                .foregroundColor(Color.black)
                            Text("98%")
                                .font(.system(size: 40))
                                .padding(.leading)
                                .foregroundColor(Color.black)
                        }
                        .padding(.top, 50)
                        
                        Spacer()
                        
                    }
                    Spacer()
                }
                .navigationTitle("Amazon Echo Dot 3")
                
                
            }
            
        }
    }
    
    struct AccessoryView_Previews: PreviewProvider {
        static var previews: some View {
            AccessoryView()
        }
    }
