//
//  ContentView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var medicineVM: MedicineVM
    
    var body: some View {
        TabView{
            SettingsView()
                
                .tabItem{
                    Label("Settings", systemImage: "gearshape.2.fill")
                }
            MedicationsView()
                
                .tabItem{
                    Label("My Medications", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MedicineVM(meds: [Med]()))
    }
}
