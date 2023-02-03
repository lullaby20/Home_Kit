//
//  DeviceView.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 03.02.2023.
//

import SwiftUI

struct DeviceView: View {
    var body: some View {
        VStack {
            HStack {
                Image("TvOff")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Spacer()
            }
            .padding(.leading)
        }
        .frame(width: 130, height: 130)
        .background(Color.gray)
        .cornerRadius(20)
    }
}

struct DeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceView()
    }
}
