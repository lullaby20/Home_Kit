//
//  CameraPreview.swift
//  Home_Kit
//
//  Created by Daniyar Merekeyev on 09.02.2023.
//

import Foundation
import AVFoundation
import SwiftUI

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 200)))
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
