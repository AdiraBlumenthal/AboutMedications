//
//  SeriousMetforminInteractionView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI
import AVKit

struct CriticalStatinInteractionView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinInteractionsComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "AtorvastatinInteractions", ofType: "srt")!), encoding: .utf8)
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
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinInteractionsComposited", withExtension: "mp4")!))
                    Text("Side effects from Atorvastatin may get worse if you drink grapefruit juice. Do not take Atorvastatin with grapefruit juice. Discuss with your health care provider why Atorvastatin and grapefruit juice should not be taken together. Orange juice is safe to drink with Atorvastatin. Contact your prescriber immediately if you experience unexplained muscle aches, muscle pain or tenderness, general weakness or fatigue, side or back pain, or decreased urination while taking Atorvastatin.")
                        .padding(20)
                }
            } else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinInteractionsComposited", withExtension: "mp4")!))
            } else{
                ScrollView{
                    Text("Side effects from Atorvastatin may get worse if you drink grapefruit juice. Do not take Atorvastatin with grapefruit juice. Discuss with your health care provider why Atorvastatin and grapefruit juice should not be taken together. Orange juice is safe to drink with Atorvastatin. Contact your prescriber immediately if you experience unexplained muscle aches, muscle pain or tenderness, general weakness or fatigue, side or back pain, or decreased urination while taking Atorvastatin.")
                        .padding(20)
                        .font(.title2)
                        .lineSpacing(10)
                }
            }
            
        }
        .navigationTitle("Interactions")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct CriticalStatinInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        CriticalStatinInteractionView()
    }
}
