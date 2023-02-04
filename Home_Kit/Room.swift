//
//  Room.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 01.02.2023.
//

import Foundation

struct Room: Identifiable, Hashable {
    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(roomName)
    }
    
    let id = UUID()
    let icon: String
    let roomName: String
    let devices: [Device]
    
    static var placeholder: [Room] {
        [
            Room(icon: "sofa", roomName: "Living room", devices: [Device(name: "Light", icon: "Light"), Device(name: "Television", icon: "Tv"), Device(name: "Apple Tv", icon: "AppleTV")]),
            Room(icon: "bed.double", roomName: "Bedroom", devices: [Device(name: "Light", icon: "Light"), Device(name: "Rgb led", icon: "Rgb")]),
            Room(icon: "stove", roomName: "Kitchen", devices: [Device(name: "Light", icon: "Light")]),
            Room(icon: "bathtub", roomName: "Bathroom", devices: [Device(name: "Light", icon: "Light")])
        ]
    }
}

struct Device: Hashable {
    let id = UUID()
    let name: String
    let icon: String
}
