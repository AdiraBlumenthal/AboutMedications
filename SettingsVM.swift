//
//  SettingsVM.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import Foundation
class AccessSettingsVM: ObservableObject{
    @Published var accessSettings: AccessSettings
    init(accessSettings: AccessSettings) {
        self.accessSettings = accessSettings
    }
}
