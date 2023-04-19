//
//  AddDrugInstructions.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/20/23.
//

import SwiftUI
import VisionKit
import CTScanText

struct AddDrugInstructions: View {
    @EnvironmentObject var medicineVM: MedicineVM
        @Environment(\.dismiss) var dismiss
        @State var alert = false
        @State var scannedText = ""
        @State var liveScan = false
        @FocusState var focusState: Bool
        @State var isScanned = false
    @State var showAlert = false
    
    @AppStorage("selectedMedication") var selectedMedication = ""
    @AppStorage("selectedInstructions") var selectedInstructions = ""
    @AppStorage("inputMethod") var inputMethod = ""
    //
    var meds = ["Metformin", "Atorvastatin"]
    var inputs = ["Select Instructions", "Scan Instructions"]
    var instructionsList = ["Take 1 tablet daily", "Take 1 tablet twice a day"]
    enum MedType: String, CaseIterable, Identifiable{
        case metformin = "Metformin", atorvastatin = "Atorvastatin"
        var id: RawValue{
            self.rawValue
        }
    }
    @State private var instructions: [MedType: String] = [.metformin: "", .atorvastatin: ""]
    
    enum InputType: String, CaseIterable, Identifiable{
        case select = "Select", scan = "Scan"
        var id: RawValue{
            self.rawValue
        }
    }
    @State private var input: [InputType: String] = [.select: "", .scan: ""]
    
    var body: some View {
        NavigationView{
            Form{
                Section("Add instructions"){
                    Picker("Select medication", selection: $selectedMedication){
                        ForEach(meds, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu)
                    
                    Picker("Select input method", selection: $inputMethod){
                        ForEach(inputs, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu)
                    
                }
                if inputMethod == "Select Instructions"{
                    Picker("Select instructions", selection: $selectedInstructions){
                        ForEach(instructionsList, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                } else if inputMethod == "Scan Instructions"{
                    
                    
                    Section{
                        VStack{
                            ScanTextEditor("Enter or scan medication instructions", text: $scannedText)
                                .frame(height: 120)
                            //                        Spacer()
                            //                        if DataScannerViewController.isSupported{
                            //                            Button(action:{
                            //                                liveScan.toggle()
                            //                                focusState = false
                            //                            } ,label: {
                            //                                HStack{
                            //                                    Text("Scan Instructions from Camera")
                            //                                    Image(systemName: "camera")
                            //                                }
                            //                            })
                            //
                            //                        } else {
                            //                            Text("Does not support Live Text from camera scan")
                            //                        }
                        }
                    } header: {
                        if scannedText != ""{
                            Text("Edit Scanned Instructions").bold()
                                .font(.title3)
                        }
                    }
                }
                
                Section{
                    HStack{
                        Spacer()
                        Button("Save"){
                            alert = true
                        }.actionSheet(isPresented: $alert){
                            ActionSheet(
                                title: Text("Are you sure you want to update medication instructions?"),
                                buttons: [
                                    .cancel(){
                                    },
                                    .destructive(Text("Save")){
                                        if inputMethod == "Scan Instructions"{
                                            selectedInstructions = ""
                                        }
                                        if medicineVM.meds.count == 0{
                                            medicineVM.add(name: selectedMedication, dose: dosage, type: medType, instruction: selectedInstructions, scanned: scannedText, index: 0)
                                        } else if medicineVM.meds.count == 1{
                                            if selectedMedication == medicineVM.meds[0].name{
                                                medicineVM.replace(name: selectedMedication, dose: dosage, type: medType, instruction: selectedInstructions, scanned: scannedText, index: 0)
                                                alert = true
                                            } else{
                                                medicineVM.add(name: selectedMedication, dose: dosage, type: medType, instruction: selectedInstructions, scanned: scannedText, index: 0)
                                            }
                                        } else {
                                            if let i = meds.firstIndex(of: selectedMedication){
                                                medicineVM.replace(name: selectedMedication, dose: dosage, type: medType, instruction: selectedInstructions, scanned: scannedText, index: i)
                                                alert = true
                                            }
                                        }
                                        dismiss()
                                    }
                                ]
                            )
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Drug Instructions")
            
            
            //            .sheet(isPresented: $liveScan, onDismiss: {
            //                showAlert = true
            //            }){
            //                LiveTextFromCameraScan(liveScan: $liveScan, scannedText: $scannedText, isScanned: $isScanned)
            ////                let x = print($isScanned)
            //
            //            }
            //            .alert("Check that the scanned instructions are correct. Edit instructions if needed.", isPresented: $showAlert){}
        }
        .sheet(isPresented: $liveScan, onDismiss: {
            showAlert = true
        }) {
            LiveTextFromCameraScan(liveScan: $liveScan, scannedText: $scannedText, isScanned: $isScanned)
        }

//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Alert"))
//        }
    }
}

struct AddDrugInstructions_Previews: PreviewProvider {
    static var previews: some View {
        AddDrugInstructions()
    }
}
