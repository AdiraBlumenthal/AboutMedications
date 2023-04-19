//
//  ModerateMetforminInteractionView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI

struct ModerateMetforminInteractionView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    
    var body: some View {
        NavigationView{
            if ASLwithCaptions{
                //            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminVid_HotFix", withExtension: "mp4")!))
                Text("Interactions information (moderate) video with captions -- does not exist yet!")
                
            } else if ASL{
                //            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Metformin Purpose", withExtension: "MOV")!))
                Text("Interactions information (moderate) video -- does not exist yet!")
            } else{
                VStack(alignment: .leading, spacing: 8){
                    Text("Critical")
                        .bold()
                        .font(.title2)
                        .padding([.leading, .trailing], 30)
                    Text("Do not take this combination together. Contact your doctor, pharmacist, or care team to discuss this combination. Sever or life-threatening side effects may occur or your medication may not work as well. In rare cases, they may be taken together with specifc approval from your care team.")
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom, 10)
                    Text("Serious")
                        .bold()
                        .font(.title2)
                        .padding([.leading, .trailing], 30)
                    Text("Discuss this combination with your care team. Taking them together may casue significant side effects or cause your medications to not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch from when taking this combination.")
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom, 10)
                    Text("Moderate")
                        .bold()
                        .font(.title2)
                        .padding([.leading, .trailing], 30)
                    Text("In certain cases, this combination may be taken together. When taken togheter, side effects may occur or your medications may not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch for when taking this combination.")
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 30)
                }
            }
            
        }
    }
}

struct ModerateMetforminInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        ModerateMetforminInteractionView()
    }
}
