//
//  FileManager+Meds.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/22/23.
//

import Foundation
let fileName = "medications.json"

extension FileManager {
    
    func getMeds() -> [Med] {
        if let url = urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName, isDirectory: false) {
            if let jsondata = contents(atPath: url.path) {
                
                let decoder = JSONDecoder()
                do {
                    let items = try decoder.decode([Med].self, from: jsondata)
                    return items
                } catch { fatalError(error.localizedDescription) }
            }
        }
        
        return [Med]()
    }
    
    func saveMeds(items: [Med]) {
        if let url = urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName, isDirectory: false) {
            if fileExists(atPath: url.path) {
                do {
                    try removeItem(at: url)
                } catch { fatalError(error.localizedDescription) }
            }
            
            if let encodedData = try? JSONEncoder().encode(items) {
                createFile(atPath: url.path, contents: encodedData, attributes: nil)
            } else {
                fatalError("Couldn't write data!")
            }
        }
    }
}
