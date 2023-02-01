//
//  MainViewModel.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 01.02.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var rooms = [Room]()
    
    init() {
        self.rooms = Room.placeholder
    }
}
