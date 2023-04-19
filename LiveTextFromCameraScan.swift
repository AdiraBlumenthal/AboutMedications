//
//  LiveTextFromCameraScan.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/1/23.
//

import SwiftUI

struct LiveTextFromCameraScan: View {
    @Environment(\.dismiss) var dismiss
    @Binding var liveScan: Bool
    @Binding var scannedText: String
    @Binding var isScanned: Bool
    var body: some View {
        NavigationStack{
            VStack{
                DataScanVC(scannedText: $scannedText, liveScan: $liveScan, isScanned: $isScanned)
                Text("Capture Text: Aim camera at text. Tap to scan.")
                Button("Cancel"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .padding()
            }
            .padding()
            .navigationTitle("Capture Text")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct LiveTextFromCameraScan_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextFromCameraScan(liveScan: .constant(false), scannedText: .constant(""), isScanned: .constant(false))
    }
}
