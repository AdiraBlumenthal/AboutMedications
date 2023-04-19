//
//  CamTextVM.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 3/13/23.
//

import Foundation
class CamTextVM: ObservableObject{
    @Published var camText: [CamText]
    init(camText: [CamText]) {
        self.camText = camText
    }
    
    func add(name: String, text: String, index: Int){
        camText.insert(CamText(name: name, text: text), at: index)
    }
    
    func replace(name: String, text: String, index: Int){
        camText.remove(at: index)
//        print("remove", meds)
        camText.insert(CamText(name: name, text: text), at: index)
//        print("insert", meds)
    }
    
    func move(from source: IndexSet, to destination: Int){
        camText.move(fromOffsets: source, toOffset: destination)
    }
    
    func remove(index: Int){
//        print(index)
        camText.remove(at: index)
    }
    
    func containstwo(name: String) -> Bool{
        var counter = 0
        for camText in camText {
            if camText.name == name{
                counter+=1
            }
            if counter >= 2{
                return true
            }
        }
        return false
    }
}
