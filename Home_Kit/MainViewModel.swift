//
//  MainViewModel.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 01.02.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var rooms = [Room]()
    @Published var selectedIndex = 0
    @Published var isSelected = false
    @Published var showSheet = false
    @Published var percentage: Float = 38
    @Published var sliderIcon = ""
    @Published var currentDeviceName = ""
    
    func getSliderIcon(device name: String) -> String {
        switch name {
        case "Television", "Speaker", "Apple Tv":
            return "speaker.wave.2.fill"
        case "Light", "Lamp", "Rgb Led":
            return "lightbulb.fill"
        case "Fan", "Wall Pocket":
            return "bolt.fill"
        case "Thermostat":
            return "thermometer.medium"
        case "Curtains":
            return "curtains.closed"
        default:
            return "Unknown"
        }
    }
    
    init() {
        self.rooms = Room.placeholder
    }
}
