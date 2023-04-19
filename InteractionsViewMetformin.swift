//
//  InteractionsViewMetformin.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI
import AVKit

struct InteractionsViewMetformin: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    
    var body: some View {
        NavigationView{
            if ASLwithCaptions{
//                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "diabeteVid_HotFix", withExtension: "mp4")!))
                Text("video with captions doesn't exist yet!!")
                //Metformin information video with
            } else if ASL{
//                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Diabetes Info", withExtension: "MOV")!))
                    Text("ASL only video doesn't exist yet!!")
                //Metformin information video
            } else{
                Text("MetFORMIN should be taken with meals, and excessive alcohol intake (either short-term binge drinking or frequent consumption) should be avoided during treatment. Taking metFORMIN with alcohol may increase the risk of a rare but serious and potentially life-threatening condition known as lactic acidosis, which is a buildup of lactic acid in the blood that can occasionally occur during treatment with metformin-containing products. Lactic acidosis is more likely to occur if you have kidney or liver disease, acute or unstable congestive heart failure, or dehydration.")
                    .multilineTextAlignment(.leading)
                    .padding(20)
            }
        }
        .navigationTitle("Interactions")
    }
}

struct InteractionsViewMetformin_Previews: PreviewProvider {
    static var previews: some View {
        InteractionsViewMetformin()
    }
}
