//
//  Room.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 01.02.2023.
//

import Foundation

struct Room: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let roomName: String
    
    static var placeholder: [Room] {
        [
            Room(icon: "sofa", roomName: "Living room"),
            Room(icon: "bed.double", roomName: "Bedroom"),
            Room(icon: "stove", roomName: "Kitchen"),
            Room(icon: "bathtub", roomName: "Bathroom")
        ]
    }
}
