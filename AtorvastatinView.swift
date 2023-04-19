//
//  AtorvastatinView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/29/23.
//

import SwiftUI

struct AtorvastatinView: View {
    @EnvironmentObject var medicineVM: MedicineVM
    @AppStorage("selectedMedication") var selectedMedication = ""
    @AppStorage("selectedInstructions") var selectedInstructions = ""
    @AppStorage("inputMethod") var inputMethod = ""
    @State var edit = false
    var body: some View {
        Form{
            Section{
                VStack(alignment: .leading, spacing: 8){
                    Image("atrovastatin")
                        .resizable()
                        .frame(width: 80, height:90)
                        .cornerRadius(15)
                        .padding(.trailing, 20)
                    Text("Atorvastatin")
                        .font(.title2)
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Atorvastatin"{
                            Text(drug.dose ?? "")
                            Text(drug.type ?? "")
                        }
                    }
                    NavigationLink{
                        DrugInstructionsVideoViewA()
                    } label: {
                        VStack(alignment: .leading, spacing: 8){
                            Text("Instructions").bold()
                            ForEach(medicineVM.meds){ drug in
                                if drug.name == "Atorvastatin"{
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
                    AboutVideoView2()
                } label: {
                    Text("About Atorvastatin")
                }
            }
            
            Section(){
                NavigationLink{
                    SideEffectsMildVideoView2()
                } label: {
                    Text("Common Side Effects")
                }
            }
            
            Section(){
                NavigationLink{
                    SideEffectsVideoView2()
                } label: {
                    Text("Serious Side Effects")
                }
            }
            
            Section(){
                NavigationLink(){
                    InteractionsView()
                } label: {
                    VStack{
                        Text("Medication Interactions").padding(.bottom, 5).bold()
                        Text("1 critical")
                    }
                    
                }
            }
        }.navigationTitle("Atorvastatin")
        .sheet(isPresented: $edit){
            AddMedication()
        }
    }
}

struct AtorvastatinView_Previews: PreviewProvider {
    static var previews: some View {
        AtorvastatinView()
    }
}
