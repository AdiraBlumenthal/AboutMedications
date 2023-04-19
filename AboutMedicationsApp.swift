//
//  AboutMedicationsApp.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI

@main
struct AboutMedicationsApp: App {
    @Environment(\.scenePhase) var scenePhase
    var medicineVM: MedicineVM
    init() {
        medicineVM = MedicineVM(meds: FileManager.default.getMeds())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(medicineVM)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Background")
                FileManager.default.saveMeds(items: medicineVM.meds)
            }
        }
    }
}
