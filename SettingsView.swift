//
//  SettingsView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    
    var body: some View {
        let captions = Binding<Bool>(get: {self.ASLwithCaptions}, set: {self.ASLwithCaptions = $0; self.transcript = false})
        let trans = Binding<Bool>(get: {self.transcript}, set: {self.transcript = $0; self.ASLwithCaptions = false})
        
        Form{
            Section("Accessibility Settings"){
                Toggle(isOn: $ASL, label:{
                    if colorScheme == .light{
                        HStack{
                            Image("interpreter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            Text("ASL")
                        }
                    } else{
                        HStack{
                            Image("interpret")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            Text("ASL")
                        }
                    }
                })
                if ASL{
                    Toggle(isOn: captions, label: {
                        HStack{
                            Image("cc")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            Text("Add Captions")
                        }
                    })
                    Toggle(isOn: trans, label:{
                        HStack{
                            Image(systemName: "doc.plaintext")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            Text("Add Transcript")
                        }
                    })
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
