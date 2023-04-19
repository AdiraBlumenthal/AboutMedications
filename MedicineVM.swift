//
//  MedicineVM.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/22/23.
//

import Foundation
class MedicineVM: ObservableObject{
    @Published var meds: [Med]
    init(meds: [Med]) {
        self.meds = meds
    }
    
    func add(name: String, dose: String, type: String, instruction: String, scanned: String?, index: Int){
        meds.insert(Med(name: name, dose: dose, type: type, instruction: instruction, scanned: scanned), at: index)
    }
    
    func replace(name: String, dose: String, type: String, instruction: String, scanned: String?, index: Int){
        meds.remove(at: index)
//        print("remove", meds)
        meds.insert(Med(name: name, dose: dose, type: type, instruction: instruction, scanned: scanned), at: index)
//        print("insert", meds)
    }
    
    func move(from source: IndexSet, to destination: Int){
        meds.move(fromOffsets: source, toOffset: destination)
    }
    
    func remove(index: Int){
//        print(index)
        meds.remove(at: index)
    }
    
    func containstwo(name: String) -> Bool{
        var counter = 0
        for med in meds {
            if med.name == name{
                counter+=1
            }
            if counter >= 2{
                return true
            }
        }
        return false
    }
}
