//
//  AboutVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit

struct SideEffectsVideoView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    
    var body: some View {
        NavigationView{
        if ASL && ASLwithCaptions{
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminSEVid_HotFix", withExtension: "mp4")!))
//                    Text("video with captions")
            //Metformin information video with
        } else if ASL && transcript{
            VStack{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminSEVid_HotFix", withExtension: "mp4")!))
                ScrollView{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Side effects that you should report to your care team as soon as possible:")
                        Text("- Allergic reactions - skin rash, itching, hives, swelling of the face, lips, tongue, or throat")
                        Text("- High lactic acid level - muscle pain or cramps, stomach pain, trouble breathing, general discomfort or fatigue")
                        Text("- Low vitamin B12 level - pain, tingling, or numbness in the hands or feet, muscle weakness, dizziness, confusion, difficulty concentrating.")
                    }.padding(20)
                }
            }
            
        }else if ASL{
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminSEVid_HotFix", withExtension: "mp4")!))
//                    Text("ASL only")
            //Metformin information video
        } else{
            ScrollView{
                VStack(alignment: .leading, spacing: 8){
                    Text("Side effects that you should report to your care team as soon as possible:")
                    //                    .multilineTextAlignment(.leading)
                        .font(.title2)
                        .lineSpacing(10)
                    //                    .padding(20)
                    Text("- Allergic reactions - skin rash, itching, hives, swelling of the face, lips, tongue, or throat")
                        .font(.title2)
                        .lineSpacing(10)
                    //                    .multilineTextAlignment(.leading)
                    //                    .padding([.leading,.trailing], 20)
                    //                    .padding([.bottom, .top], 10)
                    Text("- High lactic acid level - muscle pain or cramps, stomach pain, trouble breathing, general discomfort or fatigue")
                        .font(.title2)
                        .lineSpacing(10)
                    //                    .multilineTextAlignment(.leading)
                    //                    .padding([.leading,.trailing], 20)
                    //                    .padding([.bottom, .top], 10)
                    Text("- Low vitamin B12 level - pain, tingling, or numbness in the hands or feet, muscle weakness, dizziness, confusion, difficulty concentrating.")
                        .font(.title2)
                        .lineSpacing(10)
                    //                    .multilineTextAlignment(.leading)
                    //                    .padding([.leading,.trailing], 20)
                    //                    .padding([.bottom, .top], 10)
                }
                .padding(20)
            }
        }
    }
        .navigationTitle("Serious Side Effects")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
}
}


struct SideEffectsVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SideEffectsVideoView()
    }
}


