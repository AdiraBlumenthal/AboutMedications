//
//  CameraText.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/13/23.
//

import Foundation
struct CamText: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var text: String
}
