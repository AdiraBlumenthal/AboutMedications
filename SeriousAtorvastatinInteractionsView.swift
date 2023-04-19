//
//  SeriousAtorvastatinInteractionsView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI

struct SeriousAtorvastatinInteractionsView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    
    var body: some View {
        NavigationView{
            if ASLwithCaptions{
//                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "diabeteVid_HotFix", withExtension: "mp4")!))
                Text("video with captions (serious interaction) doesn't exist yet!!")
                //Metformin information video with
            } else if ASL{
//                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Diabetes Info", withExtension: "MOV")!))
                    Text("ASL only video (serious interaction) doesn't exist yet!!")
                //Metformin information video
            } else{
                Text("Atorvastatin may cause liver problems and using it with substantial quantities of ethanol may increase that risk. You should limit the use of alcohol while being treated with these medications. Call your doctor immediately if you have fever, chills, joint pain or swelling, unusual bleeding or bruising, skin rash, itching, loss of appetite, fatigue, nausea, vomiting, abdominal pain, dark urine, pale stools, and/or yellowing of the skin or eyes, as these may be signs and symptoms of liver damage. Talk to your doctor or pharmacist if you have any questions or concerns. It is important to tell your doctor about all other medications you use, including vitamins and herbs. Do not stop using any medications without first talking to your doctor.")
                    .multilineTextAlignment(.leading)
                    .padding(20)
            }
        }
    }
}

struct SeriousAtorvastatinInteractionsView_Previews: PreviewProvider {
    static var previews: some View {
        SeriousAtorvastatinInteractionsView()
    }
}
