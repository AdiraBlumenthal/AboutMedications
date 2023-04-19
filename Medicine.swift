//
//  Medicine.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/20/23.
//

import Foundation

struct Med: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var dose: String?
    var type: String?
    var instruction: String
    var scanned: String?
}
