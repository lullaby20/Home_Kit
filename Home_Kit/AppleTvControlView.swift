//
//  AppleTvControlView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 10.02.2023.
//

import SwiftUI

struct AppleTvControlView: View {
    @State var tvs = ["YouTube", "Twitch", "Netflix", "National Geographic"]
    @State var selectedTv = "YouTube"
    @State var isVolumeOn = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Picker("Choose a TV", selection: $selectedTv) {
                    ForEach(tvs, id: \.self) { tv in
                        Text(tv)
                    }
                }
                
                HStack {
                    if isVolumeOn {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .onTapGesture {
                                isVolumeOn.toggle()
                            }
                    } else {
                        Image(systemName: "speaker.slash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .onTapGesture {
                                isVolumeOn.toggle()
                            }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "list.dash")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "power")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    Text("Searching...")
                        .foregroundColor(.gray)
                        .font(.system(size: 18))
                        .padding(.top, 5)
                }
                .frame(width: UIScreen.main.bounds.width * 0.97, height: 470)
                .background(Color("CustomGray"))
                .cornerRadius(40)
                .padding(.vertical, 15)
                
                HStack {
                    VStack {
                        Image(systemName: "tv")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(15)
                            .background {
                                Circle()
                                    .foregroundColor(Color("CustomGray"))
                            }
                        
                        Image(systemName: "playpause.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 19))
                            .padding(15)
                            .background {
                                Circle()
                                    .foregroundColor(Color("CustomGray"))
                            }
                            .padding(.top, 5)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                            .padding(45)
                            .background {
                                Circle()
                                    .foregroundColor(Color("CustomGray"))
                            }
                    }
                    
                    Spacer()

                    VStack {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.white)
                        Text("CH")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(.vertical, 20)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                    .padding(20)
                    .background {
                        Rectangle()
                            .foregroundColor(Color("CustomGray"))
                            .cornerRadius(45)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .presentationDetents([.large])
    }
}
    
    struct AppleTvControlView_Previews: PreviewProvider {
        static var previews: some View {
            AppleTvControlView()
        }
    }
