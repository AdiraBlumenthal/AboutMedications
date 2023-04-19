//
//  MetforminView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/29/23.
//

import SwiftUI

struct MetforminView: View {
    @EnvironmentObject var medicineVM: MedicineVM
    @AppStorage("selectedMedication") var selectedMedication = ""
    @AppStorage("selectedInstructions") var selectedInstructions = ""
    @AppStorage("inputMethod") var inputMethod = ""
    @State var edit = false
//    @AppStorage("medType") var medType = ""
//    @AppStorage("dosage") var dosage = ""
    var body: some View {
            Form{
                Section{
                    VStack(alignment: .leading, spacing: 8){
                        Image("metformin")
                            .resizable()
                            .frame(width: 80, height:80)
                            .cornerRadius(15)
                            .padding(.trailing, 20)
                        Text("Metformin")
                            .font(.title2)
                        ForEach(medicineVM.meds){ drug in
                            if drug.name == "Metformin"{
                                Text(drug.dose ?? "")
                                Text(drug.type ?? "")
                            }
                        }
                        NavigationLink{
                            DrugInstructionsVideoView()
                        } label: {
                            VStack(alignment: .leading, spacing: 8){
                                Text("Instructions").bold()
                                ForEach(medicineVM.meds){ drug in
                                    if drug.name == "Metformin"{
                                        if drug.instruction != ""{
                                            Text(drug.instruction)
                                        }else if let scan = drug.scanned{
                                            Text(scan)
                                        }
                                    }
                                }
                            }
                        }
                    }
                } header: {
                    HStack{
                        Text("Details")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Button {
                            edit = true 
                        } label: {
                            Text("Edit")
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                }.headerProminence(.increased)
                
                Section(){
                    NavigationLink{
                        AboutVideoView()
                    } label: {
                        Text("About Metformin")
                    }
                }
                
                Section(){
                    NavigationLink{
                        SideEffectsMildVideoView()
                    } label: {
                        Text("Common Side Effects")
                    }
                }
                
                Section(){
                    NavigationLink{
                        SideEffectsVideoView()
                    } label: {
                        Text("Serious Side Effects")
                    }
                }
                
                Section(){
                    NavigationLink(){
                        InteractionsView()
                    } label: {
                        VStack{
                            Text("Medication Interactions").padding(.bottom, 5)
                            Text("1 serious")
                        }
                        
                    }
                }
            }.navigationTitle("Metformin")
            .sheet(isPresented: $edit){
                AddMedication()
            }
        }
    }

struct MetforminView_Previews: PreviewProvider {
    static var previews: some View {
        MetforminView()
    }
}
