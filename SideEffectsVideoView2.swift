//
//  AboutVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit

struct SideEffectsVideoView2: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinSeriousSideEffectsComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "AtorvastatinSeriousSideEffects", ofType: "srt")!), encoding: .utf8)
        timeObserver = PlayerTimeObserver(player: avplayer)
    }
    var body: some View {
        NavigationView{
            if ASL && ASLwithCaptions{
                VideoPlayer(player: avplayer) {
                    VStack {
                        Spacer()
                        Spacer()
                        Text(currentText)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                            .onReceive(timeObserver.publisher) { time in
                                currentText = parser?.searchSubtitles(at: time) ?? ""
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }.ignoresSafeArea()
            } else if ASL && transcript{
                VStack{
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinSeriousSideEffectsComposited", withExtension: "mp4")!))
                    ScrollView{
                        VStack(alignment: .leading, spacing: 8){
                            Text("Side effects that you should report to your care team as soon as possible:")
                            Text("- Allergic reactions - skin rash, itching, hives, swelling of the face, lips, tongue, or throat")
                            Text("- High blood sugar (hyperglycemia) - increased thirst or amount of urine, unusual weakness, fatigue, blurry vision")
                            Text("- Liver injury - right upper belly pain, loss of appetite, nausea, light-colored stool, dark yellow or brown urine, yellowing skin or eyes, usual weakness, fatigue")
                            Text("- Muscle injury - unusual weakness, fatigue, muscle pain, dark yellow or brown urine, decreased in amount of urine")
                            Text("- Redness, blistering, peeling, or loosening of the skin, including inside of the mouth")
                        }
                        .padding(20)
                    }
                }
                
            } else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinSeriousSideEffectsComposited", withExtension: "mp4")!))
                Text("ASL only")
                //Metformin information video
            } else{
                ScrollView{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Side effects that you should report to your care team as soon as possible:")
                            .font(.title2)
                            .lineSpacing(10)
                        Text("- Allergic reactions - skin rash, itching, hives, swelling of the face, lips, tongue, or throat")
                            .font(.title2)
                            .lineSpacing(10)
                        Text("- High blood sugar (hyperglycemia) - increased thirst or amount of urine, unusual weakness, fatigue, blurry vision")
                            .font(.title2)
                            .lineSpacing(10)
                        Text("- Liver injury - right upper belly pain, loss of appetite, nausea, light-colored stool, dark yellow or brown urine, yellowing skin or eyes, usual weakness, fatigue")
                            .font(.title2)
                            .lineSpacing(10)
                        Text("- Muscle injury - unusual weakness, fatigue, muscle pain, dark yellow or brown urine, decreased in amount of urine")
                            .font(.title2)
                            .lineSpacing(10)
                        Text("- Redness, blistering, peeling, or loosening of the skin, including inside of the mouth")
                            .font(.title2)
                            .lineSpacing(10)
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


struct SideEffectsVideoView2_Previews: PreviewProvider {
    static var previews: some View {
        SideEffectsVideoView2()
    }
}


