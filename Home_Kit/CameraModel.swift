//
//  CameraModel.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 09.02.2023.
//

import Foundation
import AVFoundation

class CameraModel: ObservableObject {
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    func Check() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUp() {
        do {
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            self.session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
}
