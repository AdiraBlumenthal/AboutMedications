//
//  MedicationsView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit

struct MedicationsView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @EnvironmentObject var medicineVM: MedicineVM
    @State var editInstruction = false
    @State var firstEdit = false
    @State var addMed = false
    @State var firstLoad = true
    //    @AppStorage("medType") var medType = ""
    //    @AppStorage("dosage") var dosage = ""
    //    @AppStorage("savedText") var savedText = ""
    //    @AppStorage("savedTextWithID") var savedTextID = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(){
                    Text("Your Conditions")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    NavigationLink{
                        AboutConditionsVideoView()
                    }label: {
                        Text("Diabetes, Type 2")
                    }.padding([.top, .bottom], 10)
                    
                    NavigationLink{
                        AboutConditionsVideoView2()
                    }label: {
                        Text("High Cholesterol")
                    }.padding([.top, .bottom], 10)
                }
                Section(){
                    HStack{
                        Text("Your Medications")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .trailing], 8)
                            .padding([.top, .bottom], 20)
                        Button {
                            addMed = true
                        } label: {
                            Text("Edit")
                        }
                        
                        
                    }
                    
                    NavigationLink{
                        //                        AboutVideoView()
                        MetforminView()
                    }label: {
                        HStack{
                            Image("metformin")
                                .resizable()
                                .frame(width: 80, height:80)
                                .cornerRadius(15)
                                .padding(.trailing, 20)
                            VStack(alignment: .leading, spacing: 8){
                                Text("Metformin")
                                    .font(.title2)
                                ForEach(medicineVM.meds){ drug in
                                    let x = print(drug)
                                    if drug.name == "Metformin"{
                                        Text(drug.dose ?? "")
                                        Text(drug.type ?? "")
                                    }
                                }
                            }
                        }
                    }
                    NavigationLink{
                        //                        AboutVideoView2()
                        AtorvastatinView()
                    }label: {
                        HStack{
                            Image("atrovastatin")
                                .resizable()
                                .frame(width: 80, height:90)
                                .cornerRadius(15)
                                .padding(.trailing, 20)
                            VStack(alignment: .leading, spacing: 8){
                                Text("Atorvastatin")
                                    .font(.title2)
                                ForEach(medicineVM.meds){ drug in
                                    if drug.name == "Atorvastatin"{
                                        Text(drug.dose ?? "")
                                        Text(drug.type ?? "")
                                    }
                                }
                            }
                        }
                    }
                }
                Section(){
                    Button {
                        addMed = true
                    } label: {
                        Text("Add Medication")
                    }
                    
                }
                Section(){
                    NavigationLink{
                        InteractionsView()
                    } label: {
                        VStack{
                            Text("Medication Interactions").padding([.bottom],5).bold()
                            Text("1 Critical, 1 Serious")
                        }
                        
                    }
                }
            }
            .onAppear{
                if firstLoad{
//                    let x = print(medicineVM)
//                    let y = print(medicineVM.meds.count)
//                    medicineVM.remove(index: 0)
//                    medicineVM.remove(index: 0)
                    for i in 0..<medicineVM.meds.count{
                        medicineVM.remove(index: 0)
                    }
                }
                firstLoad = false
            }
            .navigationBarTitle("Medications")
        }
        .sheet(isPresented: $addMed){
            AddMedication()
        }
        //        .sheet(isPresented: $editInstruction){
        //            AddDrugInstructions()
        //        }
    }
}

struct MedicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsView()
            .environmentObject(MedicineVM(meds: [Med]()))
    }
}
