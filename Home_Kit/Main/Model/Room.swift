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
    var devices: [Device]
    
    static var placeholder: [Room] {
        [
            Room(icon: "sofa", roomName: "Living room", devices: [Device(name: "Light", icon: "Light"), Device(name: "Television", icon: "Tv"), Device(name: "Apple Tv", icon: "AppleTV"), Device(name: "Lamp", icon: "Lamp"), Device(name: "Curtains", icon: "Curtains"), Device(name: "Wall Pocket", icon: "Pocket"), Device(name: "Thermostat", icon: "Thermostat"), Device(name: "Fan", icon: "Fan")]),
            Room(icon: "bed.double", roomName: "Bedroom", devices: [Device(name: "Light", icon: "Light"), Device(name: "Rgb Led", icon: "Rgb"), Device(name: "Speaker", icon: "Speaker"), Device(name: "Curtains", icon: "Curtains"), Device(name: "Wall Pocket", icon: "Pocket"), Device(name: "Thermostat", icon: "Thermostat"), Device(name: "Fan", icon: "Fan")]),
            Room(icon: "stove", roomName: "Kitchen", devices: [Device(name: "Light", icon: "Light"), Device(name: "Curtains", icon: "Curtains"), Device(name: "Thermostat", icon: "Thermostat"), Device(name: "Wall Pocket", icon: "Pocket")]),
            Room(icon: "bathtub", roomName: "Bathroom", devices: [Device(name: "Light", icon: "Light"), Device(name: "Thermostat", icon: "Thermostat")])
        ]
    }
}

struct Device: Hashable {
    let id = UUID()
    let name: String
    let icon: String
}
