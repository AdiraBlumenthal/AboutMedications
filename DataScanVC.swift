//
//  DataScanVC.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/1/23.
//

import SwiftUI
import VisionKit

struct DataScanVC: UIViewControllerRepresentable{
    @Binding var scannedText: String
    @Binding var liveScan: Bool
    @Binding var isScanned: Bool
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(
            recognizedDataTypes: [.text()],
            qualityLevel: .balanced,
            isHighlightingEnabled: true)
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if liveScan {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
            isScanned = true
        }
        
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScanVC
        init(parent: DataScanVC) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                parent.scannedText = text.transcript
                parent.liveScan = false
                
            default:
                break
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
