//
//  DrugInstructionsVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/22/23.
//

import SwiftUI
import NaturalLanguage

struct DrugInstructionsVideoView: View {
    //Metformin
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @EnvironmentObject var medicineVM: MedicineVM
    @State var count = 0
    var body: some View {
        NavigationView(){
            if ASL && ASLwithCaptions{
                if medicineVM.meds.count <= 1{
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day with captions")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily with captions")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else{
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        } else{
                            Text("No instructions selected")
                        }
                    }
                } else {
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day with captions")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily with captions")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        }
                    }
                }
            }else if ASL && transcript{
                if medicineVM.meds.count <= 1{
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day with transcript")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily with transcript")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        } else{
                            Text("No instructions selected")
                        }
                    }
                } else {
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            Text("VIDEO OF MEDICATION INSTRUCTIONS")
//                            VStack{
//                                if let sentenceEmbedding = NLEmbedding.sentenceEmbedding(for: .english){
                                    let sentence = "Take 1 tablet daily as needed for migraines"
                            let sentence2 = drug.scanned
                            let x = print(sentence.levenshtein(sentence2 ?? ""))
//                                    if let vector = sentenceEmbedding.vector(for: sentence){
//                                        let x = print(vector)
//                                    }
//                                    let distance = sentenceEmbedding.distance(between: sentence, and: sentence2)
//                                    let y = print(distance.description)
//                                }
//                            }
                                
//                            if drug.instruction == "Take 1 tablet twice a day"{
//                                Text("Play Video 1 tab twice a day with transcript")
//                            } else if drug.instruction == "Take 1 tablet daily"{
//                                Text("Play video 1 tab daily with transcript")
//                            } else {
//                                Text("No instructions selected")
//                            }
                        }
                    }
                }
            } else if ASL {
                if medicineVM.meds.count <= 1{
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        } else{
                            Text("No instructions selected")
                        }
                    }
                } else {
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        }
                    }
                }
            } else {
                if medicineVM.meds.count <= 1{
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day with captions")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily with captions")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        } else{
                            Text("No instructions selected")
                        }
                    }
                } else {
                    ForEach(medicineVM.meds){ drug in
                        if drug.name == "Metformin"{
                            if drug.instruction == "Take 1 tablet twice a day"{
                                Text("Play Video 1 tab twice a day with captions")
                            } else if drug.instruction == "Take 1 tablet daily"{
                                Text("Play video 1 tab daily with captions")
                            } else if drug.instruction == ""{
                                Text("No instructions selected")
                            } else {
                                VStack{
                                    Text("Play video: ")
                                    Text(drug.scanned ?? "")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
    
    struct DrugInstructionsVideoView_Previews: PreviewProvider {
        static var previews: some View {
            DrugInstructionsVideoView()
                .environmentObject(MedicineVM(meds: [Med]()))
        }
    }
